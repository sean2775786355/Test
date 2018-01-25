package com.safewind.pms.mapper;

import com.safewind.pms.po.BoatManage;

public interface BoatManageDao {
    int deleteByPrimaryKey(int id);

    int insert(BoatManage record);

    int insertSelective(BoatManage record);

    BoatManage selectByPrimaryKey(int id);

    BoatManage selectByBoatId(int id);

    int updateByPrimaryKeySelective(BoatManage record);

    int updateByPrimaryKey(BoatManage record);

}