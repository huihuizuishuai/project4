package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class SubjectFolder {
	private Integer subjectFolderId;// number primary key,-- '主键',
	private Date createDate;//  date ,-- '创建时间',
	private Date updateDate;//  date -- '修改时间',

	@Id
	@SequenceGenerator(name="seq_subject_folder",sequenceName="seq_subject_folder",allocationSize=1)
	@GeneratedValue(generator="seq_subject_folder",strategy=GenerationType.SEQUENCE)
	public Integer getSubjectFolderId() {
		return subjectFolderId;
	}
	public void setSubjectFolderId(Integer subjectFolderId) {
		this.subjectFolderId = subjectFolderId;
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
