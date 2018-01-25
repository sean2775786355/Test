package com.safewind.pms.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.safewind.pms.mapper.*;
import com.safewind.pms.po.*;
import com.safewind.pms.util.EmaiUtil;
import com.safewind.pms.util.ExcelUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safewind.pms.service.ConsumableService;

@Service
public class ConsumableServiceImpl implements ConsumableService{

	@Autowired
	private ConsumableQuoteDao consumableQuoteDao;

	@Autowired
	private BudgetDao budgetDao;

	@Autowired
	private ConsumablePurchaseDao consumablePurchaseDao;

	@Autowired
	private ConsumableDao consumableDao;
	
	@Autowired
	private BoatDao boatDao;
	
	@Autowired
	private SailorDao sailorDao;

	@Autowired
	private SupplierDao supplierDao;

	@Autowired
	private  ConsumableStorageDao consumableStorageDao;

	@Override
	public List<Consumable> consumableList() {
		
		return consumableDao.consumableList();
	}

	@Override
	public void consumableDelete(int id) {
		consumableDao.consumableDelete(id);
	}

	@Override
	public Consumable consumableFindDetail(int id) {
		return consumableDao.consumableFindDetail(id);
	}

	@Override
	public void consumableCreate(Consumable consumable) {
		consumableDao.consumableCreate(consumable);
		
	}

	@Override
	public void consumableSubmit(Consumable consumable) {
		consumableDao.consumableSubmit(consumable);
		
	}

	@Override
	public void consumableApplyCreate(ConsumableApply consumableApply) {
		consumableDao.consumableApplyCreate(consumableApply);
		
	}

	@Override
	public List<ConsumableApply> consumableApplyList() {
		List<ConsumableApply> consumableApplyList = consumableDao.consumableApplyList();
        for (int i = 0; i < consumableApplyList.size(); i++) {
        	ConsumableApply consumableApply = consumableApplyList.get(i);
        	String boat_name = boatDao.boatNameFindById(consumableApply.getBoat_id());
        	String consumable_name = consumableDao.consumableApplyFindName(consumableApply.getConsumable_id());
        	consumableApply.setBoat_name(boat_name);
        	consumableApply.setConsumable_name(consumable_name);
        }	
		return consumableApplyList;
	}


	@Override
	public ConsumableApply consumableApplyFindDetail(int id) {
		ConsumableApply consumableApply = consumableDao.consumableApplyFindDetail(id);
		
    	String boat_name = boatDao.boatNameFindById(consumableApply.getBoat_id());   	
    	String consumable_name = consumableDao.consumableApplyFindName(consumableApply.getConsumable_id());   	
     	String sailor_name = sailorDao.SailorFindById(consumableApply.getCreate_id());	
     	
    	consumableApply.setBoat_name(boat_name);
    	consumableApply.setConsumable_name(consumable_name);
    	consumableApply.setSailor_name(sailor_name);
    	
		return consumableApply;
	}

	@Override
	public void consumableApplyUpdate(int i, int id, String precheck_content, String check_id) {
		consumableDao.consumableApplyUpdate(i,id, precheck_content, check_id);
		
	}

	@Override
	public ConsumableApply getConsumableApplyById(int id) {
		ConsumableApply consumableApply  = consumableDao.getConsumableApplyById(id);
		String boatName = boatDao.boatNameFindById(consumableApply.getBoat_id());
		consumableApply.setBoat_name(boatName);
		String sailorId = sailorDao.SailorFindById(consumableApply.getCreate_id());
		consumableApply.setSailor_name(sailorId);
		return consumableApply;
	}

	@Override
	public void consumableApplyQuoteDo(Date deadline, int id) {
		consumableDao.consumableApplyStatusUpdate(3,id);
		List<String> EmailList = supplierDao.getAllEmail();

        try {
			ConsumableApply consumableApply  = consumableDao.getConsumableApplyById(id);
			Consumable consumable = consumableDao.consumableFindDetail(consumableApply.getConsumable_id());

			byte[] bytes =  ExcelUtil.getExcelBytes(consumable.getName(),consumable.getType(),consumable.getStandard_code(),consumable.getStandard(),consumableApply.getCount(),deadline);

            //---处理excel

            for(String email:EmailList){
                EmaiUtil.sendMail("物料询价单",email,"您好，这是物料询价表，请查收",bytes);
            }

        }catch (Exception e){
            e.printStackTrace();
        }

	}

	@Override
	public List<ConsumableQuote> getConsumableQuoteByApplyId(int id){
		return consumableQuoteDao.selectByConsumableApplyId(id);
	}

    @Override
    public ConsumableQuote getConsumableQuoteById(int id) {
        return consumableQuoteDao.selectByPrimaryKeyWithName(id);
    }

	@Override
	public void consumablePurchaseDo(int applyId, int quote_id, String purchaseContent,int current_count,int price,int boatId,double remained) {
		int totalPrice = current_count*price;
		Calendar calendar =Calendar.getInstance();
		if (totalPrice<=remained){
			budgetDao.updateRemained(boatId,calendar.get(Calendar.YEAR),remained-totalPrice);
			ConsumablePurchase consumablePurchase = new ConsumablePurchase();
			consumablePurchase.setConsumableApplyId(applyId);
			consumablePurchase.setConsumableQuoteId(quote_id);
			consumablePurchase.setContent(purchaseContent);
			BigDecimal bigDecimal = new BigDecimal(totalPrice);
			consumablePurchase.setTotalPrice(bigDecimal);
			//获取用户ID
			Subject subject = SecurityUtils.getSubject();
			String creatId = subject.getPrincipal().toString();
			consumablePurchase.setCreateId(creatId);
			Date date =new Date();
			consumablePurchase.setCreateTime(date);
			consumablePurchase.setCurrentCount(current_count);
			if(totalPrice>=10000000){
				consumablePurchase.setStatus(new Byte("1"));
				consumableDao.consumableApplyStatusUpdate(4,applyId);
			}else{
				consumablePurchase.setStatus(new Byte("0"));
				consumableDao.consumableApplyStatusUpdate(5,applyId);
			}
			consumablePurchaseDao.insertSelective(consumablePurchase);
		}
	}

	@Override
	public ConsumablePurchase getConsumablePurchaseByApplyId(int id) {
		return consumablePurchaseDao.getConsumablePurchaseByApplyId(id);
	}

    @Override
    public void consumableFinalCheckYes(int applyId, String checkContent) {
        consumableDao.consumableApplyStatusUpdate(5,applyId);
        ConsumablePurchase consumablePurchase = new ConsumablePurchase();
        consumablePurchase.setConsumableApplyId(applyId);
        consumablePurchase.setCheckContent(checkContent);
        consumablePurchase.setStatus(new Byte("2"));
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String checkId = subject.getPrincipal().toString();
        consumablePurchase.setCheckId(checkId);
        consumablePurchaseDao.updateByApplyIdSelective(consumablePurchase);
    }

    @Override
    public void consumableFinalCheckNo(int applyId, String checkContent) {
        consumableDao.consumableApplyStatusUpdate(8,applyId);
        ConsumablePurchase consumablePurchase = new ConsumablePurchase();
        consumablePurchase.setConsumableApplyId(applyId);
        consumablePurchase.setCheckContent(checkContent);
        consumablePurchase.setStatus(new Byte("5"));
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String checkId = subject.getPrincipal().toString();
        consumablePurchase.setCheckId(checkId);
        consumablePurchaseDao.updateByApplyIdSelective(consumablePurchase);
    }

    @Override
    public String SailorFindById(String sailorId) {
        return sailorDao.SailorFindById(sailorId);
    }

	@Override
	public void consumablePurchaseDidDo(int applyId) {
		consumableDao.consumableApplyStatusUpdate(6,applyId);
		ConsumablePurchase consumablePurchase = new ConsumablePurchase();
		consumablePurchase.setConsumableApplyId(applyId);
		consumablePurchase.setStatus(new Byte("3"));
		consumablePurchaseDao.updateByApplyIdSelective(consumablePurchase);
	}

	@Override
	public void consumablePurchaseIncomeDo(int applyId, BigDecimal incomeCount, String incomeContent, int boatId, int consumableId) {
		consumableDao.consumableApplyStatusUpdate(7,applyId);
		ConsumablePurchase consumablePurchase = new ConsumablePurchase();
		consumablePurchase.setConsumableApplyId(applyId);
		consumablePurchase.setStatus(new Byte("4"));
		consumablePurchase.setIncomeContent(incomeContent);
		consumablePurchase.setIncomeCount(incomeCount);
		consumablePurchaseDao.updateByApplyIdSelective(consumablePurchase);

		String storageId = consumableStorageDao.getIdByApplyConsumableId(consumableId);
		if(storageId==null){
			ConsumableStorage consumableStorage = new ConsumableStorage();
			consumableStorage.setBoatId(boatId);
			consumableStorage.setConsumableId(consumableId);
			consumableStorage.setCount(incomeCount);
			//获取用户ID
			Subject subject = SecurityUtils.getSubject();
			String updateId = subject.getPrincipal().toString();
			consumableStorage.setUpdateId(updateId);
			Date date = new Date();
			consumableStorage.setUpdateTime(date);
			consumableStorageDao.insertSelective(consumableStorage);
		}else{
			ConsumableStorage consumableStorage = new ConsumableStorage();
			//获取用户ID
			Subject subject = SecurityUtils.getSubject();
			String updateId = subject.getPrincipal().toString();
			consumableStorage.setUpdateId(updateId);
			Date date = new Date();
			consumableStorage.setUpdateTime(date);
			consumableStorage.setCount(incomeCount);
			consumableStorage.setId(new Integer(storageId));
			consumableStorageDao.addCount(consumableStorage);
		}


	}


}
