package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class OverseaConfig {
	private Integer ocId;//primary key,
	private String title;//'����',
	private String ocContent;//CLOB,--'����',
	private Integer sortColum ;//'����ֵ',
	private String childTitle;//'�ӱ���',
	private String ocDescription;//'����',
	private String userType;//'�û�Ⱥ��',
	private Date updTime;//'�޸�ʱ��',
	private Date addTime;//'���ʱ��?',
	private String overseaIcon;//'ͼ��',
	private Date startDate;//'��ʼʱ��',
	private Date endDate;//'����ʱ��',
	private Integer status;//'״̬',

	@Id
	@SequenceGenerator(name="seq_oversea_config",sequenceName="seq_oversea_config",allocationSize=1)
	@GeneratedValue(generator="seq_oversea_config",strategy=GenerationType.SEQUENCE)
	public Integer getOcId() {
		return ocId;
	}
	public void setOcId(Integer ocId) {
		this.ocId = ocId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOcContent() {
		return ocContent;
	}
	public void setOcContent(String ocContent) {
		this.ocContent = ocContent;
	}
	public Integer getSortColum() {
		return sortColum;
	}
	public void setSortColum(Integer sortColum) {
		this.sortColum = sortColum;
	}
	public String getChildTitle() {
		return childTitle;
	}
	public void setChildTitle(String childTitle) {
		this.childTitle = childTitle;
	}
	public String getOcDescription() {
		return ocDescription;
	}
	public void setOcDescription(String ocDescription) {
		this.ocDescription = ocDescription;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public Date getUpdTime() {
		return updTime;
	}
	public void setUpdTime(Date updTime) {
		this.updTime = updTime;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	public String getOverseaIcon() {
		return overseaIcon;
	}
	public void setOverseaIcon(String overseaIcon) {
		this.overseaIcon = overseaIcon;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}


}
