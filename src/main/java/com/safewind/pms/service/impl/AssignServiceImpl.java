package com.safewind.pms.service.impl;

import com.safewind.pms.mapper.*;
import com.safewind.pms.po.*;
import com.safewind.pms.service.AssignService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by lxy on 2016/11/12.
 */
@Service
public class AssignServiceImpl implements AssignService {

    @Autowired
    private AssignDao assignDao;
    @Autowired
    private EquipmentDao equipmentDao;
    @Autowired
    private BoatDao boatDao;
    @Autowired
    private SailorDao sailorDao;
    @Autowired
    private BoatManageDao boatManageDao;
    @Autowired
    private CwbtDao cwbtDao;

    @Override
    public Attemper getOperator(){
        //获取用户名
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();
        Attemper attemper =assignDao.getAttemperBySailorId(sailorId);
        System.out.println(attemper);

        return assignDao.getAttemperBySailorId(sailorId);
    }


    @Override
    public List<AttemperAll> getAvailableAttemperAll(int boatId){
        List<Attemper> attemperList = assignDao.getAvailableAttemper(boatId);
        List<AttemperAll> attemperAllList = new ArrayList<>();
        for(int i=0;i<attemperList.size();i++){
            attemperAllList.add(this.AttemperToAttemperAll(attemperList.get(i)));
        }


        return attemperAllList;

    }



    @Override
    public List<ServiceDateAll> getTask(Byte eType, int boatId, int status1, int status2){
        List<ServiceDate> serviceDateList = assignDao.getServiceDateByBoatIdStatus(eType,boatId,status1,status2);
        List<ServiceDateAll> serviceDateAllList = new ArrayList<>();
        for(int i=0;i<serviceDateList.size();i++){
            serviceDateAllList.add(this.ServiceDateToServiceDateAll(serviceDateList.get(i)));
        }
        return serviceDateAllList;
    }

    //分配更新
    @Override
    public void serviceDateAssignOk(int id ,String serviceContent, String didId ){
        //获取用户名
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();
        assignDao.serviceDateAssignOk(id,serviceContent,didId,sailorId);
    }

    //放弃维护
    @Override
    public int giveUp(int id,String bandContent,int boatId){
        BoatManage boatManage =  boatManageDao.selectByBoatId(boatId);
        if(boatManage!=null){
            assignDao.giveUp(id,bandContent,boatManage.getSailorId());
            return 1;
        }
        return 0;
    }

    //工作查询
    @Override
    public List<ServiceDateAll> getTask2(){
        //获取用户名
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();



        List<ServiceDate> serviceDateList = assignDao.getServiceDateByDidId(sailorId);
        List<ServiceDateAll> serviceDateAllList = new ArrayList<>();
        for(int i=0;i<serviceDateList.size();i++){
            serviceDateAllList.add(this.ServiceDateToServiceDateAll(serviceDateList.get(i)));
        }
        return serviceDateAllList;
    }





    //提交维护表
    @Override
    public void serviceDateReportOk(int id, Date didTime, String content){
        assignDao.serviceDateReportOk(id,didTime,content);
    }


    //船长审核成功
    public void serviceDateBocheckOk(int id ,int boatId){
        Date date =new Date();
        BoatManage boatManage =  boatManageDao.selectByBoatId(boatId);
        if(boatManage!=null){
            assignDao.serviceDateBocheckOk(id,date,boatManage.getSailorId());
        }
    }
    //船长审核失败
    public void serviceDateBocheckNo(int id , String checkContent){
        assignDao.serviceDateBocheckNo(id, checkContent);
    }
    //岸上审核工作查询
    public List<ServiceDateAll> getServiceDateByAshoreId(){
        //获取用户名
        Subject subject = SecurityUtils.getSubject();
        String sailorId = subject.getPrincipal().toString();

        List<ServiceDate> serviceDateList = assignDao.getServiceDateByAshoreId(sailorId);
        List<ServiceDateAll> serviceDateAllList = new ArrayList<>();
        for(int i=0;i<serviceDateList.size();i++){
            serviceDateAllList.add(this.ServiceDateToServiceDateAll(serviceDateList.get(i)));
        }
        return serviceDateAllList;
    }
    //岸上未通过
    public void serviceDateShcheckNo(int id ,String shoreContent){
        assignDao.serviceDateShcheckNo(id,shoreContent);
    }
    //岸上通过
    public void serviceDateShcheckOk(int id ,String shoreContent){
        Date date = new Date();
        assignDao.serviceDateShcheckOk(id,date,shoreContent);

    }
























    private AttemperAll AttemperToAttemperAll(Attemper attemper){
        AttemperAll attemperAll = new AttemperAll();
        attemperAll.setId(attemper.getId());
        attemperAll.setSailor_id(attemper.getSailor_id());
        attemperAll.setName(attemper.getName());
        attemperAll.setStatus(attemper.getStatus());
        attemperAll.setLongevity_id(attemper.getLongevity_id());
        attemperAll.setUpdate_id(attemper.getUpdate_id());
        attemperAll.setUpdate_time(attemper.getUpdate_time());
        attemperAll.setIs_del(attemper.getIs_del());
        attemperAll.setBoat_id(attemper.getBoat_id());
        attemperAll.setDuty(attemper.getDuty());
        attemperAll.setContent(attemper.getContent());
        attemperAll.setTime(attemper.getTime());

        int duty = attemper.getDuty();
        String dutyName = null;
        if(duty==0){
            dutyName="水手";
        }else if(duty==1){
            dutyName="船长";
        }else if(duty==2){
            dutyName="大副";
        }else if(duty==3){
            dutyName="二副";
        }else if(duty==4){
            dutyName="三副";
        }else if(duty==5){
            dutyName="水手长";
        }else if(duty==6){
            dutyName="轮机长";
        }else if(duty==7){
            dutyName="大管轮";
        }else if(duty==8){
            dutyName="二管轮";
        }else if(duty==9){
            dutyName="三管轮";
        }else if(duty==10){
            dutyName="机工长";
        }else if(duty==11){
            dutyName="机匠";
        }else if(duty==12){
            dutyName="实习生";
        }else if(duty==13){
            dutyName="大厨";
        }else if(duty==14){
            dutyName="二厨";
        }else if(duty==15){
            dutyName="电机员";
        }else if(duty==16){
            dutyName="船医";
        }else if(duty==17){
            dutyName="政委";
        }else if(duty==18){
            dutyName="铜匠";
        }else if(duty==19){
            dutyName="木匠";
        }else if(duty==80){
            dutyName="其他1";
        }else if(duty==81){
            dutyName="其他2";
        }else if(duty==83){
            dutyName="其他3";
        }else if(duty==84){
            dutyName="岸基管理员";
        }else if(duty==90){
            dutyName="待派";
        }else if(duty==99){
            dutyName="面试生";
        }
        attemperAll.setDutyName(dutyName);
        return attemperAll;
    }



    private ServiceDateAll ServiceDateToServiceDateAll(ServiceDate serviceDate){
        ServiceDateAll serviceDateAll = new ServiceDateAll();
        serviceDateAll.setId(serviceDate.getId());
        serviceDateAll.setEquipmentId(serviceDate.getEquipmentId());
        serviceDateAll.setBcrId(serviceDate.getBcrId());
        serviceDateAll.setFinishTime(serviceDate.getFinishTime());
        serviceDateAll.setDidId(serviceDate.getDidId());
        serviceDateAll.setCheckId(serviceDate.getCheckId());
        serviceDateAll.setCheckStatus(serviceDate.getCheckStatus());
        serviceDateAll.setIsBand(serviceDate.getIsBand());
        serviceDateAll.setIsDel(serviceDate.getIsDel());
        serviceDateAll.setIsDone(serviceDate.getIsDone());
        serviceDateAll.setContent(serviceDate.getContent());
        serviceDateAll.setDidTime(serviceDate.getDidTime());
        serviceDateAll.setCheckTime(serviceDate.getCheckTime());
        serviceDateAll.setDateType(serviceDate.getDateType());
        serviceDateAll.setStatus(serviceDate.getStatus());
        serviceDateAll.setServiceLevel(serviceDate.getServiceLevel());
        serviceDateAll.setServiceContent(serviceDate.getServiceContent());
        serviceDateAll.setShoreId(serviceDate.getShoreId());
        serviceDateAll.setBoatId(serviceDate.getBoatId());
        serviceDateAll.setShoreTime(serviceDate.getShoreTime());
        serviceDateAll.setEstimatedTime(serviceDate.getEstimatedTime());
        serviceDateAll.setShoreContent(serviceDate.getShoreContent());
        serviceDateAll.setType(serviceDate.getType());
        serviceDateAll.setCheckContent(serviceDate.getCheckContent());
        serviceDateAll.seteType(serviceDate.geteType());
        serviceDateAll.setBandContent(serviceDate.getBandContent());

        Equipment equipment = equipmentDao.getEquipment(serviceDate.getEquipmentId());
        if(equipment!=null){
            Cwbt cwbt = cwbtDao.getCwbtById(equipment.getCwbtId());
            if(cwbt!=null){
                serviceDateAll.setDefaultDuty(cwbt.getDefaultDuty());
            }
            serviceDateAll.setEquipmentName(equipment.getName());
        }
        Boat boat = boatDao.getBoatInfo(serviceDate.getBoatId());
        if(boat!=null){
            serviceDateAll.setBoatName(boat.getName());
        }
        Sailor sailor = sailorDao.SailorInfoMessage(serviceDate.getDidId());
        if(sailor!=null){
            serviceDateAll.setDidName(sailor.getName());
        }
        if(serviceDate.getIsBand()==1){
            serviceDateAll.setContent("放弃维护："+serviceDate.getBandContent());
        }

        return serviceDateAll;
    }





}
