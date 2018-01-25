package com.safewind.pms.service;

import com.safewind.pms.po.Publish;

import java.util.List;

/**
 * Created by lxy on 2017/7/2.
 */
public interface PublishService {
    void insert(Publish publish);
    List<Publish> getPublishList(String sailorId);
    Publish getPublishById(Integer publishId);
    boolean isCaptain();
    void publishCheck(Integer publishId);
    public List<Publish> getPublishReplyList(String sailorId);
}
