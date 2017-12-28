package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class FinancialPlanner {
	private Integer financialPlannerId;//primary key,
	private Integer memberId;//'会员id',
	private String financialPlannerName;//'真实姓名',
	private String orgname;//'机构名称',
	private String mycard;//'我的名片',
	private String address;//'邮寄地址',
	private Integer status;//状态 
	private Date createDate;//'添加时间',
	private Date updateDate;//'修改时间',

	@Id
	@SequenceGenerator(name="seq_financial_planner",sequenceName="seq_financial_planner",allocationSize=1)
	@GeneratedValue(generator="seq_financial_planner",strategy=GenerationType.SEQUENCE)
	public Integer getFinancialPlannerId() {
		return financialPlannerId;
	}
	public void setFinancialPlannerId(Integer financialPlannerId) {
		this.financialPlannerId = financialPlannerId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getFinancialPlannerName() {
		return financialPlannerName;
	}
	public void setFinancialPlannerName(String financialPlannerName) {
		this.financialPlannerName = financialPlannerName;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getMycard() {
		return mycard;
	}
	public void setMycard(String mycard) {
		this.mycard = mycard;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public FinancialPlanner(Integer memberId, String financialPlannerName, String orgname, String mycard,
			String address, Integer status, Date createDate, Date updateDate) {
		this.memberId = memberId;
		this.financialPlannerName = financialPlannerName;
		this.orgname = orgname;
		this.mycard = mycard;
		this.address = address;
		this.status = status;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	public FinancialPlanner() {
	}




}
