package com.siemens.osa.data.cs.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "config")
public class ConfigInfo {
    @Id
    @GeneratedValue
    private String timestamp;

    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "os", nullable = false)
    private String os;

    @Column(name = "ruleid", nullable = false)
    private String ruleId;

    @Column(name = "data")
    private String data;

    @Column(name = "type")
    private Integer type;

    @Column(name = "param")
    private String params;
}
