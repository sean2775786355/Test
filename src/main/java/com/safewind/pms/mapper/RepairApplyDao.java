package com.safewind.pms.mapper;

import com.safewind.pms.po.RepairApply;
import com.safewind.pms.po.RepairApplyAll;
import com.safewind.pms.po.RepairApplyWithBLOBs;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RepairApplyDao {
    int deleteByPrimaryKey(Integer id);

    int insert(RepairApplyWithBLOBs record);

    int insertSelective(RepairApplyWithBLOBs record);

    RepairApplyWithBLOBs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RepairApplyWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(RepairApplyWithBLOBs record);

    int updateByPrimaryKey(RepairApply record);

    List<RepairApplyWithBLOBs> getAllRepairApplys();
    
    public void repairApplyPost(RepairApplyAll repairApplyAll);
}