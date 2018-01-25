package com.safewind.pms.po;

/**
 * Created by lxy on 2016/11/13.
 */
public class ServiceDateAll extends ServiceDate{

    private String equipmentName;
    private String boatName;
    private String didName;
    private int defaultDuty;

    public int getDefaultDuty() {
        return defaultDuty;
    }

    public void setDefaultDuty(int defaultDuty) {
        this.defaultDuty = defaultDuty;
    }

    public String getDidName() {
        return didName;
    }

    public void setDidName(String didName) {
        this.didName = didName;
    }

    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public String getBoatName() {
        return boatName;
    }

    public void setBoatName(String boatName) {
        this.boatName = boatName;
    }


}
