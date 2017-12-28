package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class MemberPucChargeHome {
	private Integer mpchId;//primary key,
	private Integer memberId;//'�û�id',
	private String name;//'��ͥ����',
	private Integer isDefault;//'�Ƿ�Ĭ��(0:n1:y)',
	private Date createDate;
	private Date updateDate;

	@Id
	@SequenceGenerator(name="seq_member_puc_charge_home",sequenceName="seq_member_puc_charge_home",allocationSize=1)
	@GeneratedValue(generator="seq_member_puc_charge_home",strategy=GenerationType.SEQUENCE)
	public Integer getMpchId() {
		return mpchId;
	}
	public void setMpchId(Integer mpchId) {
		this.mpchId = mpchId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(Integer isDefault) {
		this.isDefault = isDefault;
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
