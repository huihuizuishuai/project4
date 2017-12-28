package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class News {
	private Integer newsId;//primary key,
	private Integer newsTypeId;//'�������',
	private String title;//'����',
	private String subTitle;//'������',
	private Integer newsSort;//'����',
	private String info;//'���',
	private String cPhoto;//'����ͼƬ',
	private String newsLink;//'���ӵ�ַ',
	private String author;// '����',
	private String newsSource;//'��Դ',
	private String newsLabel;//'��ǩ',
	private Integer clickNumber;//'�������',
	private String text; // (CLOB),-- '����',
	private String filelink;//'������ַ',
	private String seoTitle;//'ҳ��seo����',
	private String seoKey;// 'seo�ؼ���',
	private String seoDes;//'seo����',
	private Integer placTop;//'�Ƿ��ö� 0��Ϊ��  1Ϊ��',
	private Integer recommend;//'�Ƿ��Ƽ�',
	private Integer newsAudit;//'�Ƿ����',
	private Integer addId;//'�����ID',
	private Integer updId;//'�޸���ID',
	private Date updTime;//'�޸�ʱ��',
	private Date addTime;//'���ʱ��', 

	@Id
	@SequenceGenerator(name="seq_news",sequenceName="seq_news",allocationSize=1)
	@GeneratedValue(generator="seq_news",strategy=GenerationType.SEQUENCE)
	public Integer getNewsId() {
		return newsId;
	}
	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}
	public Integer getNewsTypeId() {
		return newsTypeId;
	}
	public void setNewsTypeId(Integer newsTypeId) {
		this.newsTypeId = newsTypeId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	public Integer getNewsSort() {
		return newsSort;
	}
	public void setNewsSort(Integer newsSort) {
		this.newsSort = newsSort;
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
	public String getNewsLink() {
		return newsLink;
	}
	public void setNewsLink(String newsLink) {
		this.newsLink = newsLink;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getNewsSource() {
		return newsSource;
	}
	public void setNewsSource(String newsSource) {
		this.newsSource = newsSource;
	}
	public String getNewsLabel() {
		return newsLabel;
	}
	public void setNewsLabel(String newsLabel) {
		this.newsLabel = newsLabel;
	}
	public Integer getClickNumber() {
		return clickNumber;
	}
	public void setClickNumber(Integer clickNumber) {
		this.clickNumber = clickNumber;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getFilelink() {
		return filelink;
	}
	public void setFilelink(String filelink) {
		this.filelink = filelink;
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
	public Integer getPlacTop() {
		return placTop;
	}
	public void setPlacTop(Integer placTop) {
		this.placTop = placTop;
	}
	public Integer getRecommend() {
		return recommend;
	}
	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}
	public Integer getNewsAudit() {
		return newsAudit;
	}
	public void setNewsAudit(Integer newsAudit) {
		this.newsAudit = newsAudit;
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
