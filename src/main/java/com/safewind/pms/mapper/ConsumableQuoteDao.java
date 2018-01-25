package com.safewind.pms.mapper;

import com.safewind.pms.po.ConsumableQuote;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ConsumableQuoteDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ConsumableQuote record);

    int insertSelective(ConsumableQuote record);

    ConsumableQuote selectByPrimaryKey(Integer id);

    ConsumableQuote selectByPrimaryKeyWithName(Integer id);

    int updateByPrimaryKeySelective(ConsumableQuote record);

    int updateByPrimaryKeyWithBLOBs(ConsumableQuote record);

    int updateByPrimaryKey(ConsumableQuote record);

    List<ConsumableQuote> selectByConsumableApplyId(Integer id);
}