package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class FpSubscribeRecord {
	private Integer fpsrId;//primary key,
	private Integer memberId;//'��Աid',
	private Integer subscribeId;//'˽ļԤԼ��¼id',
	private String tech_userId;//'eǩ�������˺�',
	private String techUserSeal;//'eǩ������ӡ��',
	private String orgPath;//'ԭǩ���ĵ�·��',
	private String newPath;//'��ǩ���ĵ�·��',
	private Integer status;//״̬
	private Date createDate;//����ʱ��
	private Date updateDate;//����ʱ��
	private String filed;//'�����ֶ�',

	@Id
	@SequenceGenerator(name="seq_fp_subscribe_record",sequenceName="seq_fpsr",allocationSize=1)
	@GeneratedValue(generator="seq_fp_subscribe_record",strategy=GenerationType.SEQUENCE)

	public Integer getFpsrId() {
		return fpsrId;
	}
	public void setFpsrId(Integer fpsrId) {
		this.fpsrId = fpsrId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public Integer getSubscribeId() {
		return subscribeId;
	}
	public void setSubscribeId(Integer subscribeId) {
		this.subscribeId = subscribeId;
	}
	public String getTech_userId() {
		return tech_userId;
	}
	public void setTech_userId(String tech_userId) {
		this.tech_userId = tech_userId;
	}
	public String getTechUserSeal() {
		return techUserSeal;
	}
	public void setTechUserSeal(String techUserSeal) {
		this.techUserSeal = techUserSeal;
	}
	public String getOrgPath() {
		return orgPath;
	}
	public void setOrgPath(String orgPath) {
		this.orgPath = orgPath;
	}
	public String getNewPath() {
		return newPath;
	}
	public void setNewPath(String newPath) {
		this.newPath = newPath;
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
	public String getFiled() {
		return filed;
	}
	public void setFiled(String filed) {
		this.filed = filed;
	}


}
