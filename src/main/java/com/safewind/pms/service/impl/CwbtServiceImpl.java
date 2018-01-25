package com.safewind.pms.service.impl;

import com.safewind.pms.mapper.CwbtDao;
import com.safewind.pms.mapper.ServiceCwbtDao;
import com.safewind.pms.po.*;
import com.safewind.pms.service.CwbtService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.Hash;
import org.apache.shiro.subject.Subject;
import org.omg.CORBA.INTERNAL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.crypto.Data;
import java.util.*;

/**
 * Created by lxy on 2016/9/28.
 */
@Service
public class CwbtServiceImpl implements CwbtService {

    @Autowired
    private CwbtDao cwbtDao;
    @Autowired
    private ServiceCwbtDao serviceCwbtDao;

    private final static String table1 = "hh_cwbt_1";
    private final static String table2 = "hh_cwbt_2";
    private final static String table3 = "hh_cwbt_3";
    private final static String table4 = "hh_cwbt_4";


    //获得所有cwbt代码
    @Override
    public List<Cwbt> getAllCwbt(){
        List<Cwbt> list = cwbtDao.getAllCwbt();
        if(list.isEmpty()){
            Cwbt cwbt = new Cwbt();
            list.add(cwbt);
        }
        return list;
    }
    //假删除cwbt代码
    @Override
    public void DeleteFalseCwbt(String s_id){
        int id =Integer.parseInt(s_id);
        Date date = new Date();
        //获取用户名
        Subject subject = SecurityUtils.getSubject();
        String createId = subject.getPrincipal().toString();


        Cwbt cwbt = cwbtDao.getCwbtById(id);
        cwbt.setCreateId(createId);
        cwbt.setCreateTime(date);
        cwbtDao.updateCwbtById(id,cwbt.getCode1(),cwbt.getCode2(),cwbt.getCode3(),cwbt.getName(),cwbt.getContent(),cwbt.getCreateId(),cwbt.getCreateTime(),(byte)0,cwbt.getDefaultDuty());

    }
    //新增cwbt代码
    @Override
    public void insertCwbt(Cwbt cwbt){
        cwbtDao.InsertCwbtCode(cwbt.getCode1(),cwbt.getCode2(),cwbt.getCode3(),cwbt.getName(),cwbt.getContent(),cwbt.getDefaultDuty());
    }
    //更改cwbt代码
    @Override
    public void updateCwbt(Cwbt cwbt){
        cwbtDao.updateCwbtById(cwbt.getId(),cwbt.getCode1(),cwbt.getCode2(),cwbt.getCode3(),cwbt.getName(),cwbt.getContent(),cwbt.getCreateId(),cwbt.getCreateTime(),(byte)1,cwbt.getDefaultDuty());
    }
    //查询cwbt代码
    @Override
    public Cwbt getCwbtById(String s_id){
        int id = Integer.parseInt(s_id);
        return cwbtDao.getCwbtById(id);
    }
    //查询cwbt代码byCode
    @Override
    public Cwbt getCwbtByCode(String code1,String code2,String code3){
        return cwbtDao.getCwbtByCode(code1,code2,code3);
    }
    //插入serviceCwbt
    @Override
    public void insertServiceCwbt(ServiceCwbt serviceCwbt){
        serviceCwbtDao.insertSelective(serviceCwbt);
    }
    //更新serviceCwbt
    @Override
    public void updateByCwbtIdAndLevel(String level, int cwbtId,String content){
        serviceCwbtDao.updateByCwbtIdAndLevel(level,cwbtId,content);
    }
    //查询serviceCwbt
    @Override
    public CwbtMaintenanceAll getCwbtMaintenanceAll(String cwbtId){
        int iid = Integer.parseInt(cwbtId);
        CwbtMaintenanceAll cwbtMaintenanceAll = new CwbtMaintenanceAll();

        ServiceCwbt serviceCwbt = serviceCwbtDao.selectByCwbtIdAndLevel("A",iid);
        if(serviceCwbt!=null){
            cwbtMaintenanceAll.setA(serviceCwbt.getContent());
        }
        serviceCwbt = serviceCwbtDao.selectByCwbtIdAndLevel("B",iid);
        if(serviceCwbt!=null){
            cwbtMaintenanceAll.setB(serviceCwbt.getContent());
        }
        serviceCwbt = serviceCwbtDao.selectByCwbtIdAndLevel("C",iid);
        if(serviceCwbt!=null){
            cwbtMaintenanceAll.setC(serviceCwbt.getContent());
        }
        serviceCwbt = serviceCwbtDao.selectByCwbtIdAndLevel("D",iid);
        if(serviceCwbt!=null){
            cwbtMaintenanceAll.setD(serviceCwbt.getContent());
        }
        serviceCwbt = serviceCwbtDao.selectByCwbtIdAndLevel("E",iid);
        if(serviceCwbt!=null){
            cwbtMaintenanceAll.setE(serviceCwbt.getContent());
        }
        serviceCwbt = serviceCwbtDao.selectByCwbtIdAndLevel("F",iid);
        if(serviceCwbt!=null){
            cwbtMaintenanceAll.setF(serviceCwbt.getContent());
        }
        serviceCwbt = serviceCwbtDao.selectByCwbtIdAndLevel("G",iid);
        if(serviceCwbt!=null){
            cwbtMaintenanceAll.setG(serviceCwbt.getContent());
        }
        serviceCwbt = serviceCwbtDao.selectByCwbtIdAndLevel("H",iid);
        if(serviceCwbt!=null){
            cwbtMaintenanceAll.setH(serviceCwbt.getContent());
        }



        return cwbtMaintenanceAll;
    }




    //---------------------------子代码---------------------------//




    //得到3个分离的子代码表
    @Override
    public List<List<SubCwbt>> getAllSubCwbt() {
        ArrayList<List<SubCwbt>> list = new ArrayList<List<SubCwbt>>();
        List<SubCwbt> List1 = cwbtDao.getAllSubCwbt(table1);
        if (List1 != null) {
            list.add(0, List1);
        }
        List<SubCwbt> List2 = cwbtDao.getAllSubCwbt(table2);
        if (List2 != null) {
            list.add(1, List2);
        }
        List<SubCwbt> List3 = cwbtDao.getAllSubCwbt(table3);
        if (List3 != null) {
            list.add(2, List3);
        }

        return list;
    }

    //假删除
    @Override
    public void DeleteFalseSubCwbt(String s_id, String table) {
        int id = Integer.parseInt(s_id);
        SubCwbt subCwbt;
        Date date = new Date();
        //获取用户名
        Subject subject = SecurityUtils.getSubject();
        String createId = subject.getPrincipal().toString();


        if ("cwbt_1".equals(table)) {
            subCwbt = cwbtDao.getSubCwbtById(table1, id);
            subCwbt.setCreateId(createId);
            subCwbt.setCreateTime(date);
            cwbtDao.updateSubCwbtById(table1, subCwbt.getId(), subCwbt.getCode(), subCwbt.getName(), subCwbt.geteName(), subCwbt.getContent(), (byte) 0, createId, date);
        }
        if ("cwbt_2".equals(table)) {
            subCwbt = cwbtDao.getSubCwbtById(table2, id);
            subCwbt.setCreateId(createId);
            subCwbt.setCreateTime(date);
            cwbtDao.updateSubCwbtById(table2, subCwbt.getId(), subCwbt.getCode(), subCwbt.getName(), subCwbt.geteName(), subCwbt.getContent(), (byte) 0, subCwbt.getCreateId(), subCwbt.getCreateTime());

        }
        if ("cwbt_3".equals(table)) {
            subCwbt = cwbtDao.getSubCwbtById(table3, id);
            subCwbt.setCreateId(createId);
            subCwbt.setCreateTime(date);
            cwbtDao.updateSubCwbtById(table3, subCwbt.getId(), subCwbt.getCode(), subCwbt.getName(), subCwbt.geteName(), subCwbt.getContent(), (byte) 0, createId, date);

        }

    }

    //新增子代码
    @Override
    public void insertSubCwbt(String table, SubCwbt subCwbt) {
        if (table.equals("cwbt_1")) {
            cwbtDao.InsertSubCwbtCode(table1, subCwbt.getCode(), subCwbt.getName(), subCwbt.geteName(), subCwbt.getContent());
        }
        if (table.equals("cwbt_2")) {
            cwbtDao.InsertSubCwbtCode(table2, subCwbt.getCode(), subCwbt.getName(), subCwbt.geteName(), subCwbt.getContent());
        }
        if (table.equals("cwbt_3")) {
            cwbtDao.InsertSubCwbtCode(table3, subCwbt.getCode(), subCwbt.getName(), subCwbt.geteName(), subCwbt.getContent());
        }
    }

    //更改子代码
    @Override
    public void updateSubCwbt(String table, SubCwbt subCwbt) {

        if (table.equals("cwbt_1")) {
            cwbtDao.updateSubCwbtById(table1, subCwbt.getId(),subCwbt.getCode(), subCwbt.getName(), subCwbt.geteName(), subCwbt.getContent(),(byte)1,subCwbt.getCreateId(),subCwbt.getCreateTime());
        }
        if (table.equals("cwbt_2")) {
            cwbtDao.updateSubCwbtById(table2, subCwbt.getId(),subCwbt.getCode(), subCwbt.getName(), subCwbt.geteName(), subCwbt.getContent(),(byte)1,subCwbt.getCreateId(),subCwbt.getCreateTime());
        }
        if (table.equals("cwbt_3")) {
            cwbtDao.updateSubCwbtById(table3, subCwbt.getId(),subCwbt.getCode(), subCwbt.getName(), subCwbt.geteName(), subCwbt.getContent(),(byte)1,subCwbt.getCreateId(),subCwbt.getCreateTime());
        }
    }

    //查询子代码
    @Override
    public SubCwbt getSubCwbtById(String table, String s_id) {
        int id = Integer.parseInt(s_id);
        SubCwbt subCwbt = new SubCwbt();
        if (table.equals("cwbt_1")) {
            subCwbt=cwbtDao.getSubCwbtById(table1, id);
        }
        if (table.equals("cwbt_2")) {
            subCwbt=cwbtDao.getSubCwbtById(table2, id);
        }
        if (table.equals("cwbt_3")) {
            subCwbt=cwbtDao.getSubCwbtById(table3, id);
        }
        return subCwbt;
    }

    @Override
    public String getContent(String cwbt_code,String service_level) {
        ServiceCwbt serviceCwbt = serviceCwbtDao.getContent(cwbt_code,service_level);
        return serviceCwbt.getContent();
    }


}
