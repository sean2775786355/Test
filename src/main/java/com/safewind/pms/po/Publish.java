package com.safewind.pms.po;

import java.util.Date;

public class Publish {
    private Integer id;

    private String subject;

    private Integer isForBoat;

    private String sailorId;

    private Date publishTime;

    private Date replyTime;

    private Integer isDel;

    private Integer isReply;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject == null ? null : subject.trim();
    }

    public Integer getIsForBoat() {
        return isForBoat;
    }

    public void setIsForBoat(Integer isForBoat) {
        this.isForBoat = isForBoat;
    }

    public String getSailorId() {
        return sailorId;
    }

    public void setSailorId(String sailorId) {
        this.sailorId = sailorId;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Date getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    public Integer getIsReply() {
        return isReply;
    }

    public void setIsReply(Integer isReply) {
        this.isReply = isReply;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}