package org.qhit.dao.lzj;

import java.util.List;

import org.qhit.entity.FinancialPlanner;
import org.qhit.entity.MemberBankcards;
import org.qhit.entity.MemberDepositRecord;
import org.qhit.entity.Members;
import org.qhit.entity.SubjectBbinPurchaseRecord;

public interface MembersDao {
	//查询所有信息
	public List<Members> findmembers();
	//理财师审核
	public List<Object[]> mfobj();
	//模糊查询理财师
	public List<Object[]> likeplanner(Members members,FinancialPlanner financialPlanner); 
	

	public void updateId(FinancialPlanner memberid);
	
	//绑卡管理
	public List<Object[]> likebank(Members members,MemberBankcards memberBankcards);
	
	//体验金付息计划
	public List<Object[]> likesb(Integer subjectid);
	
	//付息列表
	public List<Object[]> likesp(Integer subjectid,Integer memberid);
	
	//还款功能，先查询，然后用save方法修改还款状态
	public List<SubjectBbinPurchaseRecord> findsbb(Integer memberId);
	//
	public List<Object[]> findMDRPage(Integer page,Integer size,Members members,MemberDepositRecord mdr);
	
	public Integer getcount(MemberDepositRecord memberDepositRecord,Members members);
		
}
