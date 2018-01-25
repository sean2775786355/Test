package com.safewind.pms.mapper;

import com.safewind.pms.po.MaterielStorage;

public interface MaterielStorageDao {
    int deleteByPrimaryKey(Integer id);

    int insert(MaterielStorage record);

    int insertSelective(MaterielStorage record);

    MaterielStorage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MaterielStorage record);

    int updateByPrimaryKey(MaterielStorage record);

    String getIdByApplyMaterielId(Integer materielId);

    void addCount(MaterielStorage record);
}