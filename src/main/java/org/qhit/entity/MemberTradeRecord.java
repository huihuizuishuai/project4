package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class MemberTradeRecord {
	private Integer mtrId;//primary key,
	private Integer memberId;//'用户id',
	private String tradeNo;//'交易号',
	private String tradeName;//'交易名称',
	private String counterpart;//'交易对方',
	private Float amount;//'交易金额',
	private String tradeType;//'交易分类',
	private Integer fundFlow;//'资金流向(0:流出1:流入)',
	private Integer tradeStatus;//'交易状态',
	private String extField_1;//'扩展1',
	private String extField_2;//'扩展2',
	private String extField_3;//'扩展3',
	private Date createDate;//'交易时间'
	private Date updateDate;

	@Id
	@SequenceGenerator(name="seq_member_trade_record",sequenceName="seq_member_trade_record",allocationSize=1)
	@GeneratedValue(generator="seq_member_trade_record",strategy=GenerationType.SEQUENCE)
	public Integer getMtrId() {
		return mtrId;
	}
	public void setMtrId(Integer mtrId) {
		this.mtrId = mtrId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getTradeNo() {
		return tradeNo;
	}
	public void setTradeNo(String tradeNo) {
		this.tradeNo = tradeNo;
	}
	public String getTradeName() {
		return tradeName;
	}
	public void setTradeName(String tradeName) {
		this.tradeName = tradeName;
	}
	public String getCounterpart() {
		return counterpart;
	}
	public void setCounterpart(String counterpart) {
		this.counterpart = counterpart;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public String getTradeType() {
		return tradeType;
	}
	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}
	public Integer getFundFlow() {
		return fundFlow;
	}
	public void setFundFlow(Integer fundFlow) {
		this.fundFlow = fundFlow;
	}
	public Integer getTradeStatus() {
		return tradeStatus;
	}
	public void setTradeStatus(Integer tradeStatus) {
		this.tradeStatus = tradeStatus;
	}
	public String getExtField_1() {
		return extField_1;
	}
	public void setExtField_1(String extField_1) {
		this.extField_1 = extField_1;
	}
	public String getExtField_2() {
		return extField_2;
	}
	public void setExtField_2(String extField_2) {
		this.extField_2 = extField_2;
	}
	public String getExtField_3() {
		return extField_3;
	}
	public void setExtField_3(String extField_3) {
		this.extField_3 = extField_3;
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




}
