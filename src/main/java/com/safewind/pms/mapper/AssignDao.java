package com.safewind.pms.mapper;

import com.safewind.pms.po.Attemper;
import com.safewind.pms.po.ServiceDate;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * Created by lxy on 2016/11/13.
 */
@Repository
public interface AssignDao {
    //查询船员调配表一条记录
    Attemper getAttemperBySailorId(String sailorId);
    //查询所需分配工作
    List<ServiceDate> getServiceDateByBoatIdStatus(Byte eType, int boatId, int status1, int status2);
    //查询可分配的人
    List<Attemper> getAvailableAttemper(int boatId);
    //分配更新
    void serviceDateAssignOk(int id ,String serviceContent,String didId ,String checkId);
    //放弃维护
    void giveUp(int id,String bandContent,String shoreId);

    //查询所需分配工作
    List<ServiceDate> getServiceDateByDidId(String didId);
    //提交维护表
    void serviceDateReportOk(int id, Date didTime, String content);
    //船长审核通过
    void serviceDateBocheckOk(int id , Date checkTime,String shoreId);
    //船长审核未通过
    void serviceDateBocheckNo(int id , String checkContent );
    //岸上审核工作查询
    List<ServiceDate> getServiceDateByAshoreId(String ashoreId);
    //岸上未通过
    void serviceDateShcheckNo(int id ,String shoreContent);
    //岸上通过
    void serviceDateShcheckOk(int id ,Date shoreTime,String shoreContent);

}
