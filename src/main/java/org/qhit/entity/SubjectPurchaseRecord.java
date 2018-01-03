package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class SubjectPurchaseRecord {
	private Integer sprId;//  number primary key,
	private String serialNumber;//  varchar2(50) ,-- '流水号',
	private Float amount;//  binary_float, -- '购买金额',
	private String dealIp;//  varchar2(25) ,-- '交易ip',
	private Integer subjectId;//  number ,-- '标的Id',
	private Integer memberId;//  number,
	private Integer delflag;//  number,
	private Date createDate;//  date,
	private Date updateDate;//  date,
	private Float interest;//  decimal(16,4) ,-- '结算利息',
	private Integer ispayment;//  number,--'是否还款',
	private Integer payInterestTimes;//  number,
	private Integer lastProfitDay;//  number,-- '最后计息日',
	private String bonusInfo;//  varchar2(200) -- '红包金额信息（app端实际投资额度+红包额度）',
	private String status;// varchar2(25), -- '状态'

	@Id
	@SequenceGenerator(name="seq_subject_purchase_record",sequenceName="seq_subject_purchase_record",allocationSize=1)
	@GeneratedValue(generator="seq_subject_purchase_record",strategy=GenerationType.SEQUENCE)
	public Integer getSprId() {
		return sprId;
	}
	public void setSprId(Integer sprId) {
		this.sprId = sprId;
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
	public String getBonusInfo() {
		return bonusInfo;
	}
	public void setBonusInfo(String bonusInfo) {
		this.bonusInfo = bonusInfo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
