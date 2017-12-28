package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class SysRechargePriceConfig {
	private Integer srpcId;//   number primary key,
	private String srpcType;//  varchar2(32),-- '类型',
	private Float marketPrice;//  binary_float, --'金额',
	private Float sellPrice;// binary_float,--'金额',
	private Date createDate;//  date,
	private Date updateDate;//  date

	@Id
	@SequenceGenerator(name="seq_sys_recharge_price_config",sequenceName="seq_sys_recharge_price_config",allocationSize=1)
	@GeneratedValue(generator="seq_sys_recharge_price_config",strategy=GenerationType.SEQUENCE)
	public Integer getSrpcId() {
		return srpcId;
	}
	public void setSrpcId(Integer srpcId) {
		this.srpcId = srpcId;
	}
	public String getSrpcType() {
		return srpcType;
	}
	public void setSrpcType(String srpcType) {
		this.srpcType = srpcType;
	}
	public Float getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(Float marketPrice) {
		this.marketPrice = marketPrice;
	}
	public Float getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(Float sellPrice) {
		this.sellPrice = sellPrice;
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
