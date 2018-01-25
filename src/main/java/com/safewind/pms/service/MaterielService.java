package com.safewind.pms.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.safewind.pms.po.Materiel;
import com.safewind.pms.po.MaterielApply;
import com.safewind.pms.po.MaterielPurchase;
import com.safewind.pms.po.MaterielQuote;

public interface MaterielService {
	
	public List<Materiel> materielList();
	
	public void materielDelete(int id);
	
	public Materiel materielFindDetail(int id);
	
	public void materielCreate(Materiel materiel);
	
	public void materielSubmit(Materiel materiel);
	
	public void materielApplyCreate(MaterielApply materielApply);
	
	public List<MaterielApply> materielApplyList();
	
	public MaterielApply materielApplyFindDetail(int id);
	
	public void materielApplyUpdate(int i,int id,String precheck_content,String check_id);

	public MaterielApply getMaterielApplyById(int id);

	public void materielApplyQuoteDo(Date deadline, int id);

	public List<MaterielQuote> getMaterielQuoteByApplyId(int id);

    public MaterielQuote getMaterielQuoteById(int id);

	public void materielPurchaseDo(int applyId,int quote_id,String purchaseContent,int current_count,int price,int boatId,double remained);

	public MaterielPurchase getMaterielPurchaseByApplyId(int id);

    public void materielFinalCheckYes(int applyId,String checkContent);

    public void materielFinalCheckNo(int applyId,String checkContent);
    //单纯地找名字
    public String SailorFindById(String sailor_id);

    public void materielPurchaseDidDo(int applyId);

	public void materielPurchaseIncomeDo(int applyId, BigDecimal incomeCount, String incomeContent, int boatId, int materielId);

}
