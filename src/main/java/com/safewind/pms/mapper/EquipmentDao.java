package com.safewind.pms.mapper;

import com.safewind.pms.po.BoatDateCount;
import com.safewind.pms.po.BoatFixService;
import com.safewind.pms.po.Equipment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/10/18 0018.
 */
@Repository
public interface EquipmentDao {

    public int insert(Equipment equipment);

    public List<Equipment> getEquipmentList();

    public Equipment getEquipment(Integer id);

    public List<Equipment> getEquipmentByBoatId(Integer boatId);

    public int update(Equipment equipment);

    public int deleteEquipment(Integer id);

    public int insertIntoBoatDateCount1(BoatDateCount boatDateCount);

    public int insertIntoBoatDateCount2(BoatDateCount boatDateCount);

    public List<BoatFixService> getBoatServiceInfoByCwbtCode(String cwbtCode);

    public BoatFixService getBoatServiceInfoByServiceLevel(String serviceLevl,String cwbtCode);

    public int updateBoatDateCount(@Param("content")String content,@Param("cwbtCode")String cwbtCode,@Param("serviceLevel")String serviceLevel);

    public List<BoatFixService> getSingleEquipmentService(Integer equipmentId);

    public int deleteServiceFromDateCountByEquipmentId(Integer equipmentId);

    public int deleteEquipmentByBoatId(Integer boatId);

    public int deleteDateCountByBoatId(Integer boatId);

    public int deleteDateCountByEquipmentId(Integer equipmentId);
}

