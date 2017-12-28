package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class SmsInterface {
	private Integer siId;// primary key,
	private String siName;// ,-- '短信模板名称',
	private Integer siType;//-- '担心模板类型',
	private String address;//,-- '短信模板地址',
	private String siParam;//,-- '短信模板参数',
	private String siContent;// ,-- '短信模板内容',
	private Date createdate;//-- '添加时间',	
	@Id
	@SequenceGenerator(name="seq_sms_interface",sequenceName="seq_sms_interface",allocationSize=1)
	@GeneratedValue(generator="seq_sms_interface",strategy=GenerationType.SEQUENCE)
	public Integer getSiId() {
		return siId;
	}
	public void setSiId(Integer siId) {
		this.siId = siId;
	}
	public String getSiName() {
		return siName;
	}
	public void setSiName(String siName) {
		this.siName = siName;
	}
	public Integer getSiType() {
		return siType;
	}
	public void setSiType(Integer siType) {
		this.siType = siType;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSiParam() {
		return siParam;
	}
	public void setSiParam(String siParam) {
		this.siParam = siParam;
	}
	public String getSiContent() {
		return siContent;
	}
	public void setSiContent(String siContent) {
		this.siContent = siContent;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

}
