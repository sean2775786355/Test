package com.safewind.pms.mapper;

import com.safewind.pms.po.Publish;

import java.util.List;

public interface PublishDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Publish record);

    int insertSelective(Publish record);

    Publish selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Publish record);

    int updateByPrimaryKeyWithBLOBs(Publish record);

    int updateByPrimaryKey(Publish record);

    List<Publish> getPublishListForSailorBySailorId(String sailorId);

    List<Publish> getPublishListForBoatBySailorId(String sailorId);

    List<Publish> getPublishReplyList();

}