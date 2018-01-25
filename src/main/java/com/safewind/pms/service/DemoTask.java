package com.safewind.pms.service;

/**
 *
 * 定时调度demo
 * Created by 门铎 on 2016/8/27.
 */

public interface DemoTask {
    /**
     * 按小时运行的设备每小时flag自增1
     */
    public void EquipmentRunAsHourJob();


    /**
     * 按天运行的设备每天flag自增1
     */
    public void EquipmentRunAsDayJob();
}
