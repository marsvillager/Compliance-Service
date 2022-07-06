package com.siemens.osa.data.es.Service.GetData;

import com.siemens.osa.data.es.entity.ESInfo;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.List;

@Repository
public interface IESInfoGetService {
    List<ESInfo> getAllConfig() throws IOException;
}
