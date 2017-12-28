package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

@Entity
public class Users {
	private Integer usersId;// number primary key,--'用户id',
	private String userName;//  varchar2(32) ,-- '用户名',
	private UserRole userrole;
	private String usersPassword;//  varchar2(256) ,-- '密码',
	private String usersSalt;//  varchar2(32) ,-- '密码盐',
	private String mobilePhone;//  varchar2(32) ,-- '手机号',
	private Integer status;//  number ,-- '账号状态（正常，锁定，删除）',
	private Integer delFlag;//  number ,-- '删除标志',
	private Integer usersIdentity;//  number ,-- '身份',
	private Date createDate;//  date,-- '创建时间',
	private Date updateDate;//  date-- '修改时间',
	@Id
	@SequenceGenerator(name="Users",sequenceName="seq_Users",allocationSize=1)
	@GeneratedValue(generator="Users",strategy=GenerationType.SEQUENCE)
	public Integer getUsersId() {
		return usersId;
	}
	public void setUsersId(Integer usersId) {
		this.usersId = usersId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@ManyToOne
	@JoinColumn(name="userRoleId")
	public UserRole getUserrole() {
		return userrole;
	}
	public void setUserrole(UserRole userrole) {
		this.userrole = userrole;
	}
	public String getUsersPassword() {
		return usersPassword;
	}
	public void setUsersPassword(String usersPassword) {
		this.usersPassword = usersPassword;
	}
	public String getUsersSalt() {
		return usersSalt;
	}
	public void setUsersSalt(String usersSalt) {
		this.usersSalt = usersSalt;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}
	public Integer getUsersIdentity() {
		return usersIdentity;
	}
	public void setUsersIdentity(Integer usersIdentity) {
		this.usersIdentity = usersIdentity;
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
	public Users(String userName, String usersPassword, String mobilePhone) {
		this.userName = userName;
		this.usersPassword = usersPassword;
		this.mobilePhone = mobilePhone;
	}
	
	
	public Users(Integer usersId, String userName, String usersPassword,Integer status) {
		this.usersId = usersId;
		this.userName = userName;
		this.usersPassword = usersPassword;
		this.status = status;
	}
	public Users() {
	}
	@Override
	public String toString() {
		return "Users [usersId=" + usersId + ", userName=" + userName + ", userrole=" + userrole + ", usersPassword="
				+ usersPassword + ", usersSalt=" + usersSalt + ", mobilePhone=" + mobilePhone + ", status=" + status
				+ ", delFlag=" + delFlag + ", usersIdentity=" + usersIdentity + ", createDate=" + createDate
				+ ", updateDate=" + updateDate + "]";
	}
}