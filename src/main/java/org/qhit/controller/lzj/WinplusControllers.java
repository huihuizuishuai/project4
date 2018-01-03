package org.qhit.controller.lzj;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.qhit.dao.lzj.BankcardsRepository;
import org.qhit.dao.lzj.DepositRepository;
import org.qhit.dao.lzj.MemberAccountRepository;
import org.qhit.dao.lzj.MembersRepository;
import org.qhit.dao.lzj.PurchaseRepository;
import org.qhit.dao.lzj.SubjectBbinRepository;
import org.qhit.dao.lzj.SubjectPurchaseRepository;
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
import org.qhit.service.lzj.MembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
@RequestMapping("Li")
public class WinplusControllers {
	@Autowired
	MembersService membersService;
	@Autowired
	MembersRepository membersRepository;
	@Autowired
	BankcardsRepository bankcardsRepository;
	@Autowired
	SubjectBbinRepository subjectBbinRepository;
	@Autowired
	PurchaseRepository purchaseRepository;
	@Autowired
	DepositRepository depositRepository;
	@Autowired
	SubjectPurchaseRepository subjectPurchaseRepository;
	@Autowired
	MemberAccountRepository memberAccountRepository;
	/**
	 * 账号管理分页加模糊查询
	 * @param map
	 * @param page
	 * @param members
	 * @return
	 */
@RequestMapping(value="members")
public String findmembers(Map<String, Object> map,Integer page,Members members){
	if (page==null) {
		page=1;	
	}

	Integer size=3;
	//当前页数：memberspage.getNumber()
	//总页数：memberspage.getTotalPages()
	//当前页的结果集：memberspage.getContent()
	Page memberspage=membersService.members(page, size, members);
	map.put("memberspage", memberspage);
	map.put("members", members);
	System.out.println("rest:"+memberspage.getTotalPages());
	return "admin/sysmember/zhgl";
}
	
/***
 * 账号详情
 * @param map
 * @param memberId
 * @return
 */
	@RequestMapping("account/{memberId}")
	public String accountInformation(Map<String, Object> map,@PathVariable Integer memberId){
		//查询账号信息
		Members members=membersService.findmembers(memberId);
		//查询资金信息
		MemberAccount memberAccount=membersService.findMemberAccount(memberId);
		//查询理财师信息
		FinancialPlanner financialPlanner=membersService.findplanner(memberId);
		//查询提现记录
		MemberWithdrawRecord memberWithdrawRecord=membersService.findwithdraw(memberId);
		//查询充值记录
		MemberDepositRecord memberDepositRecord=membersService.finddeposit(memberId);
		//查询钱包记录
		MemberTradeRecord memberTradeRecord=membersService.findtrade(memberId);
		System.err.println("aaa:"+memberAccount.getImusealeBalance());
		map.put("members", members);
		map.put("memberAccount", memberAccount);
		map.put("financialPlanner", financialPlanner);
		map.put("memberWithdrawRecord", memberWithdrawRecord);
		map.put("memberDepositRecord", memberDepositRecord);
		map.put("memberTradeRecord", memberTradeRecord);
		return "admin/sysmember/member_info";
	}
	
	/**
	 * 理财师管理
	 * @param map
	 * @param members
	 * @param financialPlanner
	 * @param status
	 * @param request
	 * @return
	 */
	@RequestMapping("planner")
	public String planner(Map<String, Object> map,Members members,FinancialPlanner financialPlanner,String status,HttpServletRequest request){
		String stutsname=request.getParameter("status");
		request.setAttribute("status", stutsname);
		List<Object[]> likeplanner=membersService.likeplanner(members, financialPlanner);
		map.put("likeplanner", likeplanner);
		return "admin/sysmember/financia";
	}
		
	/**
	 * 认证审核
	 * @param memberid
	 * @return
	 */
	@RequestMapping("toupdate")
	public String updatestatus(String memberId){
		FinancialPlanner fp=membersService.findplanner(Integer.valueOf(memberId));
		fp.setStatus(1);
		membersService.updateId(fp);
		return"redirect:planner";
	}
	
	/**
	 * 绑卡管理
	 * @param map
	 * @param members
	 * @param memberBankcards
	 * @return
	 */
	@RequestMapping("likebank")
	public String likebank(Map<String, Object> map,Members members, MemberBankcards memberBankcards){
		List<Object[]> linkbank=membersService.likebank(members, memberBankcards);
		System.out.println(linkbank.get(1));
		map.put("linkbank", linkbank);
		return "admin/sysmember/bkgl";
	}
	
	/**
	 * 解绑银行卡
	 * @param memberId
	 * @return
	 */
	@RequestMapping("/updatecard")
	public String updatecard(String memberId){
		System.out.println("id:"+memberId);
		bankcardsRepository.updatecard(Integer.valueOf(memberId));
		return "redirect:likebank";
	}
	
	/**
	 * 付息计划
	 * @param map
	 * @param page
	 * @param subject
	 * @return
	 */
	@RequestMapping("subject")
	public String findsubject(Map<String, Object> map,Integer page,Subject subject,HttpServletRequest request){
		String subjectType=request.getParameter("subjectType");
		String status=request.getParameter("status");
		request.setAttribute("subjectType", subjectType);
		request.setAttribute("status", status);
		System.out.println("membername："+subject.getSubjectName());
		if (page==null) {
			page=1;	
		}

		Integer size=5;
		//当前页数：subjectpage.getNumber()
		//总页数：subjectpage.getTotalPages()
		//当前页的结果集：subjectpage.getContent()
		Page subjectpage=membersService.findsubject(page, size, subject);
		map.put("subjectpage", subjectpage);
		map.put("subject", subject);
		System.out.println("页数:"+subjectpage.getTotalPages());
		return "admin/sysmember/fxjh";
	}
	
	/**
	 * 体验金付息计划
	 * @param subjectid
	 * @param memberId
	 * @return
	 */
	@RequestMapping("likesb")
	public String likesb(HttpServletRequest request,Map<String, Object> map){
		String subjectId1 = request.getParameter("subjectId");
		Integer subjectId = null;
		if (subjectId1!=null) {
			subjectId=Integer.parseInt(subjectId1);
		}
		System.out.println("id:"+subjectId);
		
		List<Object[]> likesb=membersService.likesb(subjectId);
		System.out.println(likesb.get(0));
		map.put("likesb", likesb);
		return "admin/sysmember/fxjh_bbin_content";
	}
	
	/**
	 * 立即还款
	 * @param memberId
	 * @return
	 */
	@RequestMapping("updatessb")
	public String updatesbb(String memberId){
		subjectBbinRepository.updatesb(Integer.valueOf(memberId));
		return "redirect:subject";
	}
	/**
	 * 付息列表
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("likesp")
	public String likesp(HttpServletRequest request,Map<String, Object> map){
		String subjectId1=request.getParameter("subjectId");
		Integer subjectId=null;
		if (subjectId1!=null) {
			subjectId=Integer.parseInt(subjectId1);
		}
		Integer memberId=null;
		List<Object[]> likesp=membersService.likesp(subjectId, memberId);
		map.put("likesp", likesp);
		
		return "admin/sysmember/fxjh_content";
	}
	
	/**
	 * 付息列表立即还款
	 * @param memberId
	 * @return
	 */
	@RequestMapping("updatesp")
	public String updatesp(String memberId){
		purchaseRepository.updatesp(Integer.valueOf(memberId));
		return "admin/sysmember/fxjh_content";
	} 
	
	/**
	 * 充值管理
	 * @param map
	 * @param page
	 * @param members
	 * @param mdr
	 * @return
	 */
	@RequestMapping("czpage")
	public String findmdrpage(Map<String, Object> map,Integer page,Members members,MemberDepositRecord mdr,HttpServletRequest request){
			String status=request.getParameter("status");
			request.setAttribute("status", status);
			if (page==null) {
				page=1;
			}
			Integer size=2;
			Integer count=membersService.getcount(mdr,members);
			Integer pages=count%size==0?count/size:count/size+1;
			List<Object[]> pagemember=membersService.findMDRPage(page, size, members, mdr);
			map.put("members", members);
			map.put("mdr", mdr);
			map.put("page", page);
			map.put("pages", pages);
			map.put("count", count);
			map.put("pagemember", pagemember);
		return "admin/sysmember/czgl";
	}
	
	/**
	 * 更新订单
	 */
	@RequestMapping("recharge/{serialNumber}")
	public String pull(@PathVariable("serialNumber") String serialNumber, Map<String, Object> map){
		System.out.println(serialNumber);
		if (serialNumber!=null) {
			depositRepository.recharge(serialNumber);
		}
		return "redirect:/Li/czpage";
	}
	
	/**
	 * 体现管理
	 * @return
	 */
	@RequestMapping("spr")
	public String findspr(Map<String, Object> map,Integer page,final SubjectPurchaseRecord spRecord,HttpServletRequest request){
		String status=request.getParameter("status");
		request.setAttribute("status", status);
		if (page==null) {
			page=1;	
		}

		Integer size=3;
		//当前页数：spRecordpage.getNumber()
		//总页数：spRecordpage.getTotalPages()
		//当前页的结果集：spRecordpage.getContent()
		Page spRecordpage=membersService.findspr(page, size, spRecord);
		map.put("spRecordpage", spRecordpage);
		map.put("spRecord", spRecord);
		return "admin/sysmember/txgl";
	}
	
	/**
	 * 
	 * 提现审核
	 * @return
	 */
	@RequestMapping("aaa")
	public @ResponseBody Map tixian(HttpServletRequest request){
		String sprId=request.getParameter("sprId");
		String flag=request.getParameter("flag");
		
		Map<String, String> map=new HashMap<String,String>();
		String code="";
		//根据ID查询当前的这条购买记录
		SubjectPurchaseRecord spr=membersService.findSubjectPurchaseRecordById(Integer.valueOf(sprId));
		float amount=spr.getAmount();
		Float lx=null;
		//审核
		if (flag.equals("Auditing")) {
			Integer memberId=spr.getMemberId();
			//计算收益
			Subject subject=membersService.findSubject(spr.getSubjectId());
			Integer day=this.getDay(spr.getCreateDate());
			lx=spr.getAmount()*subject.getYearRate()/100/365*day;
			//修改利息
			purchaseRepository.UpdateInterestById(lx,Integer.valueOf(sprId));
			//修改累计收益
			memberAccountRepository.updateToatal(lx, memberId);
			//然后往MEMBER_PROFIT_RECORD中保存一条记录
			
			 
			//审核后修改状态
			
			
		}
		//解冻
		if(flag.equals("relieve")){
			Integer memberId=spr.getMemberId();
			//修改解冻金额
			purchaseRepository.updateStatus(Integer.valueOf(sprId));
			//修改投资金额
			memberAccountRepository.updateInvestAmount(memberId);
			//修改可用余额
			memberAccountRepository.updateUseAble(memberId);
			//修改冻结金额
			memberAccountRepository.updateImusealeBalance(memberId);
			
		}
		//贝付打款
		if(flag.equals("pay")){
			Integer memberId=spr.getMemberId();
			Float useable_balance =amount;
			//打款给可用余额
			memberAccountRepository.updateUseable(useable_balance, memberId);	
			//打款修改状态
			
		}
		code="success";
		map.put("code", code);
		return map;
	}

	private Integer getDay(Date cdate){
		Long day = new Date().getTime();
		Long cday = cdate.getTime();
		Long d = (day-cday)/(1000*60*60*24);
		return Integer.parseInt(d.toString());

	}

}
