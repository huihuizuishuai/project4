package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class SubjectFieldRecord {
	private Integer sfrId;//  number primary key,
	private Integer subjectId;// number,-- '标的Id',
	private Integer fieldId;//  number,-- '字段id',
	private String fieldValue;//  varchar2(20) ,-- '字段值',
	private Integer delflag;//  number,-- '删除标记',
	private Date createDate;//  date,--'创建日期',
	private Date updateDate;//  date-- '更新日期',

	@Id
	@SequenceGenerator(name="seq_subject_field",sequenceName="seq_subject_field_record",allocationSize=1)
	@GeneratedValue(generator="seq_subject_field",strategy=GenerationType.SEQUENCE)
	public Integer getSfrId() {
		return sfrId;
	}
	public void setSfrId(Integer sfrId) {
		this.sfrId = sfrId;
	}
	public Integer getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}
	public Integer getFieldId() {
		return fieldId;
	}
	public void setFieldId(Integer fieldId) {
		this.fieldId = fieldId;
	}
	public String getFieldValue() {
		return fieldValue;
	}
	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
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
