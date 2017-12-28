package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class MemberWithdrawRecord {
	private Integer mwrId;//primary key,
	private String serialNumber;//'��ˮ��',
	private Integer memberId;//'�û�id',
	private Float amount;//'���ֽ��',
	private String bankName;//'��������',
	private String bankCard;//'����',
	private Integer status;//'����״̬(0:�����;1:�Ѵ��;2�����;3:���ʧ��)',
	private Integer delFlag;
	private String cardaddress;//'�����������ڵ�',
	private String channelName;//'���ͨ��������,������',
	private Date createDate;//
	private Date updateDate;//

	@Id
	@SequenceGenerator(name="seq_member_withdraw_record",sequenceName="seq_member_withdraw_record",allocationSize=1)
	@GeneratedValue(generator="seq_member_withdraw_record",strategy=GenerationType.SEQUENCE)
	public Integer getMwrId() {
		return mwrId;
	}
	public void setMwrId(Integer mwrId) {
		this.mwrId = mwrId;
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
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankCard() {
		return bankCard;
	}
	public void setBankCard(String bankCard) {
		this.bankCard = bankCard;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}
	public String getCardaddress() {
		return cardaddress;
	}
	public void setCardaddress(String cardaddress) {
		this.cardaddress = cardaddress;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
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

	public MemberWithdrawRecord() {
	}
	public MemberWithdrawRecord(String serialNumber, Integer memberId, Float amount, String bankName, String bankCard,
			Integer status, Integer delFlag, String cardaddress, String channelName, Date createDate, Date updateDate) {
		this.serialNumber = serialNumber;
		this.memberId = memberId;
		this.amount = amount;
		this.bankName = bankName;
		this.bankCard = bankCard;
		this.status = status;
		this.delFlag = delFlag;
		this.cardaddress = cardaddress;
		this.channelName = channelName;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

}
