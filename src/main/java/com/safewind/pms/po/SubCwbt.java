package com.safewind.pms.po;

import java.util.Date;

/**
 * Created by lxy on 2016/9/26.
 */
public class SubCwbt {
    private int id;
    private String code;
    private String name;
    private String eName;
    private String content;
    private byte isBand;
    private String createId;
    private Date createTime;

    @Override
    public String toString(){
        StringBuilder sb = new StringBuilder("SubCwbt{");
        sb.append("id=").append(id);
        sb.append(", code='").append(code).append('\'');
        sb.append(", name='").append(name).append('\'');
        sb.append(", eName='").append(eName).append('\'');
        sb.append(", content='").append(content).append('\'');;
        sb.append(", isBand='").append(isBand).append('\'');;
        sb.append(", createId='").append(createId).append('\'');;
        sb.append(", createTime='").append(createTime);
        sb.append('}');
        return sb.toString();
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateId() {
        return createId;
    }

    public void setCreateId(String createId) {
        this.createId = createId;
    }

    public byte getIsBand() {
        return isBand;
    }

    public void setIsBand(byte isBand) {
        this.isBand = isBand;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
