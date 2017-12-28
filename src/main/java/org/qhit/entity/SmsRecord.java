package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class SmsRecord {
	private Integer smsRecordId;//primary key,
	private Integer smsRecordtype;//-- '短信类型',
	private String phone;//-- '手机号码',
	private String smsRecordCode;//,-- '验证码',
	private String smsRecordContent;//,-- '短信内容',
	private String smsRecordResult;//,-- '返回结果',
	private Integer status;//,-- '状态',
	private Date senddate;//-- '发送时间',
	private Date createdate;//'创建时间',

	@Id
	@SequenceGenerator(name="seq_sms_record",sequenceName="seq_sms_record",allocationSize=1)
	@GeneratedValue(generator="seq_sms_record",strategy=GenerationType.SEQUENCE)
	public Integer getSmsRecordId() {
		return smsRecordId;
	}
	public void setSmsRecordId(Integer smsRecordId) {
		this.smsRecordId = smsRecordId;
	}
	public Integer getSmsRecordtype() {
		return smsRecordtype;
	}
	public void setSmsRecordtype(Integer smsRecordtype) {
		this.smsRecordtype = smsRecordtype;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSmsRecordCode() {
		return smsRecordCode;
	}
	public void setSmsRecordCode(String smsRecordCode) {
		this.smsRecordCode = smsRecordCode;
	}
	public String getSmsRecordContent() {
		return smsRecordContent;
	}
	public void setSmsRecordContent(String smsRecordContent) {
		this.smsRecordContent = smsRecordContent;
	}
	public String getSmsRecordResult() {
		return smsRecordResult;
	}
	public void setSmsRecordResult(String smsRecordResult) {
		this.smsRecordResult = smsRecordResult;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getSenddate() {
		return senddate;
	}
	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}


}
