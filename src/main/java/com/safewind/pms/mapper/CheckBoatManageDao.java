package com.safewind.pms.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.safewind.pms.po.CheckBoatManage;
@Repository
public interface CheckBoatManageDao {

	public void sendMessage(CheckBoatManage checkBoatManage);
	
	public List<CheckBoatManage> receiveMessage(int boatId);

	public void replyMessage (CheckBoatManage checkBoatManage);

	public void deleteMessage (int id);
	
	public CheckBoatManage CheckBoatManageInfo (int id);
	
	public List<CheckBoatManage> AllcheckBoatManage();
}
