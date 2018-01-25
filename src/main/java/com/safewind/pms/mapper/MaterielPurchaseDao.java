package com.safewind.pms.mapper;

import com.safewind.pms.po.MaterielPurchase;
import org.springframework.stereotype.Repository;

@Repository
public interface MaterielPurchaseDao {
    int deleteByPrimaryKey(Integer id);

    int insert(MaterielPurchase record);

    int insertSelective(MaterielPurchase record);

    MaterielPurchase selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MaterielPurchase record);

    int updateByApplyIdSelective(MaterielPurchase record);

    int updateByPrimaryKey(MaterielPurchase record);

    MaterielPurchase getMaterielPurchaseByApplyId(Integer id);

}