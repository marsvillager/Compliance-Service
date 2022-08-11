package com.siemens.osa.data.cs.entity;

import com.vladmihalcea.hibernate.type.array.IntArrayType;
import com.vladmihalcea.hibernate.type.array.StringArrayType;
import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import com.vladmihalcea.hibernate.type.json.JsonStringType;
import lombok.Data;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

import javax.persistence.*;

@Entity
@Data
@Table(name = "config")
@TypeDefs({
        @TypeDef(name = "string-array", typeClass = StringArrayType.class),
        @TypeDef(name = "int-array", typeClass = IntArrayType.class),
        @TypeDef(name = "json", typeClass = JsonStringType.class),
        @TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)
})
public class ConfigInfo {
    @Id
        @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private long cid;

    @Column(name = "timestamp", nullable = false)
    private String timestamp;

    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "os")
    private String os;

    @Column(name = "lang")
    private String lang;

    @Column(name = "rule_id", nullable = false)
    private String ruleId;

    @Column(name = "data")
    @Type(type = "string-array")
    private String[] data;

    @Column(name = "type")
    private Integer type;

    @Column(name = "param")
    @Type(type = "string-array")
    private String[] params;
}
