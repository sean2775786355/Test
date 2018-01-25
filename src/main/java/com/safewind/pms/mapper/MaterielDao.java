package com.safewind.pms.mapper;

import java.util.List;

import com.safewind.pms.po.Materiel;
import com.safewind.pms.po.MaterielApply;
import org.springframework.stereotype.Repository;

@Repository
public interface MaterielDao {
	
	public List<Materiel> materielList();
	
	public void materielDelete(int id);
	
	public Materiel materielFindDetail(int id);
	
	public void materielCreate(Materiel materiel);
	
	public void materielSubmit(Materiel materiel);
	
	public void materielApplyCreate(MaterielApply materielApply);
	
	public List<MaterielApply> materielApplyList();
	
	public String materielApplyFindName(int id);
	
	public MaterielApply materielApplyFindDetail(int id);

	public MaterielApply getMaterielApplyById(int id);
	
	public void materielApplyUpdate(int i, int id,String precheck_content,String check_id);

	public void materielApplyStatusUpdate(int status , int id );
}
