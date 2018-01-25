package com.safewind.pms.mapper;

import com.safewind.pms.po.ServiceCwbt;

public interface ServiceCwbtDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ServiceCwbt record);

    int insertSelective(ServiceCwbt record);

    ServiceCwbt selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ServiceCwbt record);

    int updateByPrimaryKeyWithBLOBs(ServiceCwbt record);

    ServiceCwbt selectByCwbtIdAndLevel(String level, int cwbtId);

    int updateByPrimaryKey(ServiceCwbt record);

    int updateByCwbtIdAndLevel(String level, int cwbtId,String content);

    public ServiceCwbt getContent(String cwbt_code,String service_level);
}