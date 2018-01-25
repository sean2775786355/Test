package com.safewind.pms.mapper;

import com.safewind.pms.po.ConsumableStorage;

public interface ConsumableStorageDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ConsumableStorage record);

    int insertSelective(ConsumableStorage record);

    ConsumableStorage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ConsumableStorage record);

    int updateByPrimaryKey(ConsumableStorage record);

    String getIdByApplyConsumableId(Integer consumableId);

    void addCount(ConsumableStorage record);
}