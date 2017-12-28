package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class Feedback {
	private Integer feedbackId;//primary key,
	private Integer memberId;//'会员id',
	private String feedbackContent;//意见反馈内容',
	private Date createDte;//添加时间

	@Id
	@SequenceGenerator(name="seq_feedback",sequenceName="seq_feedback",allocationSize=1)
	@GeneratedValue(generator="seq_feedback",strategy=GenerationType.SEQUENCE)
	public Integer getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(Integer feedbackId) {
		this.feedbackId = feedbackId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getFeedbackContent() {
		return feedbackContent;
	}
	public void setFeedbackContent(String feedbackContent) {
		this.feedbackContent = feedbackContent;
	}
	public Date getCreateDte() {
		return createDte;
	}
	public void setCreateDte(Date createDte) {
		this.createDte = createDte;
	}//'���ʱ��',
	
	
}
