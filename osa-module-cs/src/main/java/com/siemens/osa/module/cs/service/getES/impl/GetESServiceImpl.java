package com.siemens.osa.module.cs.service.getES.impl;

import com.siemens.osa.data.es.Service.GetData.impl.GetESInfoServiceImpl;
import com.siemens.osa.data.es.entity.ESInfo;
import com.siemens.osa.module.cs.service.getES.IGetESService;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class GetESServiceImpl implements IGetESService {
    private GetESInfoServiceImpl esInfoGetService;

    public GetESServiceImpl() {
    }

    public GetESServiceImpl(GetESInfoServiceImpl esInfoGetService) {
        this.esInfoGetService = esInfoGetService;
    }

    @Override
    public List<ESInfo> getES() {
        try {
            return esInfoGetService.getAllConfig();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
