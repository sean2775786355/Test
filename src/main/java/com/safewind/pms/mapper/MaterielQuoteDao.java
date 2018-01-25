package com.safewind.pms.mapper;

import com.safewind.pms.po.MaterielQuote;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface MaterielQuoteDao {
    int deleteByPrimaryKey(Integer id);

    int insert(MaterielQuote record);

    int insertSelective(MaterielQuote record);

    MaterielQuote selectByPrimaryKey(Integer id);

    MaterielQuote selectByPrimaryKeyWithName(Integer id);

    int updateByPrimaryKeySelective(MaterielQuote record);

    int updateByPrimaryKeyWithBLOBs(MaterielQuote record);

    int updateByPrimaryKey(MaterielQuote record);

    List<MaterielQuote> selectByMaterielApplyId(Integer id);
}