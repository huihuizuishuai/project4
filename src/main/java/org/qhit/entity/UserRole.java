package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class UserRole {
	private Integer userRoleId;// number primary key,--'主键',
	private String cname;//  varchar2(32) ,-- '中文名',
	private String ename;//  varchar2(32) ,-- '英文名',
	private Integer available;//  number ,-- '是否可用',
	private String remark;//  varchar2(256) ,-- '备注',
	private Date createDate;//  date,-- '创建时间',
	private Date updateDate;//  date ,-- '修改时间',
	private String userRoleCategory ;//  varchar2(32) ,
	private Integer sourceType;//  number,
	private Integer sourceId;//  number,
	private Integer delFlag;//  number
	@Id
	@SequenceGenerator(name="User_role",sequenceName="seq_User_role",allocationSize=1)
	@GeneratedValue(generator="User_role",strategy=GenerationType.SEQUENCE)
	public Integer getUserRoleId() {
		return userRoleId;
	}
	public void setUserRoleId(Integer userRoleId) {
		this.userRoleId = userRoleId;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public Integer getAvailable() {
		return available;
	}
	public void setAvailable(Integer available) {
		this.available = available;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public String getUserRoleCategory() {
		return userRoleCategory;
	}
	public void setUserRoleCategory(String userRoleCategory) {
		this.userRoleCategory = userRoleCategory;
	}
	public Integer getSourceType() {
		return sourceType;
	}
	public void setSourceType(Integer sourceType) {
		this.sourceType = sourceType;
	}
	public Integer getSourceId() {
		return sourceId;
	}
	public void setSourceId(Integer sourceId) {
		this.sourceId = sourceId;
	}
	public Integer getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}


}
