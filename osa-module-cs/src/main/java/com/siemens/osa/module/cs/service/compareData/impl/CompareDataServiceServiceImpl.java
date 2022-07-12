package com.siemens.osa.module.cs.service.compareData.impl;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import com.siemens.osa.data.cs.mapper.ConfigInfoMapper;
import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import com.siemens.osa.data.es.Service.GetData.impl.GetESInfoServiceImpl;
import com.siemens.osa.data.es.entity.ESInfo;
import com.siemens.osa.module.cs.service.compareData.ICompareDataService;
import com.siemens.osa.module.cs.service.getCS.impl.GetConfigServiceImpl;
import com.siemens.osa.module.cs.service.getCS.impl.InsertResultServiceServiceImpl;
import com.siemens.osa.module.cs.service.getES.impl.GetESServiceImpl;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class CompareDataServiceServiceImpl implements ICompareDataService {
    private GetESInfoServiceImpl esInfoGetService;
    private ConfigInfoMapper configInfoMapper;
    private ResultInfoMapper resultInfoMapper;

    public  CompareDataServiceServiceImpl(GetESInfoServiceImpl esInfoGetService, ConfigInfoMapper configInfoMapper, ResultInfoMapper resultInfoMapper) {
        this.esInfoGetService = esInfoGetService;
        this.configInfoMapper = configInfoMapper;
        this.resultInfoMapper = resultInfoMapper;
    }

    public CompareDataServiceServiceImpl() {
    }

    @Override
    public void compareData() throws UnknownHostException {
        GetESServiceImpl getESService = new GetESServiceImpl(esInfoGetService);
        GetConfigServiceImpl getConfigService = new GetConfigServiceImpl(configInfoMapper);
        InsertResultServiceServiceImpl insertResultServiceService = new InsertResultServiceServiceImpl(resultInfoMapper);

        // TODO 过滤时间
        //获取ES数据库
        List<ESInfo> esInfoList = getESService.getES();
        //获取ES结果中配置文件版本ID
        Integer id = esInfoList.get(0).getID();
        //根据配置文件ID获取数据库配置文件
        Map<String, ConfigInfo> configInfoMap = configInfoMapper.getConfigById(id);

        for (ESInfo esInfo : esInfoList) {
            String status="pass";
            String hostAddress = InetAddress.getLocalHost().getHostAddress();
            Timestamp time= new Timestamp(System.currentTimeMillis());

            //若ES中配置文件id不同，可以获取对应的配置文件
            if (esInfo.getID() != id) {
                id=esInfo.getID();
                configInfoMap = configInfoMapper.getConfigById(id);
            }
            //根据结果ruleID获取对应的config配置信息
//            System.out.println("before");
            ConfigInfo configInfo = configInfoMap.get(esInfo.getRuleID());
//            System.out.println(configInfo);
            Integer type = configInfo.getType();
            String[] data = configInfo.getData();
            //获取ES对应ruleID检查项的结果
            List<String> result = esInfo.getResult();
            if (type == 1) {
                for (String re : result) {
                    List<String> strings = StringFilter(re);
                    System.out.println(strings+"$$$");
                    for (int i = 0; i < strings.size(); i++) {
                        if(!strings.get(i).trim().equals(data[i]))
                        {
                            System.out.println("##################");
                            System.out.println(strings.get(i).trim());
                            System.out.println(data[i]);
                            System.out.println("##################");
                            status="failed";
                            break;
                        }
                    }
                    if(status.equals("failed"))
                        break;
                }
                insertResultServiceService.insertResult(time,id,configInfo.getOs(),hostAddress,esInfo.getHostIp(),esInfo.getRuleID(),Arrays.asList(configInfo.getData()),esInfo.getResult(),status);
            } else {
                if ((result.size() == 0 && data != null) || (result.size() != 0 && data == null)) {
                    status="failed";
                    System.out.println("failed");
                } else {
                    for (int i = 0; i < result.size(); i++) {
//                        // es 字符串读出带有引号
//                        if (configInfo.getOs().equals("windows10") && result.get(i).contains("\""))
//                            data[i] = '"' + data[i] + '"';
                        result.set(i, result.get(i).replace("\"", ""));

                        if (!result.get(i).trim().equals(data[i])) {
                            System.out.println("##################");
                            System.out.println(result.get(i).trim());
                            System.out.println(data[i]);
                            System.out.println("##################");
                            status = "failed";
                            continue;
                        }
                    }
                }

                if (configInfo.getData() != null && esInfo.getResult().size() != 0)
                    insertResultServiceService.insertResult(time,id,configInfo.getOs(),hostAddress,esInfo.getHostIp(),
                            esInfo.getRuleID(),Arrays.asList(configInfo.getData()), esInfo.getResult(),status);
                else if (configInfo.getData() == null && esInfo.getResult().size() == 0){
                    insertResultServiceService.insertResult0(time,id,configInfo.getOs(),hostAddress,esInfo.getHostIp(),
                            esInfo.getRuleID(),status);
                } else if (configInfo.getData() == null)
                    insertResultServiceService.insertResult2(time,id,configInfo.getOs(),hostAddress,esInfo.getHostIp(),
                            esInfo.getRuleID(),esInfo.getResult(),status);
                else
                    insertResultServiceService.insertResult1(time,id,configInfo.getOs(),hostAddress,esInfo.getHostIp(),
                            esInfo.getRuleID(),Arrays.asList(configInfo.getData()),status);
            }
        }
    }

    public List<String> StringFilter(String string) {
        String[] split = string.split("\n");
        List<String> strings = null;
        for (String str : split) {
            if (str.contains("权限") | str.contains("Access")) {
                String s1 = str.replaceAll("\\D", " ");
//                System.out.println(str);
                String s2 = s1.trim().replaceAll("\\s{1,}", " ");
//                System.out.println(s2);
                String[] s3 = s2.split(" ");
//                for (String s4 : s3) {
//                    System.out.println(s4);
//                }
                strings = Arrays.asList(s3);
            }
        }
        return strings;
    }
}
