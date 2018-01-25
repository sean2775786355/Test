package com.safewind.pms.po;

import java.math.BigDecimal;
import java.util.Date;

public class ConsumablePurchase {
    private Integer id;

    private Integer consumableApplyId;

    private Integer consumableQuoteId;

    private String content;

    private BigDecimal totalPrice;

    private Byte status;

    private String checkContent;

    private String incomeContent;

    private BigDecimal incomeCount;

    private String createId;

    private Date createTime;

    private Byte isDel;

    private Integer currentCount;

    private String checkId;

    public String getCheckId() {
        return checkId;
    }

    public void setCheckId(String checkId) {
        this.checkId = checkId;
    }

    public Integer getCurrentCount() {
        return currentCount;
    }

    public void setCurrentCount(Integer currentCount) {
        this.currentCount = currentCount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getConsumableApplyId() {
        return consumableApplyId;
    }

    public void setConsumableApplyId(Integer consumableApplyId) {
        this.consumableApplyId = consumableApplyId;
    }

    public Integer getConsumableQuoteId() {
        return consumableQuoteId;
    }

    public void setConsumableQuoteId(Integer consumableQuoteId) {
        this.consumableQuoteId = consumableQuoteId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public String getCheckContent() {
        return checkContent;
    }

    public void setCheckContent(String checkContent) {
        this.checkContent = checkContent == null ? null : checkContent.trim();
    }

    public String getIncomeContent() {
        return incomeContent;
    }

    public void setIncomeContent(String incomeContent) {
        this.incomeContent = incomeContent == null ? null : incomeContent.trim();
    }

    public BigDecimal getIncomeCount() {
        return incomeCount;
    }

    public void setIncomeCount(BigDecimal incomeCount) {
        this.incomeCount = incomeCount;
    }

    public String getCreateId() {
        return createId;
    }

    public void setCreateId(String createId) {
        this.createId = createId == null ? null : createId.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Byte getIsDel() {
        return isDel;
    }

    public void setIsDel(Byte isDel) {
        this.isDel = isDel;
    }
}