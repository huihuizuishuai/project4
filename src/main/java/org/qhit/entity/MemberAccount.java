package org.qhit.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
@Entity
public class MemberAccount {
	
	private Integer memberAccountId;//primary key,
	private Integer memberId ;//'ï¿½Ã»ï¿½id',
	private Float useableBalance;//'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿?',
	private Float imusealeBalance;//'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿?',
	private Float totalProfit;//'ï¿½Û¼ï¿½ï¿½ï¿½ï¿½ï¿½',
	private Date createDate;
	private Date updateDate;
	private Float bonusAmount;//'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
	private Float investAmount;//'Í¶ï¿½ï¿½ï¿½Ü¶ï¿½',
	private Integer delflag;
	private Float bbinAmount;//'ï¿½ï¿½ï¿½ï¿½ï¿?',

	@Id
	@SequenceGenerator(name="seq_member_account",sequenceName="seq_member_account",allocationSize=1)
	@GeneratedValue(generator="seq_member_account",strategy=GenerationType.SEQUENCE)

	public Integer getMemberAccountId() {
		return memberAccountId;
	}
	public MemberAccount() {
		super();
	}
	public void setMemberAccountId(Integer memberAccountId) {
		this.memberAccountId = memberAccountId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public Float getUseableBalance() {
		return useableBalance;
	}
	public void setUseableBalance(Float useableBalance) {
		this.useableBalance = useableBalance;
	}
	public Float getImusealeBalance() {
		return imusealeBalance;
	}
	public void setImusealeBalance(Float imusealeBalance) {
		this.imusealeBalance = imusealeBalance;
	}
	public Float getTotalProfit() {
		return totalProfit;
	}
	public void setTotalProfit(Float totalProfit) {
		this.totalProfit = totalProfit;
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
	public Float getBonusAmount() {
		return bonusAmount;
	}
	public void setBonusAmount(Float bonusAmount) {
		this.bonusAmount = bonusAmount;
	}
	public Float getInvestAmount() {
		return investAmount;
	}
	public void setInvestAmount(Float investAmount) {
		this.investAmount = investAmount;
	}
	public Integer getDelflag() {
		return delflag;
	}
	public void setDelflag(Integer delflag) {
		this.delflag = delflag;
	}
	public Float getBbinAmount() {
		return bbinAmount;
	}
	public void setBbinAmount(Float bbinAmount) {
		this.bbinAmount = bbinAmount;
	}

	public MemberAccount(Integer memberId, Float useableBalance, Float imusealeBalance, Float totalProfit,
			Date createDate, Date updateDate, Float bonusAmount, Float investAmount, Integer delflag,
			Float bbinAmount) {
		this.memberId = memberId;
		this.useableBalance = useableBalance;
		this.imusealeBalance = imusealeBalance;
		this.totalProfit = totalProfit;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.bonusAmount = bonusAmount;
		this.investAmount = investAmount;
		this.delflag = delflag;
		this.bbinAmount = bbinAmount;
	}
}
