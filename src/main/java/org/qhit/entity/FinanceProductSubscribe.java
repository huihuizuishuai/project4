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
	private String financeProductSubscribeName;//'ï¿½ï¿½ï¿½ï¿½',
	private Integer memberId;//-'»áÔ±id',
	private String phone;//'ï¿½ï¿½Ïµï¿½ç»°',
	private Integer productId;//'ï¿½ï¿½Æ²ï¿½Æ·id',
	private String addr;//'ï¿½ï¿½ï¿½Úµï¿½ï¿½ï¿½',
	private Integer status;//number,-- 'ÊÇ·ñ´¦Àí(0:Ç©ÊðÅÄÕÕ|1:ÒÑÇ©Ô¼|2:ÉóºËÖÐ|3:Ç©ÊðÊ§°Ü)',
	private String fpsComment;//'ï¿½ï¿½ï¿½ï¿½Ç©ï¿½ï¿½ï¿½Äµï¿½ï¿½ï¿½Ï¢',
	private String riskReveal;//'ï¿½ï¿½ï¿½Õ½ï¿½Ê¾ï¿½ï¿½',
	private Date createDate;
	private Date updateDate;
	private Float amount;//'Ë½Ä¼ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
	private Float interest;//'Ë½Ä¼ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
	private Date startDate;//'ï¿½ï¿½Ê¼Ê±ï¿½ï¿½',
	private Date endDate;//'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
	private String signedPhotos;//'Ç©ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',

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
