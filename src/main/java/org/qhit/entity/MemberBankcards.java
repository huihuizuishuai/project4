package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.SequenceGenerator;
@Entity
public class MemberBankcards {
	private Integer memberBankcardsId;//primary key,
	private String memberBankcardsType;//'���п�����',
	private Integer memberId;//'�û�id',
	private String cardNo;//'����',
	private Integer delflag;//��0������ʹ�ã�2����ɾ����',
	private Date createDate;
	private Date updateDate;
	private String cardaddress;//'�����������ڵ�',

	@Id
	@SequenceGenerator(name="seq_member_bankcards",sequenceName="seq_member_bankcards",allocationSize=1)
	@GeneratedValue(generator="seq_member_bankcards",strategy=GenerationType.SEQUENCE)
	public Integer getMemberBankcardsId() {
		return memberBankcardsId;
	}
	public void setMemberBankcardsId(Integer memberBankcardsId) {
		this.memberBankcardsId = memberBankcardsId;
	}
	public String getMemberBankcardsType() {
		return memberBankcardsType;
	}
	public void setMemberBankcardsType(String memberBankcardsType) {
		this.memberBankcardsType = memberBankcardsType;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
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
	public String getCardaddress() {
		return cardaddress;
	}
	public void setCardaddress(String cardaddress) {
		this.cardaddress = cardaddress;
	}




}
