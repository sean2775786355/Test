package com.safewind.pms.po;

import java.util.Date;

/**
 * Created by lxy on 2016/9/26.
 */
public class Cwbt {
    private int id;
    private String code1;
    private String code2;
    private String code3;
    private String code4;
    private String name;
    private String content;
    private String createId;
    private Date createTime;
    private byte isBand;
    private int defaultDuty;



    @Override
    public String toString(){
        StringBuilder sb = new StringBuilder("Cwbt{");
        sb.append("id=").append(id);
        sb.append(", code1='").append(code1).append('\'');
        sb.append(", code2='").append(code2).append('\'');
        sb.append(", code3='").append(code3).append('\'');
        sb.append(", code4='").append(code4).append('\'');
        sb.append(", name='").append(name).append('\'');
        sb.append(", content='").append(content).append('\'');
        sb.append(", createId='").append(createId).append('\'');
        sb.append(", createTime='").append(createTime).append('\'');
        sb.append(", defaultDuty='").append(defaultDuty).append('\'');
        sb.append(", isBand=").append(isBand).append('\'');
        sb.append('}');
        return sb.toString();
    }


    public int getDefaultDuty() {
        return defaultDuty;
    }

    public void setDefaultDuty(int defaultDuty) {
        this.defaultDuty = defaultDuty;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode1() {
        return code1;
    }

    public void setCode1(String code1) {
        this.code1 = code1;
    }

    public String getCode2() {
        return code2;
    }

    public void setCode2(String code2) {
        this.code2 = code2;
    }

    public String getCode3() {
        return code3;
    }

    public void setCode3(String code3) {
        this.code3 = code3;
    }

    public String getCode4() {
        return code4;
    }

    public void setCode4(String code4) {
        this.code4 = code4;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateId() {
        return createId;
    }

    public void setCreateId(String createId) {
        this.createId = createId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public byte getIsBand() {
        return isBand;
    }

    public void setIsBand(byte isBand) {
        this.isBand = isBand;
    }
}
