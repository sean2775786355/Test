package com.safewind.pms.service;

import com.safewind.pms.po.RepairApplyAll;
import com.safewind.pms.po.RepairApplyWithBLOBs;



import java.util.List;

public interface RepairService {
    List<RepairApplyAll> getAllRepairApplyAlls();
    
    RepairApplyAll getRepairApplyAllById(Integer id);
    
    RepairApplyWithBLOBs getRepairApplyWithBloBsById(Integer id);
	
    void updateRepairApplyWithBLOBs(RepairApplyWithBLOBs repairApplyWithBLOBs);

    public void repairApplyPost(RepairApplyAll repairApplyAll);
}
