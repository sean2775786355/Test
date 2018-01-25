package com.safewind.pms.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safewind.pms.mapper.CheckBoatManageDao;
import com.safewind.pms.po.CheckBoatManage;
import com.safewind.pms.service.CheckBoatManageService;
@Service
public class CheckBoatManageServiceImpl implements CheckBoatManageService {

	@Autowired
	private CheckBoatManageDao checkBoatManageDao;
	
	@Override
	public void sendMessage(CheckBoatManage checkBoatManage) {
		checkBoatManage.setSendTime(new Date());
		checkBoatManage.setStatus(1);
		checkBoatManageDao.sendMessage(checkBoatManage);
	}

	@Override
	public List<CheckBoatManage> receiveMessage(int boatId) {
		return checkBoatManageDao.receiveMessage(boatId);
	}

	@Override
	public void replyMessage(CheckBoatManage checkBoatManage) {
		checkBoatManage.setReplyTime(new Date());
		checkBoatManage.setStatus(2);
		checkBoatManageDao.replyMessage(checkBoatManage);
	}

	@Override
	public void deleteMessage(int id) {
		checkBoatManageDao.deleteMessage(id);
	}

	@Override
	public CheckBoatManage CheckBoatManageInfo(int id) {
		CheckBoatManage checkBoatManage = checkBoatManageDao.CheckBoatManageInfo(id);
		if (checkBoatManage.getStatus()==2){
			checkBoatManage.setStatus(3);
		}
		return checkBoatManage;
	}

	@Override
	public List<CheckBoatManage> AllcheckBoatManage() {
		return checkBoatManageDao.AllcheckBoatManage();
	}

}
