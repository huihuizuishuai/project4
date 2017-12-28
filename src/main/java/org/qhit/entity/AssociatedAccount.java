package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class AssociatedAccount {
	private Integer associatedAccountId;//����
	private Integer memberId;//'��Աid'
	private String associatedAccountType;//'�˺����ͣ�΢�ţ�QQ��'
	private String associatedAccountName;//--'�˺�����'
	private String identifying;//--'�˺ű�ʶ'
	private Integer status;//״̬
	private Date createDate;//--'���ʱ��?',
	private Date updateDate;//--'�޸�ʱ��',

	@Id
	@SequenceGenerator(name="seq_associated_account",sequenceName="seq_associated_account",allocationSize=1)
	@GeneratedValue(generator="seq_associated_account",strategy=GenerationType.SEQUENCE)
	public Integer getAssociatedAccountId() {
		return associatedAccountId;
	}
	public void setAssociatedAccountId(Integer associatedAccountId) {
		this.associatedAccountId = associatedAccountId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getAssociatedAccountType() {
		return associatedAccountType;
	}
	public void setAssociatedAccountType(String associatedAccountType) {
		this.associatedAccountType = associatedAccountType;
	}
	public String getAssociatedAccountName() {
		return associatedAccountName;
	}
	public void setAssociatedAccountName(String associatedAccountName) {
		this.associatedAccountName = associatedAccountName;
	}
	public String getIdentifying() {
		return identifying;
	}
	public void setIdentifying(String identifying) {
		this.identifying = identifying;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
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