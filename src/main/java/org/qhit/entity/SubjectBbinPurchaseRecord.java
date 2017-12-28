package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class SubjectBbinPurchaseRecord {
	private Integer sbprId;//primary key,
	private String serialNumber;//,-- '流水号',
	private Float amount;//-- '购买金额',
	private String dealIp;// ,-- '交易ip',
	private Integer subjectId;//,-- '标的Id',
	private Integer memberId ;// ,
	private Integer delflag;//,
	private Date createDate;//
	private Date updateDate;//
	private Float interest;//,-- '结算利息',
	private Integer ispayment;//-'是否还款',
	private Integer payInterestTimes;//
	private Integer lastProfitDay;//--'最后计息日',

	@Id
	@SequenceGenerator(name="seq_subject_bbin_purchase_record",sequenceName="seq_subject_bbin_record",allocationSize=1)
	@GeneratedValue(generator="seq_subject_bbin_purchase_record",strategy=GenerationType.SEQUENCE)
	public Integer getSbprId() {
		return sbprId;
	}
	public void setSbprId(Integer sbprId) {
		this.sbprId = sbprId;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public String getDealIp() {
		return dealIp;
	}
	public void setDealIp(String dealIp) {
		this.dealIp = dealIp;
	}
	public Integer getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
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
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Float getInterest() {
		return interest;
	}
	public void setInterest(Float interest) {
		this.interest = interest;
	}
	public Integer getIspayment() {
		return ispayment;
	}
	public void setIspayment(Integer ispayment) {
		this.ispayment = ispayment;
	}
	public Integer getPayInterestTimes() {
		return payInterestTimes;
	}
	public void setPayInterestTimes(Integer payInterestTimes) {
		this.payInterestTimes = payInterestTimes;
	}
	public Integer getLastProfitDay() {
		return lastProfitDay;
	}
	public void setLastProfitDay(Integer lastProfitDay) {
		this.lastProfitDay = lastProfitDay;
	}
	@Override
	public String toString() {
		return "SubjectBbinPurchaseRecord [sbprId=" + sbprId + ", serialNumber=" + serialNumber + ", amount=" + amount
				+ ", dealIp=" + dealIp + ", subjectId=" + subjectId + ", memberId=" + memberId + ", delflag=" + delflag
				+ ", createDate=" + createDate + ", updateDate=" + updateDate + ", interest=" + interest
				+ ", ispayment=" + ispayment + ", payInterestTimes=" + payInterestTimes + ", lastProfitDay="
				+ lastProfitDay + "]";
	}
	
	
	




}
