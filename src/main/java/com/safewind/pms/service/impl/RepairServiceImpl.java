package com.safewind.pms.service.impl;

import com.safewind.pms.mapper.BoatDao;
import com.safewind.pms.mapper.RepairApplyDao;
import com.safewind.pms.po.Boat;
import com.safewind.pms.po.RepairApply;
import com.safewind.pms.po.RepairApplyAll;
import com.safewind.pms.po.RepairApplyWithBLOBs;
import com.safewind.pms.service.RepairService;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by lxy on 2017/3/11.
 */
@Service
public class RepairServiceImpl implements RepairService {

    @Autowired
    private RepairApplyDao repairApplyDao;
    @Autowired
    private BoatDao boatDao;




    @Override
    public List<RepairApplyAll> getAllRepairApplyAlls() {
        List<RepairApplyWithBLOBs> repairApplyWithBLOBsList =  repairApplyDao.getAllRepairApplys();
        List<RepairApplyAll> repairApplyAllList = new ArrayList<>();
        for(int i=0;i<repairApplyWithBLOBsList.size();i++) {
            repairApplyAllList.add(repairApplyWithBLOBsToAll(repairApplyWithBLOBsList.get(i)));
        }
        return repairApplyAllList;
    }

    @Override
    public RepairApplyAll getRepairApplyAllById(Integer id) {
        RepairApplyWithBLOBs repairApplyWithBloBs = this.getRepairApplyWithBloBsById(id);
        return this.repairApplyWithBLOBsToAll(repairApplyWithBloBs);
    }

    @Override
    public RepairApplyWithBLOBs getRepairApplyWithBloBsById(Integer id) {
        RepairApplyWithBLOBs repairApplyWithBLOBs = repairApplyDao.selectByPrimaryKey(id);
        if(repairApplyWithBLOBs ==null){
            repairApplyWithBLOBs = new RepairApplyWithBLOBs();
        }
        return repairApplyWithBLOBs;
    }

    @Override
    public void updateRepairApplyWithBLOBs(RepairApplyWithBLOBs repairApplyWithBLOBs) {
        repairApplyDao.updateByPrimaryKeySelective(repairApplyWithBLOBs);
    }



    private RepairApplyAll repairApplyWithBLOBsToAll(RepairApplyWithBLOBs repairApplyWithBLOBs){
        RepairApplyAll repairApplyAll= new RepairApplyAll();
        repairApplyAll.setActId(repairApplyWithBLOBs.getActId());
        repairApplyAll.setActRepairContent(repairApplyWithBLOBs.getActRepairContent());
        repairApplyAll.setActTime(repairApplyWithBLOBs.getActTime());
        repairApplyAll.setActUrl(repairApplyWithBLOBs.getActUrl());
        repairApplyAll.setBoatId(repairApplyWithBLOBs.getBoatId());
        repairApplyAll.setBudgetUsageCount(repairApplyWithBLOBs.getBudgetUsageCount());
        repairApplyAll.setCheck1Content(repairApplyWithBLOBs.getCheck1Content());
        repairApplyAll.setCheck1Id(repairApplyWithBLOBs.getCheck1Id());
        repairApplyAll.setCheck1Time(repairApplyWithBLOBs.getCheck1Time());
        repairApplyAll.setCheck2Content(repairApplyWithBLOBs.getCheck2Content());
        repairApplyAll.setCheck2Id(repairApplyWithBLOBs.getCheck2Id());
        repairApplyAll.setCheck2Time(repairApplyWithBLOBs.getCheck2Time());
        repairApplyAll.setCheck3Content(repairApplyWithBLOBs.getCheck3Content());
        repairApplyAll.setCheck3Id(repairApplyWithBLOBs.getCheck3Id());
        repairApplyAll.setCheck3Time(repairApplyWithBLOBs.getCheck3Time());
        repairApplyAll.setCreateId(repairApplyWithBLOBs.getCreateId());
        repairApplyAll.setCreateTime(repairApplyWithBLOBs.getCreateTime());
        repairApplyAll.setDateLength(repairApplyWithBLOBs.getDateLength());
        repairApplyAll.setFinishContent(repairApplyWithBLOBs.getFinishContent());
        repairApplyAll.setFinishTime(repairApplyWithBLOBs.getFinishTime());
        repairApplyAll.setFinishUrl(repairApplyWithBLOBs.getFinishUrl());
        repairApplyAll.setId(repairApplyWithBLOBs.getId());
        repairApplyAll.setIsDel(repairApplyWithBLOBs.getIsDel());
        repairApplyAll.setFinishId(repairApplyWithBLOBs.getFinishId());
        repairApplyAll.setPreContent(repairApplyWithBLOBs.getPreContent());
        repairApplyAll.setRepairDate(repairApplyWithBLOBs.getRepairDate());
        repairApplyAll.setRepairFactoryId(repairApplyWithBLOBs.getRepairFactoryId());
        repairApplyAll.setStatus(repairApplyWithBLOBs.getStatus());
        repairApplyAll.setType(repairApplyWithBLOBs.getType());
        Boat boat = boatDao.getBoatInfo(repairApplyAll.getBoatId());
        if(boat!=null){
            repairApplyAll.setBoatName(boat.getName());
        }
        return repairApplyAll;
    }

	@Override
	public void repairApplyPost(RepairApplyAll repairApplyAll) {
		//获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();
        repairApplyAll.setCreateId(sailorId);
		repairApplyAll.setCreateTime(new Date());
		repairApplyDao.repairApplyPost(repairApplyAll);
	}
}
