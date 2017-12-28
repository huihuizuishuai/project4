package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class Members {
	private Integer memberId;//primary key,--'用户id',
	private String memberName;//'真实姓名',
	private String names;//'用户名',
	private String passwords;//'密码',
	private String salts;//'密码盐',
	private String mobilePhone;//'手机号',
	private Integer status;//'账号状态（正常，锁定，删除）',
	private Integer delFlag;//'删除标志',
	private String memberIdentity;//'身份',
	private Date createDate;//'创建时间',
	private Date updateDate;//'修改时间',
	private String weiBoAccount;//'微博账号关联',
	private String weixinAccount;//'微信账号关联',
	private Integer headid;//'头像图片id',
	private String invitationCode;//'邀请码',
	private String withdrawPassword;//'提款密码',
	private String qqAccount;//'QQ账号关联',
	private String invitedCode;//'被邀请码',
	private String qqNumber;// 'QQ号码',

	@Id
	@SequenceGenerator(name="seq_members",sequenceName="seq_members",allocationSize=1)
	@GeneratedValue(generator="seq_members",strategy=GenerationType.SEQUENCE)
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public String getPasswords() {
		return passwords;
	}
	public void setPasswords(String passwords) {
		this.passwords = passwords;
	}
	public String getSalts() {
		return salts;
	}
	public void setSalts(String salts) {
		this.salts = salts;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
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
	public String getMemberIdentity() {
		return memberIdentity;
	}
	public void setMemberIdentity(String memberIdentity) {
		this.memberIdentity = memberIdentity;
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
	public String getWeiBoAccount() {
		return weiBoAccount;
	}
	public void setWeiBoAccount(String weiBoAccount) {
		this.weiBoAccount = weiBoAccount;
	}
	public String getWeixinAccount() {
		return weixinAccount;
	}
	public void setWeixinAccount(String weixinAccount) {
		this.weixinAccount = weixinAccount;
	}
	public Integer getHeadid() {
		return headid;
	}
	public void setHeadid(Integer headid) {
		this.headid = headid;
	}
	public String getInvitationCode() {
		return invitationCode;
	}
	public void setInvitationCode(String invitationCode) {
		this.invitationCode = invitationCode;
	}
	public String getWithdrawPassword() {
		return withdrawPassword;
	}
	public void setWithdrawPassword(String withdrawPassword) {
		this.withdrawPassword = withdrawPassword;
	}
	public String getQqAccount() {
		return qqAccount;
	}
	public void setQqAccount(String qqAccount) {
		this.qqAccount = qqAccount;
	}
	public String getInvitedCode() {
		return invitedCode;
	}
	public void setInvitedCode(String invitedCode) {
		this.invitedCode = invitedCode;
	}
	public String getQqNumber() {
		return qqNumber;
	}
	public void setQqNumber(String qqNumber) {
		this.qqNumber = qqNumber;
	}
	@Override
	public String toString() {
		return "Members [memberId=" + memberId + ", memberName=" + memberName + ", names=" + names + ", passwords="
				+ passwords + ", salts=" + salts + ", mobilePhone=" + mobilePhone + ", status=" + status + ", delFlag="
				+ delFlag + ", memberIdentity=" + memberIdentity + ", createDate=" + createDate + ", updateDate="
				+ updateDate + ", weiBoAccount=" + weiBoAccount + ", weixinAccount=" + weixinAccount + ", headid="
				+ headid + ", invitationCode=" + invitationCode + ", withdrawPassword=" + withdrawPassword
				+ ", qqAccount=" + qqAccount + ", invitedCode=" + invitedCode + ", qqNumber=" + qqNumber + "]";
	}




}
