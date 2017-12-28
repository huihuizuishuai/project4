package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class AwardRecords {
	private Integer awardRecordsId;// primary key,
	private Integer invitingid;//������id
	private Integer byinvitingid;//��������id
	private Integer awardRecordsType;//'�������ͣ�0��ע�ά����1��Ͷ�ʽ�����',
	private Float amount;//'�������?',
	private Integer isAward;//'0:δ����  1���ѽ���',
	private Date addTime;//'���ʱ��?',

	@Id
	@SequenceGenerator(name="seq_award_records",sequenceName="seq_award_records",allocationSize=1)
	@GeneratedValue(generator="seq_award_records",strategy=GenerationType.SEQUENCE)
	public Integer getAwardRecordsId() {
		return awardRecordsId;
	}
	public void setAwardRecordsId(Integer awardRecordsId) {
		this.awardRecordsId = awardRecordsId;
	}
	public Integer getInvitingid() {
		return invitingid;
	}
	public void setInvitingid(Integer invitingid) {
		this.invitingid = invitingid;
	}
	public Integer getByinvitingid() {
		return byinvitingid;
	}
	public void setByinvitingid(Integer byinvitingid) {
		this.byinvitingid = byinvitingid;
	}
	public Integer getAwardRecordsType() {
		return awardRecordsType;
	}
	public void setAwardRecordsType(Integer awardRecordsType) {
		this.awardRecordsType = awardRecordsType;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public Integer getIsAward() {
		return isAward;
	}
	public void setIsAward(Integer isAward) {
		this.isAward = isAward;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}


}