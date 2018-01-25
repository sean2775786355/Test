package com.safewind.pms.mapper;

import com.safewind.pms.po.Cwbt;
import com.safewind.pms.po.ServiceDate;
import com.safewind.pms.po.SubCwbt;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by lxy on 2016/9/26.
 */
@Repository
public interface CwbtDao {

    public List<Cwbt> getAllCwbt();

    public void updateCwbtById(int id, String code1, String code2, String code3, String name, String content, String createId, Date createTime, byte isBand , int defaultDuty);

    public Cwbt getCwbtById(int id);

    public void InsertCwbtCode(String code1, String code2, String code3, String name, String content,int defaultDuty);

    public Cwbt getCwbtByCode(String code1,String code2,String code3);


    //----------------------------------子代码-----------------------------//

    public List<SubCwbt> getAllSubCwbt(@Param(value="table")String table);

    public void updateSubCwbtById(@Param(value="table")String table, int id, String code, String name, String eName, String content, byte isBand, String createId, Date createTime);

    public SubCwbt getSubCwbtById(@Param(value="table")String table, int id);

    public void InsertSubCwbtCode(@Param(value="table")String table, String code, String name, String eName, String content);


}
