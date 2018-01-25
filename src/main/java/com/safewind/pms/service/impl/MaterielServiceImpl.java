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

import com.safewind.pms.service.MaterielService;

@Service
public class MaterielServiceImpl implements MaterielService{

	@Autowired
	private MaterielQuoteDao materielQuoteDao;

	@Autowired
	private BudgetDao budgetDao;

	@Autowired
	private MaterielPurchaseDao materielPurchaseDao;

	@Autowired
	private MaterielDao materielDao;
	
	@Autowired
	private BoatDao boatDao;
	
	@Autowired
	private SailorDao sailorDao;

	@Autowired
	private SupplierDao supplierDao;

	@Autowired
	private  MaterielStorageDao materielStorageDao;

	@Override
	public List<Materiel> materielList() {
		
		return materielDao.materielList();
	}

	@Override
	public void materielDelete(int id) {
		materielDao.materielDelete(id);
	}

	@Override
	public Materiel materielFindDetail(int id) {
		return materielDao.materielFindDetail(id);
	}

	@Override
	public void materielCreate(Materiel materiel) {
		materielDao.materielCreate(materiel);
		
	}

	@Override
	public void materielSubmit(Materiel materiel) {
		materielDao.materielSubmit(materiel);
		
	}

	@Override
	public void materielApplyCreate(MaterielApply materielApply) {
		materielDao.materielApplyCreate(materielApply);
		
	}

	@Override
	public List<MaterielApply> materielApplyList() {
		List<MaterielApply> materielApplyList = materielDao.materielApplyList();
        for (int i = 0; i < materielApplyList.size(); i++) {
        	MaterielApply materielApply = materielApplyList.get(i);
        	String boat_name = boatDao.boatNameFindById(materielApply.getBoat_id());
        	String materiel_name = materielDao.materielApplyFindName(materielApply.getMateriel_id());
        	materielApply.setBoat_name(boat_name);
        	materielApply.setMateriel_name(materiel_name);
        }	
		return materielApplyList;
	}


	@Override
	public MaterielApply materielApplyFindDetail(int id) {
		MaterielApply materielApply = materielDao.materielApplyFindDetail(id);
		
    	String boat_name = boatDao.boatNameFindById(materielApply.getBoat_id());   	
    	String materiel_name = materielDao.materielApplyFindName(materielApply.getMateriel_id());   	
     	String sailor_name = sailorDao.SailorFindById(materielApply.getCreate_id());	
     	
    	materielApply.setBoat_name(boat_name);
    	materielApply.setMateriel_name(materiel_name);
    	materielApply.setSailor_name(sailor_name);
    	
		return materielApply;
	}

	@Override
	public void materielApplyUpdate(int i, int id, String precheck_content, String check_id) {
		materielDao.materielApplyUpdate(i,id, precheck_content, check_id);
		
	}

	@Override
	public MaterielApply getMaterielApplyById(int id) {
		MaterielApply materielApply  = materielDao.getMaterielApplyById(id);
		String boatName = boatDao.boatNameFindById(materielApply.getBoat_id());
		materielApply.setBoat_name(boatName);
		String sailorId = sailorDao.SailorFindById(materielApply.getCreate_id());
		materielApply.setSailor_name(sailorId);
		return materielApply;
	}

	@Override
	public void materielApplyQuoteDo(Date deadline, int id) {
		materielDao.materielApplyStatusUpdate(3,id);
		List<String> EmailList = supplierDao.getAllEmail();

        try {
			MaterielApply materielApply  = materielDao.getMaterielApplyById(id);
			Materiel materiel = materielDao.materielFindDetail(materielApply.getMateriel_id());

			byte[] bytes =  ExcelUtil.getExcelBytes(materiel.getName(),materiel.getType(),materiel.getStandard_code(),materiel.getStandard(),materielApply.getCount(),deadline);

            //---处理excel

            for(String email:EmailList){
                EmaiUtil.sendMail("物料询价单",email,"您好，这是物料询价表，请查收",bytes);
            }

        }catch (Exception e){
            e.printStackTrace();
        }

	}

	@Override
	public List<MaterielQuote> getMaterielQuoteByApplyId(int id){
		return materielQuoteDao.selectByMaterielApplyId(id);
	}

    @Override
    public MaterielQuote getMaterielQuoteById(int id) {
        return materielQuoteDao.selectByPrimaryKeyWithName(id);
    }

	@Override
	public void materielPurchaseDo(int applyId, int quote_id, String purchaseContent,int current_count,int price,int boatId,double remained) {
		int totalPrice = current_count*price;
		Calendar calendar =Calendar.getInstance();
		if (totalPrice<=remained){
			budgetDao.updateRemained(boatId,calendar.get(Calendar.YEAR),remained-totalPrice);
			MaterielPurchase materielPurchase = new MaterielPurchase();
			materielPurchase.setMaterielApplyId(applyId);
			materielPurchase.setMaterielQuoteId(quote_id);
			materielPurchase.setContent(purchaseContent);
			BigDecimal bigDecimal = new BigDecimal(totalPrice);
			materielPurchase.setTotalPrice(bigDecimal);
			//获取用户ID
			Subject subject = SecurityUtils.getSubject();
			String creatId = subject.getPrincipal().toString();
			materielPurchase.setCreateId(creatId);
			Date date =new Date();
			materielPurchase.setCreateTime(date);
			materielPurchase.setCurrentCount(current_count);
			if(totalPrice>=10000000){
				materielPurchase.setStatus(new Byte("1"));
				materielDao.materielApplyStatusUpdate(4,applyId);
			}else{
				materielPurchase.setStatus(new Byte("0"));
				materielDao.materielApplyStatusUpdate(5,applyId);
			}
			materielPurchaseDao.insertSelective(materielPurchase);
		}
	}

	@Override
	public MaterielPurchase getMaterielPurchaseByApplyId(int id) {
		return materielPurchaseDao.getMaterielPurchaseByApplyId(id);
	}

    @Override
    public void materielFinalCheckYes(int applyId, String checkContent) {
        materielDao.materielApplyStatusUpdate(5,applyId);
        MaterielPurchase materielPurchase = new MaterielPurchase();
        materielPurchase.setMaterielApplyId(applyId);
        materielPurchase.setCheckContent(checkContent);
        materielPurchase.setStatus(new Byte("2"));
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String checkId = subject.getPrincipal().toString();
        materielPurchase.setCheckId(checkId);
        materielPurchaseDao.updateByApplyIdSelective(materielPurchase);
    }

    @Override
    public void materielFinalCheckNo(int applyId, String checkContent) {
        materielDao.materielApplyStatusUpdate(8,applyId);
        MaterielPurchase materielPurchase = new MaterielPurchase();
        materielPurchase.setMaterielApplyId(applyId);
        materielPurchase.setCheckContent(checkContent);
        materielPurchase.setStatus(new Byte("5"));
        //获取用户ID
        Subject subject = SecurityUtils.getSubject();
        String checkId = subject.getPrincipal().toString();
        materielPurchase.setCheckId(checkId);
        materielPurchaseDao.updateByApplyIdSelective(materielPurchase);
    }

    @Override
    public String SailorFindById(String sailorId) {
        return sailorDao.SailorFindById(sailorId);
    }

	@Override
	public void materielPurchaseDidDo(int applyId) {
		materielDao.materielApplyStatusUpdate(6,applyId);
		MaterielPurchase materielPurchase = new MaterielPurchase();
		materielPurchase.setMaterielApplyId(applyId);
		materielPurchase.setStatus(new Byte("3"));
		materielPurchaseDao.updateByApplyIdSelective(materielPurchase);
	}

	@Override
	public void materielPurchaseIncomeDo(int applyId, BigDecimal incomeCount, String incomeContent, int boatId, int materielId) {
		materielDao.materielApplyStatusUpdate(7,applyId);
		MaterielPurchase materielPurchase = new MaterielPurchase();
		materielPurchase.setMaterielApplyId(applyId);
		materielPurchase.setStatus(new Byte("4"));
		materielPurchase.setIncomeContent(incomeContent);
		materielPurchase.setIncomeCount(incomeCount);
		materielPurchaseDao.updateByApplyIdSelective(materielPurchase);

		String storageId = materielStorageDao.getIdByApplyMaterielId(materielId);
		if(storageId==null){
			MaterielStorage materielStorage = new MaterielStorage();
			materielStorage.setBoatId(boatId);
			materielStorage.setMaterielId(materielId);
			materielStorage.setCount(incomeCount);
			//获取用户ID
			Subject subject = SecurityUtils.getSubject();
			String updateId = subject.getPrincipal().toString();
			materielStorage.setUpdateId(updateId);
			Date date = new Date();
			materielStorage.setUpdateTime(date);
			materielStorageDao.insertSelective(materielStorage);
		}else{
			MaterielStorage materielStorage = new MaterielStorage();
			//获取用户ID
			Subject subject = SecurityUtils.getSubject();
			String updateId = subject.getPrincipal().toString();
			materielStorage.setUpdateId(updateId);
			Date date = new Date();
			materielStorage.setUpdateTime(date);
			materielStorage.setCount(incomeCount);
			materielStorage.setId(new Integer(storageId));
			materielStorageDao.addCount(materielStorage);
		}


	}

	/*@Override
	public MaterielApply getMaterielApplyById(int id) {
		// TODO Auto-generated method stub
		return null;
	}*/


}
