package com.siemens.osa.module.cs.service.getES;

import com.siemens.osa.data.es.entity.ESInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IGetESService {
    List<ESInfo> getES();
}
