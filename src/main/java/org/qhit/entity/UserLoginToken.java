package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class UserLoginToken {
	private Integer userId;//   number primary key,-- '用户id',
	private String token;//  varchar2(64),-- '令牌号',
	private String userName;//  varchar2(128) ,-- '登录时的用户名，可以是用户名，手机号等',
	private String ultPassword;//  varchar2(128) ,--'密码',
	private Date expireTime;//  date,--'有效时间',
	private Date createDate;//  date,
	private Date updateDate;//  date
	@Id
	@SequenceGenerator(name="User_login_token",sequenceName="seq_User_login_token",allocationSize=1)
	@GeneratedValue(generator="User_login_token",strategy=GenerationType.SEQUENCE)
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUltPassword() {
		return ultPassword;
	}
	public void setUltPassword(String ultPassword) {
		this.ultPassword = ultPassword;
	}
	public Date getExpireTime() {
		return expireTime;
	}
	public void setExpireTime(Date expireTime) {
		this.expireTime = expireTime;
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
