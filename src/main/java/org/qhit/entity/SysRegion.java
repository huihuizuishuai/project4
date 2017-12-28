package org.qhit.entity;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class SysRegion {
	private Integer sysRegionID;//  number primary key,
	private String gb2260;//  varchar2(16) ,-- '行政区域国标代码',
	private String sysRegionName;//  varchar2(32) ,-- '行政区名称',
	private Integer regionLevel;//  number,-- '行政区级别',
	private Integer parentId;// number ,-- '父id',
	private String parentIds;//  varchar2(256) ,-- '父id列表',
	private String parentGb2260;//  varchar2(16) ,-- '父编码',
	private String diallingCode;//  varchar2(4) ,-- '电话区号',
	private Date createDate;//  date,
	private Date lastModified;//  date
	@Id
	@SequenceGenerator(name="Sys_region",sequenceName="seq_Sys_region",allocationSize=1)
	@GeneratedValue(generator="Sys_region",strategy=GenerationType.SEQUENCE)
	public Integer getSysRegionID() {
		return sysRegionID;
	}
	public void setSysRegionID(Integer sysRegionID) {
		this.sysRegionID = sysRegionID;
	}
	public String getGb2260() {
		return gb2260;
	}
	public void setGb2260(String gb2260) {
		this.gb2260 = gb2260;
	}
	public String getSysRegionName() {
		return sysRegionName;
	}
	public void setSysRegionName(String sysRegionName) {
		this.sysRegionName = sysRegionName;
	}
	public Integer getRegionLevel() {
		return regionLevel;
	}
	public void setRegionLevel(Integer regionLevel) {
		this.regionLevel = regionLevel;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getParentIds() {
		return parentIds;
	}
	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	public String getParentGb2260() {
		return parentGb2260;
	}
	public void setParentGb2260(String parentGb2260) {
		this.parentGb2260 = parentGb2260;
	}
	public String getDiallingCode() {
		return diallingCode;
	}
	public void setDiallingCode(String diallingCode) {
		this.diallingCode = diallingCode;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getLastModified() {
		return lastModified;
	}
	public void setLastModified(Date lastModified) {
		this.lastModified = lastModified;
	}


}
