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
@Table(name = "result")
@TypeDefs({
        @TypeDef(name = "string-array", typeClass = StringArrayType.class),
        @TypeDef(name = "int-array", typeClass = IntArrayType.class),
        @TypeDef(name = "json", typeClass = JsonStringType.class),
        @TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)
})
public class ResultInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long rid;

    @Column(name = "timestamp", nullable = false)
    private String timestamp;

    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "os", nullable = false)
    private String os;

    @Column(name = "lang")
    private String lang;

    @Column(name = "server_ip", nullable = false)
    private String serverIP;

    @Column(name = "host_ip", nullable = false)
    private String hostIP;

    @Column(name = "rule_id", nullable = false)
    private String ruleId;

    @Column(name = "expected")
    @Type(type = "string-array")
    private String[] expected;

    @Column(name = "actual")
    @Type(type = "string-array")
    private String[] actual;

    @Column(name = "status")
    private String status;
}
