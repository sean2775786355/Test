package com.safewind.pms.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.safewind.pms.po.Consumable;
import com.safewind.pms.po.ConsumableApply;
import com.safewind.pms.po.ConsumablePurchase;
import com.safewind.pms.po.ConsumableQuote;

public interface ConsumableService {
	public List<Consumable> consumableList();
	
	public void consumableDelete(int id);
	
	public Consumable consumableFindDetail(int id);
	
	public void consumableCreate(Consumable consumable);
	
	public void consumableSubmit(Consumable consumable);
	
	public void consumableApplyCreate(ConsumableApply consumableApply);
	
	public List<ConsumableApply> consumableApplyList();
	
	public ConsumableApply consumableApplyFindDetail(int id);
	
	public void consumableApplyUpdate(int i,int id,String precheck_content,String check_id);

	public ConsumableApply getConsumableApplyById(int id);

	public void consumableApplyQuoteDo(Date deadline, int id);

	public List<ConsumableQuote> getConsumableQuoteByApplyId(int id);

    public ConsumableQuote getConsumableQuoteById(int id);

	public void consumablePurchaseDo(int applyId,int quote_id,String purchaseContent,int current_count,int price,int boatId,double remained);

	public ConsumablePurchase getConsumablePurchaseByApplyId(int id);

    public void consumableFinalCheckYes(int applyId,String checkContent);

    public void consumableFinalCheckNo(int applyId,String checkContent);
    //单纯地找名字
    public String SailorFindById(String sailor_id);

    public void consumablePurchaseDidDo(int applyId);

	public void consumablePurchaseIncomeDo(int applyId, BigDecimal incomeCount, String incomeContent, int boatId, int consumableId);

}
