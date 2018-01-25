package com.safewind.pms.service;

import java.util.List;

import com.safewind.pms.po.CheckBoatManage;

public interface CheckBoatManageService {
	
	public void sendMessage(CheckBoatManage checkBoatManage);
	
	public List<CheckBoatManage> receiveMessage(int boatId);

	public void replyMessage (CheckBoatManage checkBoatManage);

	public void deleteMessage (int id);
	
	public CheckBoatManage CheckBoatManageInfo (int id);
	
	public List<CheckBoatManage> AllcheckBoatManage();
}
