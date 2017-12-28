package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class FinanceProductSubscribe {
	private Integer financeProductSubscribeId;//key,
	private String financeProductSubscribeName;//'����',
	private Integer memberId;//-'��Աid',
	private String phone;//'��ϵ�绰',
	private Integer productId;//'��Ʋ�Ʒid',
	private String addr;//'���ڵ���',
	private Integer status;//number,-- '�Ƿ���(0:ǩ������|1:��ǩԼ|2:�����|3:ǩ��ʧ��)',
	private String fpsComment;//'����ǩ���ĵ���Ϣ',
	private String riskReveal;//'���ս�ʾ��',
	private Date createDate;
	private Date updateDate;
	private Float amount;//'˽ļ������',
	private Float interest;//'˽ļ��������',
	private Date startDate;//'��ʼʱ��',
	private Date endDate;//'����ʱ��',
	private String signedPhotos;//'ǩ������',

	@Id
	@SequenceGenerator(name="seq_finance_product_subscribe",sequenceName="seq_finance_product_subscribe",allocationSize=1)
	@GeneratedValue(generator="seq_finance_product_subscribe",strategy=GenerationType.SEQUENCE)
	public Integer getFinanceProductSubscribeId() {
		return financeProductSubscribeId;
	}
	public void setFinanceProductSubscribeId(Integer financeProductSubscribeId) {
		this.financeProductSubscribeId = financeProductSubscribeId;
	}
	public String getFinanceProductSubscribeName() {
		return financeProductSubscribeName;
	}
	public void setFinanceProductSubscribeName(String financeProductSubscribeName) {
		this.financeProductSubscribeName = financeProductSubscribeName;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getFpsComment() {
		return fpsComment;
	}
	public void setFpsComment(String fpsComment) {
		this.fpsComment = fpsComment;
	}
	public String getRiskReveal() {
		return riskReveal;
	}
	public void setRiskReveal(String riskReveal) {
		this.riskReveal = riskReveal;
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
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public Float getInterest() {
		return interest;
	}
	public void setInterest(Float interest) {
		this.interest = interest;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getSignedPhotos() {
		return signedPhotos;
	}
	public void setSignedPhotos(String signedPhotos) {
		this.signedPhotos = signedPhotos;
	}
	@Override
	public String toString() {
		return "FinanceProductSubscribe [financeProductSubscribeId=" + financeProductSubscribeId
				+ ", financeProductSubscribeName=" + financeProductSubscribeName + ", memberId=" + memberId + ", phone="
				+ phone + ", productId=" + productId + ", addr=" + addr + ", status=" + status + ", fpsComment="
				+ fpsComment + ", riskReveal=" + riskReveal + ", createDate=" + createDate + ", updateDate="
				+ updateDate + ", amount=" + amount + ", interest=" + interest + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", signedPhotos=" + signedPhotos + "]";
	}



}
