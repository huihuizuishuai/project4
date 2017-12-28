package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class SubjectFile {
	private Integer subjectFileId;//  number primary key,
	private Integer folderId;// number,-- '附件主表id',
	private String subjectFilePath;//  varchar2(4000) ,-- '文件路径',
	private String fileName;//  varchar2(128) ,-- '文件名',
	private String originalName;//  varchar2(128) ,-- '原文件名',
	private Date createDate;//  date,-- '创建时间',
	private Date updateDate;//  date-- '修改时间',

	@Id
	@SequenceGenerator(name="seq_subject_file",sequenceName="seq_subject_file",allocationSize=1)
	@GeneratedValue(generator="seq_subject_file",strategy=GenerationType.SEQUENCE)
	public Integer getSubjectFileId() {
		return subjectFileId;
	}
	public void setSubjectFileId(Integer subjectFileId) {
		this.subjectFileId = subjectFileId;
	}
	public Integer getFolderId() {
		return folderId;
	}
	public void setFolderId(Integer folderId) {
		this.folderId = folderId;
	}
	public String getSubjectFilePath() {
		return subjectFilePath;
	}
	public void setSubjectFilePath(String subjectFilePath) {
		this.subjectFilePath = subjectFilePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
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
