package com.safewind.pms.po;

public class ServiceCwbt {
    private Integer id;

    private String cwbtCode;

    private Integer cwbtId;

    private String serviceLevel;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCwbtCode() {
        return cwbtCode;
    }

    public void setCwbtCode(String cwbtCode) {
        this.cwbtCode = cwbtCode == null ? null : cwbtCode.trim();
    }

    public Integer getCwbtId() {
        return cwbtId;
    }

    public void setCwbtId(Integer cwbtId) {
        this.cwbtId = cwbtId;
    }

    public String getServiceLevel() {
        return serviceLevel;
    }

    public void setServiceLevel(String serviceLevel) {
        this.serviceLevel = serviceLevel == null ? null : serviceLevel.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}