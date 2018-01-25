package com.safewind.pms.service.impl;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.safewind.pms.po.*;
import com.safewind.pms.service.CwbtService;
import com.safewind.pms.service.DemoTask;
import com.safewind.pms.service.EquipmentService;
import com.safewind.pms.service.TimeReduceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

/**
 * Created by 门铎 on 2016/8/27.
 */

@Service
public class DemoTaskImpl implements DemoTask {
	@Autowired private TimeReduceService timeReduceService;
	@Autowired private EquipmentService equipmentService;
	@Autowired private CwbtService cwbtService;
    /**
     * 每小时执行一次
     */ 
	@Override
    @Scheduled(fixedRate = 1000*60*60)
    public void EquipmentRunAsHourJob() {
        System.out.println("--------------");
        System.out.println("1小时执行一次");
        String flag = "A";                    //定好等级flag
		int sum = 0;
        List<Time> time_list = timeReduceService.timeList();  //timeList

        for(int i=0;i<time_list.size();i++){
			Time time1 = time_list.get(i);       //得到time表信息
			Level level = timeReduceService.levelSelect(time1.getService_level()); //得到等级信息
			Equipment equipment = equipmentService.getEquipment(Integer.valueOf(time1.getEquipment_id()));
			//指定时间输出格式
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Date dt = new Date();
//			System.out.println("当前时间：" + sdf.format(dt));
			Calendar rightNow = Calendar.getInstance();
			rightNow.setTime(dt);
//			System.out.println("当前时间：" + sdf.format(rightNow.getTime()));
        if(time1.getCount_type() == 0){
        	timeReduceService.timeReduceDay(time1.getId(),time1.getDay()-1); //直接减一天
            if(time1.getDay() == level.getMin_lack_date()){
            	if(i==0){
            		flag = time1.getService_level();
					rightNow.add(Calendar.DAY_OF_YEAR,level.getMin_lack_date());
					System.out.println("第一次：" + sdf.format(rightNow.getTime()));
            		timeReduceService.dateInsert(time1.getEquipment_id(), time1.getBoat_id(), flag ,rightNow.getTime(),cwbtService.getContent(equipment.getCwbtCode(),time1.getService_level()),time1.getCount_type());
					sum = time1.getDay()+level.getDate();
					System.out.println("更新的date："+sum);
					System.out.println("更新的date："+time1.getDay());
					System.out.println("更新的date："+level.getDate());
					System.out.println("更新的date："+time1.getEquipment_id());
					System.out.println("更新的date："+time1.getBoat_id());
					System.out.println("更新的date："+time1.getService_level());

					timeReduceService.timeUpdateDay(time1.getEquipment_id(),time1.getBoat_id(),time1.getService_level(),sum);
            	}
            	if(i>0){
            		Time time2 = time_list.get(i-1);
            		if(time1.getEquipment_id() == time2.getEquipment_id()&&time1.getService_level().compareTo(flag)>0){
            			flag = time1.getService_level();
						sum = time1.getDay()+level.getDate();
						rightNow.add(Calendar.DAY_OF_YEAR,level.getMin_lack_date());
//						System.out.println("第二次：" + sdf.format(rightNow.getTime()));
            			timeReduceService.dateUpdate(time1.getEquipment_id(), time1.getBoat_id(), flag ,rightNow.getTime(),cwbtService.getContent(equipment.getCwbtCode(),time1.getService_level()),time1.getCount_type());
						timeReduceService.timeUpdateDay(time1.getEquipment_id(),time1.getBoat_id(),time1.getService_level(),sum);
            		}else if(time1.getEquipment_id()!=time2.getEquipment_id()){
            			flag = time1.getService_level();
						sum = time1.getDay()+level.getDate();
						rightNow.add(Calendar.DAY_OF_YEAR,level.getMin_lack_date());
            			timeReduceService.dateInsert(time1.getEquipment_id(), time1.getBoat_id(), flag ,rightNow.getTime(),cwbtService.getContent(equipment.getCwbtCode(),time1.getService_level()),time1.getCount_type());
						timeReduceService.timeUpdateDay(time1.getEquipment_id(),time1.getBoat_id(),time1.getService_level(),sum);
            		}
            	}
            }
        }else if(time1.getCount_type() == 1){
        	timeReduceService.timeReduceHour(time1.getId(),time1.getHour()-equipment.getDailyHour());  //直接减对应小时
			if(time1.getHour() == level.getMin_lack_hour()){
            	if(i==0){
            		flag = time1.getService_level();
					sum = time1.getDay()+level.getDate();
					rightNow.add(Calendar.DAY_OF_YEAR,level.getMin_lack_hour()/equipment.getDailyHour());
            		timeReduceService.dateInsert(time1.getEquipment_id(), time1.getBoat_id(), flag ,rightNow.getTime(),cwbtService.getContent(equipment.getCwbtCode(),time1.getService_level()),time1.getCount_type());
					timeReduceService.timeUpdateHour(time1.getEquipment_id(),time1.getBoat_id(),time1.getService_level(),sum);
            	}
            	if(i>0){
            		Time time2 = time_list.get(i-1);
            		if(time1.getEquipment_id() == time2.getEquipment_id()&&time1.getService_level().compareTo(flag)>0){
            			flag = time1.getService_level();
						sum = time1.getDay()+level.getDate();
						rightNow.add(Calendar.DAY_OF_YEAR,level.getMin_lack_hour()/equipment.getDailyHour());
            			timeReduceService.dateUpdate(time1.getEquipment_id(), time1.getBoat_id(), flag ,rightNow.getTime(),cwbtService.getContent(equipment.getCwbtCode(),time1.getService_level()),time1.getCount_type());
						timeReduceService.timeUpdateHour(time1.getEquipment_id(),time1.getBoat_id(),time1.getService_level(),sum);
            		}else if(time1.getEquipment_id()!=time2.getEquipment_id()){
            			flag = time1.getService_level();
						sum = time1.getDay()+level.getDate();
						rightNow.add(Calendar.DAY_OF_YEAR,level.getMin_lack_hour()/equipment.getDailyHour());
            			timeReduceService.dateInsert(time1.getEquipment_id(), time1.getBoat_id(), flag ,rightNow.getTime(),cwbtService.getContent(equipment.getCwbtCode(),time1.getService_level()),time1.getCount_type());
						timeReduceService.timeUpdateHour(time1.getEquipment_id(),time1.getBoat_id(),time1.getService_level(),sum);
            		}
            	}
            }
        }
        }
        System.out.println("----------------");
    }

    /**
     * 每天凌晨一点执行
     */
	@Override
    @Scheduled(cron = "0 0 1 * * *")
    public void EquipmentRunAsDayJob() {

    }
}
