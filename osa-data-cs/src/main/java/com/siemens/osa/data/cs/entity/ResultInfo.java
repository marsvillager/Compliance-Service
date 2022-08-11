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
import java.sql.Timestamp;

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

    @Column(name = "timestamp")
    private Timestamp timestamp;

    @Column(name = "id")
    private Integer id;

    @Column(name = "os")
    private String os;

    @Column(name = "lang")
    private String lang;

    @Column(name = "server_ip")
    private String serverIP;

    @Column(name = "host_ip")
    private String hostIP;

    @Column(name = "rule_id")
    private String ruleId;

    @Column(name = "expected")
    @Type(type = "string-array")
    private String[] expected;

    @Column(name = "actual")
    @Type(type = "string-array")
    private String[] actual;

    @Column(name = "status")
    private String status;

    public long getRid() {
        return rid;
    }

    public void setRid(long rid) {
        this.rid = rid;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getLang() {
        return lang;
    }

    public void setLang(String lang) {
        this.lang = lang;
    }

    public String getServerIP() {
        return serverIP;
    }

    public void setServerIP(String serverIP) {
        this.serverIP = serverIP;
    }

    public String getHostIP() {
        return hostIP;
    }

    public void setHostIP(String hostIP) {
        this.hostIP = hostIP;
    }

    public String getRuleId() {
        return ruleId;
    }

    public void setRuleId(String ruleId) {
        this.ruleId = ruleId;
    }

    public String[] getExpected() {
        return expected;
    }

    public void setExpected(String[] expected) {
        this.expected = expected;
    }

    public String[] getActual() {
        return actual;
    }

    public void setActual(String[] actual) {
        this.actual = actual;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
