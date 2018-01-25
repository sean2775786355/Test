package com.safewind.pms.mapper;

import com.safewind.pms.po.ConsumablePurchase;
import org.springframework.stereotype.Repository;

@Repository
public interface ConsumablePurchaseDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ConsumablePurchase record);

    int insertSelective(ConsumablePurchase record);

    ConsumablePurchase selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ConsumablePurchase record);

    int updateByApplyIdSelective(ConsumablePurchase record);

    int updateByPrimaryKey(ConsumablePurchase record);

    ConsumablePurchase getConsumablePurchaseByApplyId(Integer id);

}