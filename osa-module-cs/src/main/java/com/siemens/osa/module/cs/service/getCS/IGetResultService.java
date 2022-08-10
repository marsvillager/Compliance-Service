package com.siemens.osa.module.cs.service.getCS;

import com.siemens.osa.data.cs.entity.ConfigInfo;
import com.siemens.osa.data.cs.entity.ResultInfo;

import java.util.List;

public interface IGetResultService {
    List<ResultInfo> getResult();
}
