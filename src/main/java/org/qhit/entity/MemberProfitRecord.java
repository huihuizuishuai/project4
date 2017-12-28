package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class MemberProfitRecord {
	private Integer mprId;// primary key,
	private String serialNumber;//'锟斤拷水锟斤拷',
	private Integer mprType;
	private Float amount;//'锟斤拷锟�',
	private Integer memberId;//'锟矫伙拷id',
	private Integer delflag;
	private Date createDate;
	private Integer updateDate;
	private String mprComment;// '锟斤拷注',
	private Integer purchaseId;//'锟斤拷锟絠d',
	private Integer profitYear;//'锟斤拷息锟斤拷',
	private Integer profitMonth;//'锟斤拷息锟斤拷',
	private Integer profitDay;//'锟斤拷息锟斤拷',

	@Id
	@SequenceGenerator(name="seq_member_profit_record",sequenceName="seq_member_profit_record",allocationSize=1)
	@GeneratedValue(generator="seq_member_profit_record",strategy=GenerationType.SEQUENCE)
	public Integer getMprId() {
		return mprId;
	}
	public void setMprId(Integer mprId) {
		this.mprId = mprId;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	public Integer getMprType() {
		return mprType;
	}
	public void setMprType(Integer mprType) {
		this.mprType = mprType;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public Integer getDelflag() {
		return delflag;
	}
	public void setDelflag(Integer delflag) {
		this.delflag = delflag;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Integer updateDate) {
		this.updateDate = updateDate;
	}
	public String getMprComment() {
		return mprComment;
	}
	public void setMprComment(String mprComment) {
		this.mprComment = mprComment;
	}
	public Integer getPurchaseId() {
		return purchaseId;
	}
	public void setPurchaseId(Integer purchaseId) {
		this.purchaseId = purchaseId;
	}
	public Integer getProfitYear() {
		return profitYear;
	}
	public void setProfitYear(Integer profitYear) {
		this.profitYear = profitYear;
	}
	public Integer getProfitMonth() {
		return profitMonth;
	}
	public void setProfitMonth(Integer profitMonth) {
		this.profitMonth = profitMonth;
	}
	public Integer getProfitDay() {
		return profitDay;
	}
	public void setProfitDay(Integer profitDay) {
		this.profitDay = profitDay;
	}




}
