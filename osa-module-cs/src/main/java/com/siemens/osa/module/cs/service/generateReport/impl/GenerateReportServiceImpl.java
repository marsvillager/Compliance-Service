package com.siemens.osa.module.cs.service.generateReport.impl;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.module.ResultService;
import com.siemens.osa.module.cs.entity.hostResult;
import com.siemens.osa.module.cs.entity.resultReport;
import com.siemens.osa.module.cs.service.generateReport.IGenerateReportService;
import com.siemens.osa.module.cs.service.getCS.impl.GetResultServiceImpl;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.*;

@Service
public class GenerateReportServiceImpl implements IGenerateReportService {
    private ResultService resultService;

    public GenerateReportServiceImpl() {
    }

    public GenerateReportServiceImpl(ResultService resultService) {
        this.resultService = resultService;
    }

    @Override
    public resultReport generateInstantReport() {
        GetResultServiceImpl getResultService = new GetResultServiceImpl(resultService);
        List<ResultInfo> recentResult = getResultService.GetRecentResult();
        return getResultReport(recentResult);
    }

    @Override
    public List<resultReport> generateCircleReport(String beginTime, String endTime, String zone, Integer multiple) {
        GetResultServiceImpl getResultService = new GetResultServiceImpl(resultService);

        //change to Timestamp
        Timestamp beginTimeStamp = Timestamp.valueOf(beginTime);
        Timestamp endTimeStamp = Timestamp.valueOf(endTime);
        //change to Calendar
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(beginTimeStamp.getTime());
        Calendar endCalendar = Calendar.getInstance();
        endCalendar.setTimeInMillis(endTimeStamp.getTime());
        //get filed
        Integer filed = getFiled(zone);

        List<resultReport> resultReportList = new LinkedList<>();
        while (calendar.before(endCalendar)) {
            Timestamp startTime = new Timestamp(calendar.getTimeInMillis());
            calendar.add(filed,multiple);
            Timestamp terminalTime = new Timestamp(calendar.getTimeInMillis());
            if (!calendar.before(endCalendar))
                terminalTime = new Timestamp(endCalendar.getTimeInMillis());
            List<ResultInfo> recentResultWithZone = getResultService.GetRecentResultWithZone(startTime, terminalTime);
            if (recentResultWithZone.size() != 0) {
                resultReport resultReport = getResultReport(recentResultWithZone);
                resultReportList.add(resultReport);
            }
        }
        return resultReportList;
    }

    public resultReport getResultReport(List<ResultInfo> recentResult) {
        Map<String, hostResult> hostResults=new HashMap<>();
        resultReport resultReport = new resultReport();
        List<hostResult> passList = new LinkedList<>();
        List<hostResult> failedList = new LinkedList<>();
        Timestamp collectTime = recentResult.get(0).getTimestamp();
        for (ResultInfo resultInfo : recentResult) {
            String hostIp = resultInfo.getHostIP();
            if (!hostResults.containsKey(hostIp)) {
                hostResult hostResult = new hostResult();
                hostResult.setHostIp(hostIp);
                hostResults.put(hostIp,hostResult);
            }
            if (resultInfo.getStatus().equals("pass"))
                hostResults.get(hostIp).passNumUp();
            else if (resultInfo.getStatus().equals("failed"))
                hostResults.get(hostIp).failedNumUp();
        }
        for (String s : hostResults.keySet()) {
            hostResult hostResult = hostResults.get(s);
            if (hostResult.getFailedNum()!=0) {
                resultReport.failedHostNumUp();
                failedList.add(hostResult);
            } else {
                resultReport.passHostNumUp();
                passList.add(hostResult);
            }
        }
        resultReport.setCollectTime(collectTime);
        resultReport.setFailedHost(failedList);
        resultReport.setPassHost(passList);
        return resultReport;
    }

    public Integer getFiled(String zone) {
        switch (zone) {
            case "year":
                return Calendar.YEAR;
            case "month":
                return Calendar.MONTH;
            case "date":
                return Calendar.DAY_OF_YEAR;
            case "hour":
                return Calendar.HOUR_OF_DAY;
            case "minute":
                return Calendar.MINUTE;
            case "second":
                return Calendar.SECOND;
        }
        return Calendar.DAY_OF_YEAR;
    }
}
