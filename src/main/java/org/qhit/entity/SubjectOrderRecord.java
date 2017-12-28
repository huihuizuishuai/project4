package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class SubjectOrderRecord {
	private Integer sorId;//  number primary key,
	private String serialNumber;//  varchar2(50) ,-- '流水号',
	private Integer dealType;//  number ,-- '交易类型',
	private Float amount;//  binary_float,-- '订单金额',
	private Integer status;//  number,-- '订单状态',
	private Integer subjectId;//  number,-- '标的id',
	private Integer memberId;//  number,-- '用户id',
	private Integer delflag;//  number,-- '是否删除',
	private Date createDate;//  date,--'创建日期',
	private Date updateDate;//  date--'更新日期',

	@Id
	@SequenceGenerator(name="seq_subject_order_record",sequenceName="seq_subject_order_record",allocationSize=1)
	@GeneratedValue(generator="seq_subject_order_record",strategy=GenerationType.SEQUENCE)
	public Integer getSorId() {
		return sorId;
	}
	public void setSorId(Integer sorId) {
		this.sorId = sorId;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	public Integer getDealType() {
		return dealType;
	}
	public void setDealType(Integer dealType) {
		this.dealType = dealType;
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
	public Integer getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
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

}
