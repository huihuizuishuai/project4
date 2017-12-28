package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class Subject {
	private Integer subjectId;// primary key,
	private String serialNumber;// ,-- '流水号'
	private String serialNo;// ,-- '合同号',
	private String subjectName;//,-- '标的名称',
	private Integer subjectType;//CLOB,-- '标的类型',
	private Integer status;//-- '标的状态',
	private Float floorAmount;//,-- '起投金额',
	private Float amount;//-- '标的金额',
	private Integer firstId;//,-- '始标id',
	private Integer parentId;//,-- '父标id',
	private Integer period;//-- '标的周期',
	private String purpose;//- '借款目的',
	private Date raiseStart;//-- '募集开始',
	private Date raiseEnd;//-- '募集结束',
	private Integer refundWay;//,-- '还款方式',
	private Integer safeguardWay;//-- '保障方式',
	private Date startDate ;//- '标的开始日期',
	private Date endDate;//,-- '标的结束日期',
	private Float yearRate;//,-- '年化率',
	private String subjectComment;//CLOB, --'产品速览',
	private Integer folderId ;//-- '文件夹Id',
	private Integer delflag ;//-- '是否删除',
	private Date updateDate;//-- '更新日期',
	private Date createDate;//-- '创建日期',
	private String borrowername;//,-- '借款人姓名',
	private Integer borrowerid;//--'借款人id',
	private Integer bought;//--'已购人数',
	private String projectdetails;// CLOB,-- '项目详情',
	private String safetycontrol;//  CLOB,--'安全保障',
	private Integer experStatus;//-- '体验金是否可以购买（0：否，1：是）',
    
	@Id
	@SequenceGenerator(name="seq_subject",sequenceName="seq_subject",allocationSize=1)
	@GeneratedValue(generator="seq_subject",strategy=GenerationType.SEQUENCE)
	public Integer getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	public String getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public Integer getSubjectType() {
		return subjectType;
	}
	public void setSubjectType(Integer subjectType) {
		this.subjectType = subjectType;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Float getFloorAmount() {
		return floorAmount;
	}
	public void setFloorAmount(Float floorAmount) {
		this.floorAmount = floorAmount;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public Integer getFirstId() {
		return firstId;
	}
	public void setFirstId(Integer firstId) {
		this.firstId = firstId;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public Integer getPeriod() {
		return period;
	}
	public void setPeriod(Integer period) {
		this.period = period;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public Date getRaiseStart() {
		return raiseStart;
	}
	public void setRaiseStart(Date raiseStart) {
		this.raiseStart = raiseStart;
	}
	public Date getRaiseEnd() {
		return raiseEnd;
	}
	public void setRaiseEnd(Date raiseEnd) {
		this.raiseEnd = raiseEnd;
	}
	public Integer getRefundWay() {
		return refundWay;
	}
	public void setRefundWay(Integer refundWay) {
		this.refundWay = refundWay;
	}
	
	public Integer getSafeguardWay() {
		return safeguardWay;
	}
	public void setSafeguardWay(Integer safeguardWay) {
		this.safeguardWay = safeguardWay;
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
	public Float getYearRate() {
		return yearRate;
	}
	public void setYearRate(Float yearRate) {
		this.yearRate = yearRate;
	}
	public String getSubjectComment() {
		return subjectComment;
	}
	public void setSubjectComment(String subjectComment) {
		this.subjectComment = subjectComment;
	}
	public Integer getFolderId() {
		return folderId;
	}
	public void setFolderId(Integer folderId) {
		this.folderId = folderId;
	}
	public Integer getDelflag() {
		return delflag;
	}
	public void setDelflag(Integer delflag) {
		this.delflag = delflag;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getBorrowername() {
		return borrowername;
	}
	public void setBorrowername(String borrowername) {
		this.borrowername = borrowername;
	}
	public Integer getBorrowerid() {
		return borrowerid;
	}
	public void setBorrowerid(Integer borrowerid) {
		this.borrowerid = borrowerid;
	}
	public Integer getBought() {
		return bought;
	}
	public void setBought(Integer bought) {
		this.bought = bought;
	}
	
	
	public String getProjectdetails() {
		return projectdetails;
	}
	public void setProjectdetails(String projectdetails) {
		this.projectdetails = projectdetails;
	}
	public String getSafetycontrol() {
		return safetycontrol;
	}
	public void setSafetycontrol(String safetycontrol) {
		this.safetycontrol = safetycontrol;
	}
	public Integer getExperStatus() {
		return experStatus;
	}
	public void setExperStatus(Integer experStatus) {
		this.experStatus = experStatus;
	}
	@Override
	public String toString() {
		return "Subject [subjectId=" + subjectId + ", serialNumber=" + serialNumber + ", serialNo=" + serialNo
				+ ", subjectName=" + subjectName + ", subjectType=" + subjectType + ", status=" + status
				+ ", floorAmount=" + floorAmount + ", amount=" + amount + ", firstId=" + firstId + ", parentId="
				+ parentId + ", period=" + period + ", purpose=" + purpose + ", raiseStart=" + raiseStart
				+ ", raiseEnd=" + raiseEnd + ", refundWay=" + refundWay + ", safeguardWay=" + safeguardWay
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", yearRate=" + yearRate + ", subjectComment="
				+ subjectComment + ", folderId=" + folderId + ", delflag=" + delflag + ", updateDate=" + updateDate
				+ ", createDate=" + createDate + ", borrowername=" + borrowername + ", borrowerid=" + borrowerid
				+ ", bought=" + bought + ", projectdetails=" + projectdetails + ", safetycontrol=" + safetycontrol
				+ ", experStatus=" + experStatus + "]";
	}


}
