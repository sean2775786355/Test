package com.safewind.pms.service;

import com.safewind.pms.po.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by lxy on 2016/9/28.
 */
public interface CwbtService {

    //获得所有cwbt代码
    public List<Cwbt> getAllCwbt();
    //假删除cwbt代码
    public void DeleteFalseCwbt(String s_id);
    //新增cwbt代码
    public void insertCwbt(Cwbt cwbt);
    //更改cwbt代码
    public void updateCwbt(Cwbt cwbt);
    //查询cwbt代码
    public Cwbt getCwbtById(String s_id);
    //查询cwbt代码byCode
    public Cwbt getCwbtByCode(String code1,String code2,String code3);
    //插入serviceCwbt
    public void insertServiceCwbt(ServiceCwbt serviceCwbt);
    //更新serviceCwbt
    public void updateByCwbtIdAndLevel(String level, int cwbtId,String content);
    //查询CwbtMaintenanceAll
    public CwbtMaintenanceAll getCwbtMaintenanceAll(String cwbtId);



    //----------------------------子代码-----------------------//
    //表中3个表,3个循环展示子代码
    public List<List<SubCwbt>> getAllSubCwbt();
    //假删除子代码
    public void DeleteFalseSubCwbt(String code , String table);
    //新增子代码
    public void insertSubCwbt(String table, SubCwbt subCwbt);
    //更改子代码
    public void updateSubCwbt(String table, SubCwbt subCwbt);
    //查询子代码
    public SubCwbt getSubCwbtById(String table, String s_id);

    //----------------------------补充查询-----------------------//
    public String getContent(String cwbt_code,String service_level);

}
