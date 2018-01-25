package com.safewind.pms.service.impl;

import com.safewind.pms.mapper.EquipmentDao;
import com.safewind.pms.po.BoatDateCount;
import com.safewind.pms.po.BoatFixService;
import com.safewind.pms.po.Equipment;
import com.safewind.pms.service.EquipmentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/10/18 0018.
 */
@Service
public class EquipmentServiceImpl implements EquipmentService{
    @Autowired private EquipmentDao equipmentDao;

    @Override
    public int insert(Equipment equipment) {

        return equipmentDao.insert(equipment);
    }

    @Override
    public List<Equipment> getEquipmentList() {
        return equipmentDao.getEquipmentList();
    }

    @Override
    public Equipment getEquipment(Integer id) {
        return equipmentDao.getEquipment(id);
    }

    @Override
    public List<Equipment> getEquipmentByBoatId(Integer boatId) {
        return equipmentDao.getEquipmentByBoatId(boatId);
    }

    @Override
    public int update(Equipment equipment) {
        return equipmentDao.update(equipment);
    }

    @Override
    public int deleteEquipment(Integer id) {
        return equipmentDao.deleteEquipment(id);
    }

    @Override
    public int insertIntoBoatDateCount1(BoatDateCount boatDateCount) {

        return equipmentDao.insertIntoBoatDateCount1(boatDateCount);
    }

    @Override
    public int insertIntoBoatDateCount2(BoatDateCount boatDateCount) {
        return equipmentDao.insertIntoBoatDateCount2(boatDateCount);
    }

    @Override
    public List<BoatFixService> getBoatServiceInfoByCwbtCode(String cwbtCode) {
        return equipmentDao.getBoatServiceInfoByCwbtCode(cwbtCode);
    }

    @Override
    public int updateBoatDateCount(@Param("content") String content, @Param("cwbtCode") String cwbtCode, @Param("serviceLevel") String serviceLevel) {
        return equipmentDao.updateBoatDateCount(content,cwbtCode,serviceLevel);
    }

    @Override
    public BoatFixService getBoatServiceInfoByServiceLevel(String serviceLevl,String cwbtCode) {
        return equipmentDao.getBoatServiceInfoByServiceLevel(serviceLevl,cwbtCode);
    }

    @Override
    public List<BoatFixService> getSingleEquipmentService(Integer equipmentId) {
        return equipmentDao.getSingleEquipmentService(equipmentId);
    }

    @Override
    public int deleteServiceFromDateCountByEquipmentId(Integer equipmentId) {
        return equipmentDao.deleteServiceFromDateCountByEquipmentId(equipmentId);
    }
    @Override
    public int deleteEquipmentByBoatId(Integer boatId){
        return equipmentDao.deleteEquipmentByBoatId(boatId);
    }

    @Override
    public int deleteDateCountByBoatId(Integer boatId){
        return equipmentDao.deleteDateCountByBoatId(boatId);
    }

    @Override
    public int deleteDateCountByEquipmentId(Integer equipmentId){
        return equipmentDao.deleteDateCountByEquipmentId(equipmentId);
    }
}
