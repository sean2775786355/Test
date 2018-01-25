package com.safewind.pms.po;

import java.util.Date;

import org.springframework.stereotype.Repository;


@Repository
public class CheckBoatManage {
	
	private int id;
	
	private String subject;
	
	private String contentSend;
	
	private String contentReply;
	
	private int boatId;
	
	private Date sendTime;
	
	private Date replyTime;
	
	private int is_del;
	
	private int status;
	
	private String boatName;

	public String getBoatName() {
		return boatName;
	}

	public void setBoatName(String boatName) {
		this.boatName = boatName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContentSend() {
		return contentSend;
	}

	public void setContentSend(String contentSend) {
		this.contentSend = contentSend;
	}

	public String getContentReply() {
		return contentReply;
	}

	public void setContentReply(String contentReply) {
		this.contentReply = contentReply;
	}


	public int getBoatId() {
		return boatId;
	}

	public void setBoatId(int boatId) {
		this.boatId = boatId;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public Date getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}

	public int getIs_del() {
		return is_del;
	}

	public void setIs_del(int is_del) {
		this.is_del = is_del;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "CheckBoatManage [id=" + id + ", subject=" + subject
				+ ", contentSend=" + contentSend + ", contentReply="
				+ contentReply + ", boatId="
				+ boatId + ", sendTime=" + sendTime + ", replyTime="
				+ replyTime + ", boatName=" + boatName + ", is_del=" + is_del + ", status=" + status + "]";
	}

	

}
