package com.siemens.osa.module.cs;

import com.siemens.osa.data.cs.entity.ResultInfo;
import com.siemens.osa.data.cs.module.ResultService;
import com.siemens.osa.module.cs.entity.hostResult;
import com.siemens.osa.module.cs.entity.resultReport;
import com.siemens.osa.module.cs.service.generateReport.impl.GenerateReportServiceImpl;
import com.siemens.osa.module.cs.service.getCS.impl.GetResultServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class GenerateReportTest {
    @Autowired
    private ResultService resultService;

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
        GetResultServiceImpl getResultService = new GetResultServiceImpl(resultService);
        GenerateReportServiceImpl generateReportService = new GenerateReportServiceImpl(resultService);

        resultReport resultReport = generateReportService.generateInstantReport();
        System.out.println(resultReport);
        List<hostResult> failedHost = resultReport.getFailedHost();
        for (hostResult hostResult : failedHost) {
            List<ResultInfo> resultByHostIpTime = getResultService.GetResultByHostIpTime(hostResult.getHostIp(), resultReport.getCollectTime());
            for (ResultInfo resultInfo : resultByHostIpTime) {
                System.out.println(resultInfo);
            }
        }
    }

    @Test
    public void testGenerateCircleReport(){
        GenerateReportServiceImpl generateReportService = new GenerateReportServiceImpl(resultService);
        List<resultReport> resultReportList = generateReportService.generateCircleReport(beginTime, endTime, zone, multiple);
        for (resultReport resultReport : resultReportList) {
            System.out.println(resultReport);
        }
    }
}
