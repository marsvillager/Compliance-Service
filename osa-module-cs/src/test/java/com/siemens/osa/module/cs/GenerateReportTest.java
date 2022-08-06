package com.siemens.osa.module.cs;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import com.siemens.osa.module.cs.entity.hostResult;
import com.siemens.osa.module.cs.entity.resultReport;
import com.siemens.osa.module.cs.service.generateReport.impl.GenerateReportServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class GenerateReportTest {
    @Autowired
    ResultInfoMapper resultInfoMapper;

    @Value("${circle.beginTime}")
    String beginTime;

    @Value("${circle.endTime}")
    String endTime;

    @Value("${circle.zone}")
    String zone;

    @Value("${circle.multiple}")
    Integer multiple;

    @Test
    public void testGenerateInstantReport(){
        GenerateReportServiceImpl generateReportService = new GenerateReportServiceImpl(resultInfoMapper);
        resultReport resultReport = generateReportService.generateInstantReport();
        System.out.println(resultReport);
        List<hostResult> failedHost = resultReport.getFailedHost();
        for (hostResult hostResult : failedHost) {
            List<ResultInfo> resultByHostIpTime = resultInfoMapper.getResultByHostIpTime(hostResult.getHostIp(), resultReport.getCollectTime());
            for (ResultInfo resultInfo : resultByHostIpTime) {
                System.out.println(resultInfo);
            }
        }
    }

    @Test
    public void testGenerateCircleReport(){
        GenerateReportServiceImpl generateReportService = new GenerateReportServiceImpl(resultInfoMapper);
        List<resultReport> resultReportList = generateReportService.generateCircleReport(beginTime, endTime, zone, multiple);
        for (resultReport resultReport : resultReportList) {
            System.out.println(resultReport);
        }
    }
}
