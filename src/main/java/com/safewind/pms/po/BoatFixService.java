package com.safewind.pms.po;

/**
 * Created by Administrator on 2016/10/21 0021.
 */
public class BoatFixService {
    private Integer id;
    private String cwbtCode;
    private String serviceLevel;
    private String content;

    public String getServiceLevel() {
        return serviceLevel;
    }

    public void setServiceLevel(String serviceLevel) {
        this.serviceLevel = serviceLevel;
    }

    public String getCwbtCode() {
        return cwbtCode;
    }

    public void setCwbtCode(String cwbtCode) {
        this.cwbtCode = cwbtCode;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getId() {

        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "BoatService{" +
                "id=" + id +
                ", cwbtCode='" + cwbtCode + '\'' +
                ", serviceLevel='" + serviceLevel + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
