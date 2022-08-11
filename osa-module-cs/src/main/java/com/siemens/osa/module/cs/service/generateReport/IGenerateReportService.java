package com.siemens.osa.module.cs.service.generateReport;

import com.siemens.osa.module.cs.entity.resultReport;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IGenerateReportService {
    resultReport generateInstantReport();

    List<resultReport> generateCircleReport(String beginTime, String endTime, String zone, Integer multiple);
}
