package com.safewind.pms.service.impl;

import com.safewind.pms.mapper.PublishDao;
import com.safewind.pms.mapper.SailorDao;
import com.safewind.pms.po.Attemper;
import com.safewind.pms.po.Publish;
import com.safewind.pms.service.PublishService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by lxy on 2017/7/2.
 */
@Service
public class PublishServiceImpl implements PublishService {

    @Autowired private PublishDao publishDao;

    @Autowired private SailorDao sailorDao;

    @Override
    public void insert(Publish publish) {
        publishDao.insertSelective(publish);
    }

    @Override
    public List<Publish> getPublishList(String sailorId) {
        //--自己的--
        List<Publish> publishList = publishDao.getPublishListForSailorBySailorId(sailorId);
        //--船的--
        publishList.addAll(publishDao.getPublishListForBoatBySailorId(sailorId));

        removeTimeUp(publishList);

        return publishList;
    }

    @Override
    public List<Publish> getPublishReplyList(String sailorId) {
        Attemper attemper = sailorDao.BoatSailor(sailorId);
        List<Publish> publishReplyList = null;
        if (attemper!=null&&attemper.getDuty()==84){
            publishReplyList = publishDao.getPublishReplyList();
            removeTimeUp(publishReplyList);
        }


        return publishReplyList;
    }

    /**
     * 去掉超过一周的
     * @param publishList
     */
    private void removeTimeUp(List<Publish> publishList){
        for (int i=0;i<publishList.size();i++){
            Publish publish = publishList.get(i);
            if(publish.getReplyTime()!=null&&new Date().getTime()-publish.getReplyTime().getTime()>1000l*60*60*24*7){
                Publish publishDelete = new Publish();
                publishDelete.setId(publish.getId());
                publishDelete.setIsDel(1);
                publishDao.updateByPrimaryKeySelective(publishDelete);
                publishList.remove(i--);
            }
        }
    }


    @Override
    public Publish getPublishById(Integer publishId) {
        return publishDao.selectByPrimaryKey(publishId);
    }

    @Override
    public boolean isCaptain() {
        //获取用户ID
        String sailorId = SecurityUtils.getSubject().getPrincipal().toString();

        String captainId = sailorDao.getCaptainIdByBoatId(sailorDao.BoatSailor(sailorId).getBoat_id()+"");

        if(sailorId!=null&&sailorId.equals(captainId)){
            return true;
        }

        return false;
    }

    @Override
    public void publishCheck(Integer publishId) {
        Publish publish = new Publish();
        publish.setId(publishId);
        publish.setIsReply(1);
        publish.setReplyTime(new Date());
        publishDao.updateByPrimaryKeySelective(publish);
    }


}
