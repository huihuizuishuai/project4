package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class RolePermissionRelation {
	private Integer roleId;// primary key,-- '角色id',
	private String permissionEname;//-- '权限名称',
	private Date createDate;//-- '创建时间',

	@Id
	@SequenceGenerator(name="seq_role_permission_relation",sequenceName="seq_role_permission_relation",allocationSize=1)
	@GeneratedValue(generator="seq_role_permission_relation",strategy=GenerationType.SEQUENCE)
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getPermissionEname() {
		return permissionEname;
	}
	public void setPermissionEname(String permissionEname) {
		this.permissionEname = permissionEname;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
