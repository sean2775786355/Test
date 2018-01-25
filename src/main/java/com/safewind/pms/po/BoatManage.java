package com.safewind.pms.po;

import java.util.Date;

public class BoatManage {
    private int id;

    private String sailorId;

    private int boatId;

    private Byte isDel;

    private String createId;

    private Date createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSailorId() {
        return sailorId;
    }

    public void setSailorId(String sailorId) {
        this.sailorId = sailorId == null ? null : sailorId.trim();
    }

    public int getBoatId() {
        return boatId;
    }

    public void setBoatId(int boatId) {
        this.boatId = boatId;
    }

    public Byte getIsDel() {
        return isDel;
    }

    public void setIsDel(Byte isDel) {
        this.isDel = isDel;
    }

    public String getCreateId() {
        return createId;
    }

    public void setCreateId(String createId) {
        this.createId = createId == null ? null : createId.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}