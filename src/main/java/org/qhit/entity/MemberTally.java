package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class MemberTally {
	private Integer memberTallyId;//primary key,
	private Integer memberId;//'锟矫伙拷id',
	private Integer typeId;//'锟斤拷锟斤拷锟斤拷锟斤拷id',
	private String typeName;//'锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷',
	private Float amount;//T '锟斤拷锟�',
	private Date payDate;;
	private Date createDate;

	@Id
	@SequenceGenerator(name="seq_member_tally",sequenceName="seq_member_tally",allocationSize=1)
	@GeneratedValue(generator="seq_member_tally",strategy=GenerationType.SEQUENCE)
	public Integer getMemberTallyId() {
		return memberTallyId;
	}
	public void setMemberTallyId(Integer memberTallyId) {
		this.memberTallyId = memberTallyId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
