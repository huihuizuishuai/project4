package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class UserMessage {
	private Integer umId;// number primary key,-- '主键',
	private Integer userId;//  number ,-- '用户id',
	private String title;//  varchar2(128) ,-- '消息标题',
	private Integer businessType;// number ,-- '业务类别',
	private Integer ownerId;//  number ,-- '业务id',
	private String umContent;//  CLOB,--  '消息内容',
	private Integer msgStatus;// number ,-- '状态,(已读未读)',
	private Integer delFlag;//  number ,-- '删除标志',
	private Date createDate;//  date ,-- '创建时间',
	private Date updateDate;//  date -- 'PRIMARY KEY ( id )
	@Id
	@SequenceGenerator(name="User_message",sequenceName="seq_User_message",allocationSize=1)
	@GeneratedValue(generator="User_message",strategy=GenerationType.SEQUENCE)
	public Integer getUmId() {
		return umId;
	}
	public void setUmId(Integer umId) {
		this.umId = umId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getBusinessType() {
		return businessType;
	}
	public void setBusinessType(Integer businessType) {
		this.businessType = businessType;
	}
	public Integer getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(Integer ownerId) {
		this.ownerId = ownerId;
	}
	public String getUmContent() {
		return umContent;
	}
	public void setUmContent(String umContent) {
		this.umContent = umContent;
	}
	public Integer getMsgStatus() {
		return msgStatus;
	}
	public void setMsgStatus(Integer msgStatus) {
		this.msgStatus = msgStatus;
	}
	public Integer getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
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
