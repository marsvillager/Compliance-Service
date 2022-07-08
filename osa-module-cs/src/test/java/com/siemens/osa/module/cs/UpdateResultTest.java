package com.siemens.osa.module.cs;

import com.siemens.osa.data.cs.mapper.ResultInfoMapper;
import com.siemens.osa.module.cs.service.getCS.impl.UpdateResultServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class UpdateResultTest {
    @Autowired
    ResultInfoMapper resultInfoMapper;

    @Test
    public void testUpdateResult() {
        UpdateResultServiceImpl updateResultService = new UpdateResultServiceImpl(resultInfoMapper);

        int id = 2;
        String[] actual = new String[]{"1"};
        updateResultService.updateResult(id, "BL696_0461", actual, "pass");
    }
}
