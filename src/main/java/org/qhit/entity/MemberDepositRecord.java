package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class MemberDepositRecord {
	private Integer mdrId;//primary key,
	private String serialNumber;//'流水号',
	private Integer memberId;//'用户id',
	private Float amount;//'金额',
	private Integer status;//'状态(0:待付款;1:完成)',
	private String payChannelName;//'充值渠道名称',
	private String payChannelOrderNo;//'充值渠道订单号',
	private Integer delFlag;
	private Date createDate;
	private Date updateDate;

	@Id
	@SequenceGenerator(name="seq_member_deposit_record",sequenceName="seq_member_deposit_record",allocationSize=1)
	@GeneratedValue(generator="seq_member_deposit_record",strategy=GenerationType.SEQUENCE)
	public Integer getMdrId() {
		return mdrId;
	}
	public void setMdrId(Integer mdrId) {
		this.mdrId = mdrId;
	}

	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getPayChannelName() {
		return payChannelName;
	}
	public void setPayChannelName(String payChannelName) {
		this.payChannelName = payChannelName;
	}
	public String getPayChannelOrderNo() {
		return payChannelOrderNo;
	}
	public void setPayChannelOrderNo(String payChannelOrderNo) {
		this.payChannelOrderNo = payChannelOrderNo;
	}
	public Integer getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
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
	public MemberDepositRecord(String serialNumber, Integer memberId, Float amount, Integer status,
			String payChannelName, String payChannelOrderNo, Integer delFlag, Date createDate, Date updateDate) {
		super();
		this.serialNumber = serialNumber;
		this.memberId = memberId;
		this.amount = amount;
		this.status = status;
		this.payChannelName = payChannelName;
		this.payChannelOrderNo = payChannelOrderNo;
		this.delFlag = delFlag;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	public MemberDepositRecord() {
		super();
	}



}
