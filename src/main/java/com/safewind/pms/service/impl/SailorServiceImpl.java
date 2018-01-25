package com.safewind.pms.service.impl;

import java.util.Date;
import java.util.List;

import com.safewind.pms.mapper.PublishDao;
import com.safewind.pms.po.User;
import com.safewind.pms.service.BoatService;
import com.safewind.pms.service.UserService;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safewind.pms.mapper.SailorDao;
import com.safewind.pms.po.Attemper;
import com.safewind.pms.po.Boat;
import com.safewind.pms.po.Certificate;
import com.safewind.pms.po.Longevity;
import com.safewind.pms.po.Sailor;
import com.safewind.pms.service.SailorService;

import org.springframework.transaction.annotation.Transactional;

@Service
public class SailorServiceImpl implements SailorService {

	@Autowired private SailorDao sailorDao;
	@Autowired private UserService userService;
	@Autowired private User user;
	@Autowired private BoatService boatService;

	/**
	 * 加上事务
	 * 新建船员 同时给船员初始化账号
	 * @param sailor
	 * @return
     */
	@Override
	@Transactional
	public Sailor SailorAdd(Sailor sailor) {
		Long id = sailorDao.SailorAdd(sailor);
		sailor.setId(id);
		//给新增人员创建用户及密码
		/**
		 * 还有几个admin_user没写 以后扩展
		 */
		user.setSailorId(sailor.getSailor_id());
		user.setUsername(sailor.getSailor_id());
		user.setPassword(sailor.getSailor_id());
		//这里调用shiro 获取执行操作的人账号
		user.setCreateUsername((String)SecurityUtils.getSubject().getPrincipal());
		user.setCreateTime(new Date());
		//注册
		userService.createUser(user);
		return sailor;
	}
	
	/**
	 * 查看人员列表
	 * 
	 */
	@Override
	public List<Sailor> SailorList() {
		List<Sailor> sailor_list = sailorDao.SailorList();
		return sailor_list;
	}

	/**
	 * 新增证书信息
	 * 
	 */
	@Override
	public Certificate CertificateAdd(Certificate certificate) {
		Long id = sailorDao.CertificateAdd(certificate);
		certificate.setId(id);
		return certificate;
	}

	/**
	 * 新增海历信息
	 * 
	 */
	@Override
	public Longevity LongevityAdd(Longevity longevity) {
		System.out.println(longevity);
		Long id = sailorDao.LongevityAdd(longevity);
		longevity.setId(id);
		return longevity;
	}

	/**
	 * 查看船员详细信息
	 * 
	 */
	//船员基本信息
	@Override
	public Sailor SailorInfoMessage(String sailor_id) {
		Sailor sailorInfoMessage =sailorDao.SailorInfoMessage(sailor_id);
		return sailorInfoMessage;
	}
	
	//船员证书信息
	@Override

	public List<Certificate> SailorInfoCertificate(String sailor_id) {
		List<Certificate> sailorInfoCertificate =sailorDao.SailorInfoCertificate(sailor_id);
		return sailorInfoCertificate;
	}
	
	//船员海历信息
	@Override

	public List<Longevity> SailorInfoLongevity(String sailor_id) {
		List<Longevity> sailorInfoLongevity =sailorDao.SailorInfoLongevity(sailor_id);
		return sailorInfoLongevity;
	}
	
	
	//假删除船员信息
	@Override
	public void SailorInfoDelete(String sailor_id) {
		sailorDao.SailorInfoDelete(sailor_id);	
	}
	
	//假删除证书信息
	@Override
	public void SailorInfo_certificateDelete(int certificate_id) {
		sailorDao.SailorInfo_certificateDelete(certificate_id);	
	}
	
	//假删除海历信息
	@Override
	public void SailorInfo_longevityDelete(int longevity_id) {
		sailorDao.SailorInfo_longevityDelete(longevity_id);	
	}

	/**
	 * 人员调配信息
	 * 
	 */
	@Override
	public Attemper SailorAttemper(Attemper attemper) {
		
		String sailor_id = attemper.getSailor_id();
		
		//获取name值
		Sailor sailor = new Sailor();
		sailor = sailorDao.SailorInfoMessage(sailor_id);
		String name = sailor.getName();
		attemper.setName(name);
		System.out.println(name);
		
		//获取更新时间
		Date date=new Date();
		attemper.setUpdate_time(date);
		/*
		Longevity longevity = new Longevity();
		longevity.setOnboard_time(date);
		Date Ashore_time = date + attemper.getTime();
		*/
		//与sailorDao对应，获取JSP里面的参数
		//岸基管理员去掉船
		if (attemper.getDuty()==84){
			attemper.setBoat_id(0);
		}
		Long id = sailorDao.SailorAttemper(attemper);
		attemper.setId(id);
		
		//获取boat信息
		String boatName = "";
		if(attemper.getBoat_id()==1){
			boatName = "育鲲";
		}else if(attemper.getBoat_id()==2){
			boatName = "尼米兹";
		}else if(attemper.getBoat_id()==3){
			boatName = "海龙";
		}else{
			System.out.println("error:not found this boat!!");
			return null;
		}
		Boat boatinfo = boatService.BoatInfo(boatName);
		
		//新增海历
		Longevity longevity = new Longevity();
		longevity.setOnboard_time(attemper.getTime());
		
		/*Date ashore_time = date;
		int day = ashore_time.getDay() + attemper.getTime().getDay();
		ashore_time.setDate(day);
		longevity.setAshore_time(ashore_time);*/
		longevity.setBelong(0);
		longevity.setBoat_id(boatinfo.getId());
		longevity.setBoat_IMO(boatinfo.getImo());
		longevity.setBoat_name(boatinfo.getName());
		longevity.setBoat_type(boatinfo.getType());
		longevity.setCompany("");
		longevity.setContent("");
		/*longevity.setCreate_id(4213);
		longevity.setCreate_time(id);*/
		longevity.setDuty(attemper.getDuty());
		longevity.setHorsepower(boatinfo.getHorsepower());
		longevity.setLane("");
		longevity.setModel(boatinfo.getModel());
		longevity.setSailor_id(sailor_id);
		longevity.setTonnage(boatinfo.getTonnage());
		
		Long longevity_id = sailorDao.LongevityAdd(longevity);
		System.out.println(longevity_id);
		
		return attemper;
	}
	
	public List<Attemper> SailorBoat (int boat_id){
		return sailorDao.SailorBoat(boat_id);
	}
	
	public void DeleteAttemper(int attemper_id){
		sailorDao.DeleteAttemper(attemper_id);
	}
	
	public Attemper AttemperFind(int attemper_id){
		return sailorDao.AttemperFind(attemper_id);
	}
	
	public void AsHoreLongrvity(int boat_id,Date ashore_time){
		sailorDao.AsHoreLongrvity(boat_id, ashore_time);
	}
	
	public Attemper BoatSailor(String sailor_id){
		return sailorDao.BoatSailor(sailor_id);
	}
	
	public void SailorRePost(Sailor sailor){
		sailorDao.SailorRePost(sailor);
	}

	@Override
	public String getCaptainIdByBoatId(String boatId) {
		return sailorDao.getCaptainIdByBoatId(boatId);
	}

	//public Certificate getCertificateBySailorId(String sailor_id);
}
