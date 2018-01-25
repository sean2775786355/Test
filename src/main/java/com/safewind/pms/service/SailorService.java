package com.safewind.pms.service;

import java.util.Date;
import java.util.List;

import com.safewind.pms.po.Attemper;
import com.safewind.pms.po.Certificate;
import com.safewind.pms.po.Longevity;
import com.safewind.pms.po.Sailor;

public interface SailorService {
	
	/**
	 * 人员新增
	 *
	 */
	public Sailor SailorAdd(Sailor sailor);
	
	/**
	 * 人员列表
	 * 
	 */
	public List<Sailor> SailorList();
	
	/**
	 * 新增证书
	 * 
	 */
	public Certificate CertificateAdd(Certificate certificate);
	
	/**
	 * 新增海历
	 * 
	 */
	public Longevity LongevityAdd(Longevity longevity);
	
	/**
	 * 查看信息
	 * 
	 */
	//船员基本信息
	public Sailor SailorInfoMessage(String sailor_id);
	//船员证书信息
	public List<Certificate> SailorInfoCertificate(String sailor_id);
	//船员海历信息
	public List<Longevity> SailorInfoLongevity(String sailor_id);
	
	
	/**
	 * 假删除船员信息
	 * 
	 */
	public void SailorInfoDelete(String sailor_id);
	
	
	/**
	 * 假删除证书信息
	 * 
	 */
	public void SailorInfo_certificateDelete(int certificate_id);
	
	/**
	 * 假删除海历信息
	 * 
	 */
	public void SailorInfo_longevityDelete(int longevity_id);

		
	/**
	 * 人员调配
	 * 
	 */
	public Attemper SailorAttemper(Attemper attemper);
	
	/**
	 * 获取船上人员信息
	 * 
	 */
	public List<Attemper> SailorBoat (int boat_id);
	
	/**
	 * 人员下船
	 * 1.假删调配操作
	 * 2.海历信息更新下船时间
	 */
	public void DeleteAttemper(int attemper_id);
	
	public Attemper AttemperFind(int attemper_id);
	
	public void AsHoreLongrvity(int boat_id,Date ashore_time);
	
	
	public Attemper BoatSailor(String sailor_id);
	
	
	/**
	 * 修改人员信息
	 *
	 */
	public void SailorRePost(Sailor sailor);

	public String getCaptainIdByBoatId(String boatId);

}
