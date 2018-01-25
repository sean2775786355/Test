package com.safewind.pms.po;

import java.math.BigDecimal;
import java.util.Date;

public class RepairApply {
    private Integer id;

    private Integer boatId;

    private Integer repairFactoryId;

    private Byte type;

    private Date repairDate;

    private Integer dateLength;

    private Byte status;

    private String check1Id;

    private Date check1Time;

    private String check2Id;

    private Date check2Time;

    private String check3Id;

    private Date check3Time;

    private String actId;

    private Date actTime;

    private String actUrl;

    private String finishId;

    private Date finishTime;

    private String finishUrl;

    private String finishContent;

    private BigDecimal budgetUsageCount;

    private String createId;

    private Date createTime;

    private Byte isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBoatId() {
        return boatId;
    }

    public void setBoatId(Integer boatId) {
        this.boatId = boatId;
    }

    public Integer getRepairFactoryId() {
        return repairFactoryId;
    }

    public void setRepairFactoryId(Integer repairFactoryId) {
        this.repairFactoryId = repairFactoryId;
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public Date getRepairDate() {
        return repairDate;
    }

    public void setRepairDate(Date repairDate) {
        this.repairDate = repairDate;
    }

    public Integer getDateLength() {
        return dateLength;
    }

    public void setDateLength(Integer dateLength) {
        this.dateLength = dateLength;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public String getCheck1Id() {
        return check1Id;
    }

    public void setCheck1Id(String check1Id) {
        this.check1Id = check1Id;
    }

    public Date getCheck1Time() {
        return check1Time;
    }

    public void setCheck1Time(Date check1Time) {
        this.check1Time = check1Time;
    }

    public String getCheck2Id() {
        return check2Id;
    }

    public void setCheck2Id(String check2Id) {
        this.check2Id = check2Id;
    }

    public Date getCheck2Time() {
        return check2Time;
    }

    public void setCheck2Time(Date check2Time) {
        this.check2Time = check2Time;
    }

    public String getCheck3Id() {
        return check3Id;
    }

    public void setCheck3Id(String check3Id) {
        this.check3Id = check3Id;
    }

    public Date getCheck3Time() {
        return check3Time;
    }

    public void setCheck3Time(Date check3Time) {
        this.check3Time = check3Time;
    }

    public String getActId() {
        return actId;
    }

    public void setActId(String actId) {
        this.actId = actId;
    }

    public Date getActTime() {
        return actTime;
    }

    public void setActTime(Date actTime) {
        this.actTime = actTime;
    }

    public String getActUrl() {
        return actUrl;
    }

    public void setActUrl(String actUrl) {
        this.actUrl = actUrl == null ? null : actUrl.trim();
    }

    public String getFinishId() {
        return finishId;
    }

    public void setFinishId(String finishId) {
        this.finishId = finishId;
    }

    public Date getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    public String getFinishUrl() {
        return finishUrl;
    }

    public void setFinishUrl(String finishUrl) {
        this.finishUrl = finishUrl == null ? null : finishUrl.trim();
    }

    public String getFinishContent() {
        return finishContent;
    }

    public void setFinishContent(String finishContent) {
        this.finishContent = finishContent == null ? null : finishContent.trim();
    }

    public BigDecimal getBudgetUsageCount() {
        return budgetUsageCount;
    }

    public void setBudgetUsageCount(BigDecimal budgetUsageCount) {
        this.budgetUsageCount = budgetUsageCount;
    }

    public String getCreateId() {
        return createId;
    }

    public void setCreateId(String createId) {
        this.createId = createId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Byte getIsDel() {
        return isDel;
    }

    public void setIsDel(Byte isDel) {
        this.isDel = isDel;
    }
}