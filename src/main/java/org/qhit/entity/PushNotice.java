package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class PushNotice {
	private Integer pnID;// primary key,
	private String title;
	private String pnContent;//CLOB ,
	private Integer status;//,-- '公告状态',
	private Date createDate;
	private Date updateDate;

	@Id
	@SequenceGenerator(name="seq_push_notice",sequenceName="seq_push_notice",allocationSize=1)
	@GeneratedValue(generator="seq_push_notice",strategy=GenerationType.SEQUENCE)
	public Integer getPnID() {
		return pnID;
	}
	public void setPnID(Integer pnID) {
		this.pnID = pnID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPnContent() {
		return pnContent;
	}
	public void setPnContent(String pnContent) {
		this.pnContent = pnContent;
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
