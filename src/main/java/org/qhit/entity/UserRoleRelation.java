package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class UserRoleRelation {
	private Integer userId;//   number primary key,-- '用户id',
	private Integer roleId;//   number,--'角色id',
	private Date createDate;//  date-- '创建时间',
	@Id
	@SequenceGenerator(name="User_role_relation",sequenceName="seq_User_role_relation",allocationSize=1)
	@GeneratedValue(generator="User_role_relation",strategy=GenerationType.SEQUENCE)
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



}
