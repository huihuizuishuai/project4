package org.qhit.service.lzj;

import java.util.List;

import org.qhit.entity.FinancialPlanner;
import org.qhit.entity.MemberAccount;
import org.qhit.entity.MemberBankcards;
import org.qhit.entity.MemberDepositRecord;
import org.qhit.entity.MemberTradeRecord;
import org.qhit.entity.MemberWithdrawRecord;
import org.qhit.entity.Members;
import org.qhit.entity.Subject;
import org.qhit.entity.SubjectBbinPurchaseRecord;
import org.qhit.entity.SubjectPurchaseRecord;
import org.springframework.data.domain.Page;


public interface MembersService {
	//账号管理分页模糊查询
	public Page<Members> members(Integer page,Integer size,final Members members);
	//账号详情：账号信息
	public Members findmembers(Integer memberId);
	//账号详情：资金信息
	public MemberAccount findMemberAccount(Integer memberId);
	//账号详情：理财师信息
	public FinancialPlanner findplanner(Integer memberId);
	//账号详情：提现记录
	public MemberWithdrawRecord findwithdraw(Integer memberId);
	//账号详情：充值记录
	public MemberDepositRecord finddeposit(Integer memberId);
	//账号详情：钱包记录
	public MemberTradeRecord findtrade(Integer memberId);
	/***
	 * 理财师审核，先查账号信息表再查理财师表
	 * @return
	 */
	//查询理财师的所有信息
	public List<Object[]> mfobj();
	//模糊查询理财师的所有信息
	public List<Object[]> likeplanner(Members members,FinancialPlanner financialPlanner);
	//审核认证
	public void updateId(FinancialPlanner memberid);
	
	//绑卡管理
	public List<Object[]> likebank(Members members, MemberBankcards memberBankcards);
	
	//付息计划
	public Page<Subject> findsubject(Integer page,Integer size,final Subject subject);
	
	//体验金付息计划
	public List<Object[]> likesb(Integer subjectid);
	
	
	//付息列表
	public List<Object[]> likesp(Integer subjectid, Integer memberid);
	
	public Integer getcount(MemberDepositRecord memberDepositRecord,Members members);
	
	public List<Object[]> findMDRPage(Integer page,Integer size,Members members,MemberDepositRecord mdr);
	
	//体现管理
	public Page<SubjectPurchaseRecord> findspr(Integer page,Integer size,final SubjectPurchaseRecord spRecord);
	
	//根据id查询这条数据的购买记录
	SubjectPurchaseRecord findSubjectPurchaseRecordById(Integer sprId);
	
	public Subject findSubject(Integer subjectId);
}
