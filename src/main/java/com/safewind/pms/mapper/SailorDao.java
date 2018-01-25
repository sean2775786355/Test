package com.safewind.pms.mapper;

import java.util.Date;
import java.util.List;

import com.safewind.pms.po.Attemper;
import com.safewind.pms.po.Certificate;
import com.safewind.pms.po.Longevity;
import com.safewind.pms.po.Sailor;

import org.springframework.stereotype.Repository;

@Repository
public interface SailorDao {
	
	
	public Long SailorAdd (Sailor sailor);
	
	public List<Sailor> SailorList ();
	
	public Long CertificateAdd (Certificate certificate);
	
	public Long LongevityAdd (Longevity longevity);
	
	public Sailor SailorInfoMessage(String sailor_id);
	
	public List<Certificate> SailorInfoCertificate(String sailor_id);

	public List<Longevity> SailorInfoLongevity(String sailor_id);
	
	public void SailorInfoDelete(String sailor_id);
	
	public void SailorInfo_certificateDelete(int certificate_id);
	
	public void SailorInfo_longevityDelete(int longevity_id);
	
	public Long SailorAttemper(Attemper attemper);
	
	public List<Attemper> SailorBoat (int boat_id);
	
	public void DeleteAttemper(int attemper_id);
	
	public Attemper AttemperFind(int attemper_id);
	
	public void AsHoreLongrvity(int boat_id,Date ashore_time);
	
	public Attemper BoatSailor(String sailor_id);
	
	public void SailorRePost(Sailor sailor);
	
	//单纯地找名字
	public String SailorFindById(String sailor_id);

	public String getCaptainIdByBoatId(String boat_id);

}
