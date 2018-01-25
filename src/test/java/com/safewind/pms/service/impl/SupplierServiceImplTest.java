package com.safewind.pms.service.impl;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.safewind.pms.po.Supplier;
import com.safewind.pms.service.SupplierService;


@RunWith(SpringJUnit4ClassRunner.class) // 整合
@ContextConfiguration(locations={"classpath:spring-config.xml"}) // 加载配置
public class SupplierServiceImplTest {
    @Autowired private SupplierService supplierService;

    @Test
    public void test1()
    {
    	List<Supplier> supplierList = supplierService.supplierList();
    	System.out.println(supplierList);
    }
}
//    @Test
//    public void test2()
//    {
//       BoatService boatService = equipmentServiceImpl.getBoatServiceInfoByCwbtCode("AS-010-503");
//        System.out.println(boatService.toString());
//    }
//}

