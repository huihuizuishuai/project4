package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class UserLog {
	private Integer userLogId;// number primary key,
	private Integer userId;//  number ,-- '用户id',
	private Integer action;// number,-- '动作',
	private Date createDate;//  date ,-- '创建时间',
	private Date updateDate;//  date-- '修改时间',
	@Id
	@SequenceGenerator(name="User_log",sequenceName="seq_User_log",allocationSize=1)
	@GeneratedValue(generator="User_log",strategy=GenerationType.SEQUENCE)
	public Integer getUserLogId() {
		return userLogId;
	}
	public void setUserLogId(Integer userLogId) {
		this.userLogId = userLogId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getAction() {
		return action;
	}
	public void setAction(Integer action) {
		this.action = action;
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
