package com.siemens.osa.data.cs.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "result")
public class ResultInfo {
    @Id
    @GeneratedValue
    private String timestamp;

    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "os", nullable = false)
    private String os;

    @Column(name = "serverip", nullable = false)
    private String serverIP;

    @Column(name = "hostip", nullable = false)
    private String hostIP;

    @Column(name = "ruleid", nullable = false)
    private String ruleId;

    @Column(name = "expected")
    private String expected;

    @Column(name = "actual")
    private String actual;

    @Column(name = "status")
    private String status;
}
