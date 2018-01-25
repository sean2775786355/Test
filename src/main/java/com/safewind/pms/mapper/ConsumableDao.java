package com.safewind.pms.mapper;

import java.util.List;

import com.safewind.pms.po.Consumable;
import com.safewind.pms.po.ConsumableApply;
import org.springframework.stereotype.Repository;

@Repository
public interface ConsumableDao {
	
	public List<Consumable> consumableList();
	
	public void consumableDelete(int id);
	
	public Consumable consumableFindDetail(int id);
	
	public void consumableCreate(Consumable consumable);
	
	public void consumableSubmit(Consumable consumable);
	
	public void consumableApplyCreate(ConsumableApply consumableApply);
	
	public List<ConsumableApply> consumableApplyList();
	
	public String consumableApplyFindName(int id);
	
	public ConsumableApply consumableApplyFindDetail(int id);

	public ConsumableApply getConsumableApplyById(int id);
	
	public void consumableApplyUpdate(int i, int id,String precheck_content,String check_id);

	public void consumableApplyStatusUpdate(int status , int id );
}
