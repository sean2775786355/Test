package com.safewind.pms.po;

import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2016/10/21 0021.
 */
@Repository
public class BoatDateCount {
    private Integer id;
    private Integer boatId;
    private Integer equipmentId;
    private String serviceLevel;
    private Integer day;
    private Integer hour;
    private Integer isDel;
    private Integer countType;

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

    public Integer getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(Integer equipmentId) {
        this.equipmentId = equipmentId;
    }

    public String getServiceLevel() {
        return serviceLevel;
    }

    public void setServiceLevel(String serviceLevel) {
        this.serviceLevel = serviceLevel;
    }

    public Integer getDay() {
        return day;
    }

    public void setDay(Integer day) {
        this.day = day;
    }

    public Integer getHour() {
        return hour;
    }

    public void setHour(Integer hour) {
        this.hour = hour;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    public Integer getCountType() {
        return countType;
    }

    public void setCountType(Integer countType) {
        this.countType = countType;
    }

    @Override
    public String toString() {
        return "BoatDateCount{" +
                "id=" + id +
                ", boatId=" + boatId +
                ", equipmentId=" + equipmentId +
                ", serviceLevel='" + serviceLevel + '\'' +
                ", day=" + day +
                ", hour=" + hour +
                ", isDel=" + isDel +
                ", countType=" + countType +
                '}';
    }
}
