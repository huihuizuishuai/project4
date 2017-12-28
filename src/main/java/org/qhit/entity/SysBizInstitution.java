package org.qhit.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class SysBizInstitution {
	private Integer sbiId;//  number primary key,
	private String province;//  varchar2(20),-- '省',
	private String city;//  varchar2(20),--'城市',
	private String bizType;//  varchar2(10) ,-- '机构类别如缴费JF',
	private String bizSubType;//  varchar2(10),--'机构子类别如缴费水费WATER',
	private String institutionNname;//  varchar2(50),--'机构名称',
	private String institutionCode;//  varchar2(50) -- '机构编码',

	@Id
	@SequenceGenerator(name="seq_sys_biz_institution",sequenceName="seq_sys_biz_institution",allocationSize=1)
	@GeneratedValue(generator="seq_sys_biz_institution",strategy=GenerationType.SEQUENCE)
	public Integer getSbiId() {
		return sbiId;
	}
	public void setSbiId(Integer sbiId) {
		this.sbiId = sbiId;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getBizType() {
		return bizType;
	}
	public void setBizType(String bizType) {
		this.bizType = bizType;
	}
	public String getBizSubType() {
		return bizSubType;
	}
	public void setBizSubType(String bizSubType) {
		this.bizSubType = bizSubType;
	}
	public String getInstitutionNname() {
		return institutionNname;
	}
	public void setInstitutionNname(String institutionNname) {
		this.institutionNname = institutionNname;
	}
	public String getInstitutionCode() {
		return institutionCode;
	}
	public void setInstitutionCode(String institutionCode) {
		this.institutionCode = institutionCode;
	}

}
