package org.qhit.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class MemberPucChargeItem {
	private Integer mpciId;//primary key,
	private Integer memberId;//�û�id',
	private Integer homeId;
	private String chargeType;//'�ɷ����?',
	private Integer chargeInstitutionId;//'�ɷѻ���id',
	private String chargeInstitutionName;//'�ɷѻ�������',
	private String chargeInstitutionCode;//'�ɷѻ�������',
	private String customerCode;//'�ͻ�����',
	private String mpciComment;//'��ע',

	@Id
	@SequenceGenerator(name="seq_member_puc_charge_item",sequenceName="seq_member_puc_charge_item",allocationSize=1)
	@GeneratedValue(generator="seq_member_puc_charge_item",strategy=GenerationType.SEQUENCE)
	public Integer getMpciId() {
		return mpciId;
	}
	public void setMpciId(Integer mpciId) {
		this.mpciId = mpciId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public Integer getHomeId() {
		return homeId;
	}
	public void setHomeId(Integer homeId) {
		this.homeId = homeId;
	}
	public String getChargeType() {
		return chargeType;
	}
	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}
	public Integer getChargeInstitutionId() {
		return chargeInstitutionId;
	}
	public void setChargeInstitutionId(Integer chargeInstitutionId) {
		this.chargeInstitutionId = chargeInstitutionId;
	}
	public String getChargeInstitutionName() {
		return chargeInstitutionName;
	}
	public void setChargeInstitutionName(String chargeInstitutionName) {
		this.chargeInstitutionName = chargeInstitutionName;
	}
	public String getChargeInstitutionCode() {
		return chargeInstitutionCode;
	}
	public void setChargeInstitutionCode(String chargeInstitutionCode) {
		this.chargeInstitutionCode = chargeInstitutionCode;
	}
	public String getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	public String getMpciComment() {
		return mpciComment;
	}
	public void setMpciComment(String mpciComment) {
		this.mpciComment = mpciComment;
	}



}
