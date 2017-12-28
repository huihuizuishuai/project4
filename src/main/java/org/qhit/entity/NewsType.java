package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class NewsType {
	private Integer newsTypeId;//primary key,
	private String newsTypeName;//'����',
	private String newsTypeLink;//'����',
	private String note;//'��ע',
	private Integer newsTypeSort;//'����',
	private String pageType;//'ҳ������',
	private Integer supType;//'�ϼ����?',
	private String info;//'���?',
	private String cPhoto;//'����ͼƬ',
	private String text;//  (CLOB) ,-- '����',
	private String seoTitle;//ҳ��seo����',
	private String seoKey;//'seo�ؼ���',
	private String seoDes;//'seo����',
	private Integer addId;//'�����ID',
	private Integer updId;//'�޸���ID',
	private Date updTime;//'�޸�ʱ��',
	private Date addTime;//'���ʱ��?',

	@Id
	@SequenceGenerator(name="seq_news_type",sequenceName="seq_news_type",allocationSize=1)
	@GeneratedValue(generator="seq_news_type",strategy=GenerationType.SEQUENCE)
	public Integer getNewsTypeId() {
		return newsTypeId;
	}
	public void setNewsTypeId(Integer newsTypeId) {
		this.newsTypeId = newsTypeId;
	}
	public String getNewsTypeName() {
		return newsTypeName;
	}
	public void setNewsTypeName(String newsTypeName) {
		this.newsTypeName = newsTypeName;
	}
	public String getNewsTypeLink() {
		return newsTypeLink;
	}
	public void setNewsTypeLink(String newsTypeLink) {
		this.newsTypeLink = newsTypeLink;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Integer getNewsTypeSort() {
		return newsTypeSort;
	}
	public void setNewsTypeSort(Integer newsTypeSort) {
		this.newsTypeSort = newsTypeSort;
	}
	public String getPageType() {
		return pageType;
	}
	public void setPageType(String pageType) {
		this.pageType = pageType;
	}
	public Integer getSupType() {
		return supType;
	}
	public void setSupType(Integer supType) {
		this.supType = supType;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getcPhoto() {
		return cPhoto;
	}
	public void setcPhoto(String cPhoto) {
		this.cPhoto = cPhoto;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getSeoTitle() {
		return seoTitle;
	}
	public void setSeoTitle(String seoTitle) {
		this.seoTitle = seoTitle;
	}
	public String getSeoKey() {
		return seoKey;
	}
	public void setSeoKey(String seoKey) {
		this.seoKey = seoKey;
	}
	public String getSeoDes() {
		return seoDes;
	}
	public void setSeoDes(String seoDes) {
		this.seoDes = seoDes;
	}
	public Integer getAddId() {
		return addId;
	}
	public void setAddId(Integer addId) {
		this.addId = addId;
	}
	public Integer getUpdId() {
		return updId;
	}
	public void setUpdId(Integer updId) {
		this.updId = updId;
	}
	public Date getUpdTime() {
		return updTime;
	}
	public void setUpdTime(Date updTime) {
		this.updTime = updTime;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}



}
