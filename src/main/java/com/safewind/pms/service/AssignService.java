package com.safewind.pms.service;

import com.safewind.pms.po.Attemper;
import com.safewind.pms.po.AttemperAll;
import com.safewind.pms.po.ServiceDateAll;

import java.util.Date;
import java.util.List;

/**
 * Created by lxy on 2016/11/12.
 */
public interface AssignService {
    //查询操作者
    public Attemper getOperator();
    //查询可分配人员
    public List<AttemperAll> getAvailableAttemperAll(int boatId);
    //查询可分配工作
    public List<ServiceDateAll> getTask(Byte eType, int boatId, int status1, int status2);
    //分配更新
    public void serviceDateAssignOk(int id ,String serviceContent, String didId );
    //放弃维护
    int giveUp(int id,String bandContent,int boatId);

    //工作查询
    List<ServiceDateAll> getTask2();

    //提交维护表
    void serviceDateReportOk(int id, Date didTime,String content);

    //船长审核通过
    void serviceDateBocheckOk(int id ,int boatId);
    //船长审核通过
    void serviceDateBocheckNo(int id , String checkContent );
    //岸上审核工作查询
    List<ServiceDateAll> getServiceDateByAshoreId();
    void serviceDateShcheckNo(int id ,String shoreContent);
    //岸上通过
    void serviceDateShcheckOk(int id ,String shoreContent);

}
