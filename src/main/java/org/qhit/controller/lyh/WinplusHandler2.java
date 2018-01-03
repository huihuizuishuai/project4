package org.qhit.controller.lyh;

import java.net.SocketException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.qhit.dao.lyh.FinancialPlannerRepository;
import org.qhit.dao.lyh.MemberBankcardsRepository;
import org.qhit.dao.lyh.MemberDepositRecordRepository;
import org.qhit.dao.lyh.MemberTradeRecordRepository;
import org.qhit.dao.lyh.MemberWithdrawRecordRepository;
import org.qhit.dao.lyh.MembersAccountRepository;
import org.qhit.dao.lyh.MemberssRepository;
import org.qhit.dao.lyh.SubjectOrderRecordsRepository;
import org.qhit.dao.lyh.SubjectPurchaseRecordsRepository;
import org.qhit.dao.lyh.SubjectsRepository;
import org.qhit.entity.FinancialPlanner;
import org.qhit.entity.MemberAccount;
import org.qhit.entity.MemberBankcards;
import org.qhit.entity.MemberDepositRecord;
import org.qhit.entity.MemberWithdrawRecord;
import org.qhit.entity.Members;
import org.qhit.entity.Subject;
import org.qhit.entity.SubjectOrderRecord;
import org.qhit.entity.SubjectPurchaseRecord;
import org.qhit.service.lyh.WinPlusService;
import org.qhit.service.xly.SubjectPurchaseRecordService;
import org.qhit.util.DateUtil;
import org.qhit.util.GetIP;
import org.qhit.util.SendMsg_webchinese;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Controller
@RequestMapping("Main")
public class WinplusHandler2 {
	@Autowired
	WinPlusService winService;
	@Autowired
	MemberssRepository memberRepository;
	@Autowired
	MemberBankcardsRepository memberBankcardsRepository;
	@Autowired
	FinancialPlannerRepository financialPlannerRepository;
	@Autowired
	MembersAccountRepository membersAccountRepository;
	@Autowired
	MemberTradeRecordRepository memberTradeRecordRepository;
	@Autowired
	MemberDepositRecordRepository memberDepositRecordRepository;
	@Autowired
	MemberWithdrawRecordRepository memberWithdrawRecordRepository;
	@Autowired
	SubjectPurchaseRecordsRepository subjectPurchaseRecordRepository;
	@Autowired
	SubjectOrderRecordsRepository subjectOrderRecordsRepository;
	@Autowired
	SubjectsRepository subjectsRepository;

	//登录页面
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String tologin(){
		return "index/login";
	}
	//注册页面
	@RequestMapping(value="regis",method=RequestMethod.GET)
	public String regis1(){
		return "admin/web/regis";
	}
	@RequestMapping(value="/checkedSms",method=RequestMethod.POST)//seccode
	@ResponseBody//此注解不能省略 否则ajax无法接受返回值  
	public Map<String,Object> checkedSms(HttpServletRequest request,HttpSession session)throws Exception {
		Map<String,Object> rMap = new HashMap<>();

		String mobilePhone = request.getParameter("phone");
		Integer rand = SendMsg_webchinese.checkedSms(mobilePhone);
		//使用时调用
//		rMap.put("rand", rand);
		System.out.println("rand:"+rand);
		session.setAttribute("rands", rand);
		return rMap;
	}
	//账号注册
	@RequestMapping(value="regis",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> regis(HttpServletRequest request,HttpSession session) throws Exception{
		Map<String, Object> map = new HashMap<>();
		String mobilePhoneRand = null ;
		Object objCode = session.getAttribute("rands");
		if(objCode!=null){
			mobilePhoneRand = objCode.toString();
		}else {
			map.put("msg", "点击获取验证码");
			return map;
		}
		String name = request.getParameter("name");
		String mobilePhone = request.getParameter("mobilePhone");
		String password = request.getParameter("password");
		String imgcode = request.getParameter("imgcode");
		String code = request.getParameter("code");
		String invitedcode = request.getParameter("invitedcode");
		String qqnumber = request.getParameter("qqnumber");
		//1.判断图片验证码
		String rand = session.getAttribute("rand").toString();
		if (!imgcode.equals(rand)) {
			map.put("msg", "图形验证码错误");
			return map;
		}
		System.err.println("mobilePhoneRand----"+mobilePhoneRand+"----"+code);
		if (!mobilePhoneRand.equals(code)) {
			map.put("msg", "手机验证码错误！");
			return map;
		}
		//判断手机号是否被注册
		List<Members> member = memberRepository.findBymobilePhone(mobilePhone);
		if (member.size()>0) {
			map.put("msg", "手机号已被注册！");
			return map;
		}
		//判断手机验证码是否正确

		try {
			Members members = new Members();
			members.setMemberName(name);
			members.setNames(name);
			members.setMobilePhone(mobilePhone);
			members.setPasswords(password);
			members.setStatus(0);
			members.setDelFlag(0);
			members.setCreateDate(new Date());
			members.setUpdateDate(new Date());
			members.setInvitationCode("");//邀请码
			members.setInvitedCode(invitedcode);//被邀请码
			members.setQqNumber(qqnumber);
			Float tyj = 0.00f;
			if (invitedcode!=null) {
				tyj = 8888.0f;
			}
			memberRepository.saveAndFlush(members);
			MemberAccount memberAccount = new MemberAccount(members.getMemberId(), 0.00f, 0.00f, 0.00f,new Date(), new Date(), 0.00f, 0.00f, 0, tyj);
			membersAccountRepository.saveAndFlush(memberAccount);
			map.put("code", 0);
		} catch (Exception e) {
			map.put("msg", "未知错误");
			return map;
		}

		return map;
	}
	//固收类理财
	@RequestMapping(value="/subjects")
	public String tosubject(HttpServletRequest request,HttpSession session,
			@RequestParam(value="subType",required=false)Integer subType,
			@RequestParam(value="yearRate",required=false)Integer yearRate,
			@RequestParam(value="period",required=false)Integer period,
			@RequestParam(value="status",required=false)Integer status){
		Integer subjectId = null;
		List<Subject> subjects = winService.subjects(subjectId,subType,yearRate,period,status);
		session.setAttribute("subType", subType);
		session.setAttribute("yearRate", yearRate);
		session.setAttribute("period", period);
		session.setAttribute("status", status);
		request.setAttribute("subjects", subjects);
		return "index/subject";
	}
	//固收类理财
	@RequestMapping(value="/subject")
	public String subject(HttpServletRequest request,HttpSession session){
		Integer subjectId = null;
		List<Subject> subjects = winService.subjects(subjectId,0,0,0,0);
		request.setAttribute("subjects", subjects);
		return "index/subject";
	}
	//私募基金
	@RequestMapping(value="finance",method=RequestMethod.GET)
	public String tofinance(HttpServletRequest request){
		return "index/finance";
	}
	//海外配置
	@RequestMapping(value="oversea",method=RequestMethod.GET)
	public String tooversea(HttpServletRequest request){
		return "index/oversea";
	}
	//固收类理财购买
	@RequestMapping(value="subject_buy/{subjectId}",method=RequestMethod.GET)
	public String tosubject_buy(HttpSession session,HttpServletRequest request,@PathVariable("subjectId") Integer subjectId){
		List<Subject> subjects = winService.subjects(subjectId, 0, 0, 0, 0);
		Subject subject = subjects.get(0);
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			MemberAccount memberAccount = null;
			try {
				memberAccount = membersAccountRepository.getMemberByuserId(member.getMemberId()).get(0);
				request.setAttribute("memberAccount", memberAccount);
			} catch (Exception e) {}
		}
		request.setAttribute("subject", subject);
		return "index/subject_buy";
	}


	@RequestMapping(value="login",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> login(HttpServletRequest request,HttpSession session){

		Map<String, Object> map = new HashMap<String, Object>();
		String mobilePhone =request.getParameter("mobilePhone");
		String password =request.getParameter("password");
		List<Members> members = memberRepository.findByMembers(mobilePhone,password);
		if (members == null || members.isEmpty()) {
			map.put("msg", "账号或密码输入错误！");
			return map;
		}else {
			Members member = members.get(0);
			if (member.getStatus()!=0) {
				map.put("msg", "账号被锁定！");
				return map;
			}
			session.setAttribute("member", member);
			map.put("code", 0);
		}
		return map;
	}
	@RequestMapping(value="toVipList",method=RequestMethod.GET)
	public String main(HttpServletRequest request,HttpSession session){
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			MemberAccount memberAccount = null;
			try {
				memberAccount = membersAccountRepository.getMemberByuserId(member.getMemberId()).get(0);
			} catch (Exception e) {
			}
			request.setAttribute("memberAccount", memberAccount);
		}
		return "index/viplist";

	}
	@RequestMapping(value="logout",method=RequestMethod.GET)
	public String logout(HttpSession session){
		try {
			session.removeAttribute("member");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index/login";
	}

	//投资记录/预约记录
	@RequestMapping(value="tzjl",method=RequestMethod.GET)
	public String totzjl(HttpServletRequest request,HttpSession session,Integer page,Integer page1){
		Object object = null;
		if (page==null) {
			page = 1;//投资记录当前页数
		}
		if (page1==null) {
			page1 = 1;//预约记录当前页数
		}
		Integer rows = 8;//投资记录每页显示条数
		Integer rows1 = 2;//投资记录每页显示条数
		Integer sprCount = 0;//投资记录总条数
		Integer fpsCount = 0;//预约记录总条数
		//		Integer pageCount = 0;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			try {
				sprCount = winService.sprCount(member.getMemberId());
			} catch (Exception e) {
			}
			Integer pageCount = 0;
			if ((sprCount%rows)==0) {
				pageCount=sprCount/rows;
			}else {
				pageCount=sprCount/rows+1;
			}
			List<Object[]> sprObj = winService.sprObj(member.getMemberId(),page,rows);
			//////////////////////////////////////////////////////////////////////////////
			Integer pageCount1 = 0;
			try {
				fpsCount = winService.fpsCount(member.getMemberId());
			} catch (Exception e) {
			}
			if ((fpsCount%rows)==0) {
				pageCount1=fpsCount/rows;
			}else {
				pageCount1=fpsCount/rows+1;
			}
			List<Object[]> fpsobj = winService.fpsList(member.getMemberId(),page1,rows1);
			request.setAttribute("sprCount", sprCount);
			request.setAttribute("fpsCount", fpsCount);
			request.setAttribute("sprObj", sprObj);
			request.setAttribute("rows", rows);
			request.setAttribute("page", page);
			request.setAttribute("page1", page1);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageCount1", pageCount1);
			request.setAttribute("fpsobj", fpsobj);
		}
		return "admin/web/member/admin-tzjl";
	}

	//收益记录
	@RequestMapping(value="syjl",method=RequestMethod.GET)
	public String tosyjl(HttpServletRequest request,HttpSession session,Integer page){
		Object object = null;
		if (page==null) {
			page = 1;//当前页数
		}
		Integer rows = 3;//每页显示条数
		Integer mprCount = 0;//总条数
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			try {
				mprCount = winService.mprCount(member.getMemberId());
			} catch (Exception e) {
			}
			Integer pageCount = 0;
			if ((mprCount%rows)==0) {
				pageCount=mprCount/rows;
			}else {
				pageCount=mprCount/rows+1;
			}
			List<Object[]> mprobj = winService.mprList(member.getMemberId(), page, rows);
			request.setAttribute("mprobj", mprobj);
			request.setAttribute("mprCount", mprCount);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("page", page);
		}
		return "admin/web/member/admin-syjl";
	}
	//充值记录
	@RequestMapping(value="czjl",method=RequestMethod.GET)
	public String toczjl(HttpServletRequest request,HttpSession session,Integer page){
		Object object = null;
		if (page==null) {
			page = 1;//当前页数
		}
		Integer rows = 5;//每页显示条数
		Integer mdrCount = 0;//总条数
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			try {
				mdrCount = winService.mdrCount(member.getMemberId());
			} catch (Exception e) {
			}
			Integer pageCount = 0;
			if ((mdrCount%rows)==0) {
				pageCount=mdrCount/rows;
			}else {
				pageCount=mdrCount/rows+1;
			}
			List<Object[]> mdrObj = winService.mdrObj(member.getMemberId(), page, rows);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("mdrObj", mdrObj);
			request.setAttribute("page", page);
			request.setAttribute("mdrCount", mdrCount);
		}
		return "admin/web/member/admin-czjl";
	}
	@RequestMapping(value="returnUrl",method=RequestMethod.GET)
	public String returnUrl(HttpServletRequest request,HttpSession session,Integer page){
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			try {
				String serialNumber = request.getParameter("out_trade_no");
				String totalAmount = request.getParameter("total_amount");
				List<MemberDepositRecord> memberDepositRecords = memberDepositRecordRepository.mdrListByserialNumber(serialNumber);
				MemberDepositRecord memberDepositRecord = memberDepositRecords.get(0);
				memberDepositRecord.setStatus(1);
				MemberAccount memberAccount = null;
				try {
					memberAccount = membersAccountRepository.getMemberByuserId(member.getMemberId()).get(0);
					memberAccount.setUseableBalance(memberAccount.getUseableBalance()+Float.parseFloat(totalAmount));
				} catch (Exception e) {
				}
				memberDepositRecordRepository.saveAndFlush(memberDepositRecord);
				membersAccountRepository.saveAndFlush(memberAccount);
			} catch (Exception e) {
				e.printStackTrace();
				return "admin/error/404";
			}
		}	

		return "redirect:toVipList";
	}
	//提款记录
	@RequestMapping(value="tkjl",method=RequestMethod.GET)
	public String totkjl(HttpServletRequest request,HttpSession session,Integer page){
		Object object = null;
		if (page==null) {
			page = 1;//当前页数
		}
		Integer rows = 3;//每页显示条数
		Integer mwrCount = 0;//总条数
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			try {
				mwrCount = winService.mwrCount(member.getMemberId());
			} catch (Exception e) {
			}
			Integer pageCount = 0;
			if ((mwrCount%rows)==0) {
				pageCount=mwrCount/rows;
			}else {
				pageCount=mwrCount/rows+1;
			}
			List<Object[]> mwrObj = winService.mwrObj(member.getMemberId(), page, rows);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("mwrObj", mwrObj);
			request.setAttribute("page", page);
			request.setAttribute("mwrCount", mwrCount);
		}
		return "admin/web/member/admin-tkjl";
	}
	//体验金记录
	@RequestMapping(value="tyjjl",method=RequestMethod.GET)
	public String totyjjl(HttpServletRequest request,HttpSession session){
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			List<Object[]> tyjObj1 = winService.tyjObj(member.getMemberId());
			Object[] tyjObj = null;
			try {
				tyjObj = tyjObj1.get(0);

				if (tyjObj[1] == null) {
					request.setAttribute("tyjObj", tyjObj);
					request.setAttribute("yanzheng", 0);
				}else {
					request.setAttribute("tyjObj", tyjObj);
				}
			} catch (Exception e) {
				request.setAttribute("yanzheng", 0);
			}
		}	
		return "admin/web/member/admin-tyjjl";
	}
	//账户充值
	@RequestMapping(value="zhcz",method=RequestMethod.GET)
	public String tozhcz(HttpServletRequest request,HttpSession session,Integer page){
		Object object = null;
		if (page==null) {
			page = 1;//当前页数
		}
		Integer rows = 5;//每页显示条数
		Integer mdrCount = 0;//总条数

		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {

			Members member = (Members) object;
			try {
				mdrCount = winService.mdrCount(member.getMemberId());
			} catch (Exception e) {
			}
			Integer pageCount = 0;
			if ((mdrCount%rows)==0) {
				pageCount=mdrCount/rows;
			}else {
				pageCount=mdrCount/rows+1;
			}
			List<Object[]> mdrObj = winService.mdrObj(member.getMemberId(), page, rows);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("mdrObj", mdrObj);
			request.setAttribute("page", page);
			request.setAttribute("mdrCount", mdrCount);
			List<MemberBankcards> bankcards = null;
			List<MemberDepositRecord> mdrList = memberDepositRecordRepository.mdrList(member.getMemberId());
			request.setAttribute("mdrList", mdrList);
			bankcards=memberBankcardsRepository.findMemberBankcards(member.getMemberId());
			if (bankcards.size()>0) {
				request.setAttribute("cardNo", bankcards.get(0).getCardNo());
				request.setAttribute("type", bankcards.get(0).getMemberBankcardsType());
			}else {
				return "admin/web/member/bdyhk";
			}
		}
		return "admin/web/member/zhcz";
	}
	//充值记录
	@RequestMapping(value="zhczjl",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> toczjl(HttpServletRequest request,HttpSession session){
		Map<String, Object> map = new HashMap<>();
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			List<MemberDepositRecord> mdrList = memberDepositRecordRepository.mdrList(member.getMemberId());
			map.put("mdrList", mdrList);
			return map;
		}
		return map;
	}
	@RequestMapping(value="gopay",method=RequestMethod.POST)
	public String gopay(HttpServletRequest request,HttpSession session){
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			String datestr = DateUtil.getTimeStamp();
			Members member = (Members) object;
			String fee = request.getParameter("fee");

			String cardType = request.getParameter("cardType");
			String cardNo = request.getParameter("cardNo");
			request.setAttribute("datestr", datestr);
			request.setAttribute("member", member);
			request.setAttribute("fee", fee);
			request.setAttribute("cardType", cardType);
			request.setAttribute("cardNo", cardNo);
			MemberDepositRecord mdr = new MemberDepositRecord(datestr, member.getMemberId(), Float.parseFloat(fee), 0,
					"FUIOU", "", null, new Date(), new Date());
			memberDepositRecordRepository.saveAndFlush(mdr);
		}
		return "alipay.trade.page.pay";
	}
	//安全信息
	@RequestMapping(value="aqxx",method=RequestMethod.GET)
	public String toaqxx(HttpServletRequest request,HttpSession session){
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			List<Members> mList = memberRepository.findByMemberId(member.getMemberId());
			Members members = mList.get(0);
			if (members.getWithdrawPassword()==null) {
				request.setAttribute("tikuan", 0);
			}else {
				request.setAttribute("tikuan", 1);
			}
			if (members.getMemberIdentity()==null) {
				request.setAttribute("renzheng", 0);
			}else {
				String phone = member.getMobilePhone();
				String phone2 = phone.substring(0, 6);
				phone2=phone2+"******";
				String identity = members.getMemberIdentity();
				String identity2 = identity.substring(0, 3);
				String identity3 = identity.substring(15, 18);
				String identity4 = identity2+"***"+identity3;

				request.setAttribute("phone", phone2);
				request.setAttribute("identity", identity4);
				request.setAttribute("renzheng", 1);
			}
		} 
		return "admin/web/member/aqxx";
	}
	@RequestMapping(value="wytk",method=RequestMethod.GET)
	public String towytk(HttpServletRequest request,HttpSession session,Integer page){
		Object object = null;
		Members member = null;
		if (page==null) {
			page = 1;//当前页数
		}
		Integer rows = 3;//每页显示条数
		Integer mwrCount = 0;//总条数
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			member = (Members) object;
			try {
				mwrCount = winService.mwrCount(member.getMemberId());
			} catch (Exception e) {
			}
			Integer pageCount = 0;
			if ((mwrCount%rows)==0) {
				pageCount=mwrCount/rows;
			}else {
				pageCount=mwrCount/rows+1;
			}
			List<Object[]> mwrObj = winService.mwrObj(member.getMemberId(), page, rows);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("mwrObj", mwrObj);
			request.setAttribute("page", page);
			request.setAttribute("mwrCount", mwrCount);
		}
		List<Members> mList = memberRepository.findByMemberId(member.getMemberId());
		Members members = mList.get(0);
		if (members.getWithdrawPassword()==null) {
			request.setAttribute("tikuan", 0);
		}else {
			request.setAttribute("tikuan", 1);
		}
		MemberAccount ma = null;
		try {
			ma = membersAccountRepository.getMemberByuserId(member.getMemberId()).get(0);
		} catch (Exception e) {
		}
		List<MemberBankcards> bankcards = null;
		bankcards=memberBankcardsRepository.findMemberBankcards(member.getMemberId());
		if (bankcards.size()>0) {
			request.setAttribute("ma", ma);
			request.setAttribute("cardNo", bankcards.get(0).getCardNo());
			request.setAttribute("type", bankcards.get(0).getMemberBankcardsType());
		}else {
		}
		return "admin/web/member/wytk";
	}

	//提款
	@RequestMapping(value="tk",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> submitWithdraw(HttpServletRequest request,HttpSession session){
		Map<String, Object> map = new HashMap<>();
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			String amount = request.getParameter("amount");
			String withdrawalPassword = request.getParameter("withdrawalPassword");
			String bankCard = request.getParameter("bankCard");
			if (!withdrawalPassword.equals(member.getWithdrawPassword())) {
				map.put("msg", "密码错误！");
				return map;
			}
			MemberAccount memberAccount = null;
			try {
				memberAccount = membersAccountRepository.getMemberByuserId(member.getMemberId()).get(0);
				if (memberAccount.getUseableBalance()<Float.parseFloat(amount)) {
					map.put("msg", "可用余额不足");
					return map;
				}
				MemberBankcards memberBankcards = null;
				try {
					memberBankcards = memberBankcardsRepository.findMemberBankcards(member.getMemberId()).get(0);
					String serialNumber = DateUtil.getTimeStamp();
					MemberWithdrawRecord mwr = new MemberWithdrawRecord(serialNumber, member.getMemberId(), Float.parseFloat(amount),
							"银行名称", bankCard, 0, 0, memberBankcards.getCardaddress(), "富友",
							new Date(), new Date());
					memberAccount.setUseableBalance(memberAccount.getUseableBalance()-Float.parseFloat(amount));
					memberWithdrawRecordRepository.saveAndFlush(mwr);
					membersAccountRepository.saveAndFlush(memberAccount);
					map.put("code", 0);
				} catch (Exception e) {
				}
			} catch (Exception e) {
			}
		}
		return map;
	}
	@RequestMapping(value="wslcs",method=RequestMethod.GET)
	public String towslcs(HttpServletRequest request,HttpSession session){
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			FinancialPlanner fp = null;
			try {
				fp = financialPlannerRepository.fpList(member.getMemberId()).get(0);
			} catch (Exception e) {
			}
			request.setAttribute("fp", fp);
		}
		return "admin/web/member/wslcs";
	}
	@RequestMapping(value="addFinancial",method=RequestMethod.POST)
	public String addFinancial(HttpServletRequest request,HttpSession session){
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			String name = request.getParameter("name");
			String orgname = request.getParameter("orgname");
			String mycard = request.getParameter("mycard");
			String address = request.getParameter("address");
			FinancialPlanner financialPlanner = new FinancialPlanner(member.getMemberId(),
					name, orgname, mycard, address, 0, new Date(), new Date());
			financialPlannerRepository.saveAndFlush(financialPlanner);		
		}
		return "redirect:wslcs";
	}
	@RequestMapping(value="renzheng",method=RequestMethod.GET)
	public String renzheng(){

		return "admin/web/member/bdyhk";
	}
	@RequestMapping(value="addBankCard",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addBankCard(HttpServletRequest request,HttpSession session){
		Map<String, Object> map = new HashMap<>();
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			String userName = request.getParameter("userName");
			String identity = request.getParameter("identity");
			String bankCard = request.getParameter("bankCard");
			String type = request.getParameter("type");
			String cardaddress = request.getParameter("cardaddress");

			List<Members> mList = memberRepository.findByMemberIdentity(identity);
			List<MemberBankcards> mList2 = memberBankcardsRepository.findBycardNo(bankCard);
			if(mList == null||mList.isEmpty()){	//判断身份证是否存在
				if (mList2 == null || mList2.isEmpty()) {
					try {
						Members members = memberRepository.findByMemberId(member.getMemberId()).get(0);
						members.setMemberId(member.getMemberId());
						members.setNames(userName);
						members.setMemberIdentity(identity);

						MemberBankcards memberBankcards = new MemberBankcards();
						memberBankcards.setCardNo(bankCard);
						memberBankcards.setMemberBankcardsType(type);
						memberBankcards.setCardaddress(cardaddress);
						memberBankcards.setMemberId(member.getMemberId());
						memberBankcards.setCreateDate(new Date());
						memberBankcards.setUpdateDate(new Date());

						memberRepository.saveAndFlush(members);
						memberBankcardsRepository.saveAndFlush(memberBankcards);

						session.setAttribute("bankCard", bankCard);
						session.setAttribute("type", type);
						session.setAttribute("cardaddress",cardaddress);
						map.put("msg", "保存成功！");
						map.put("code", 0);
					} catch (Exception e) {
						map.put("msg", "未知错误！");
						return map;
					}

				}else {
					map.put("msg", "银行卡号已存在！");
					return map;
				}
			}else {
				map.put("msg", "身份证已存在！");
				return map;
			}
		}
		return map;

	}
	@RequestMapping(value="withdrawpwd",method=RequestMethod.POST)
	@ResponseBody
	@JsonIgnore
	public Map<String, Object> setwithdrawpwd(HttpSession session,HttpServletRequest request){
		Map<String, Object> map = new HashMap<>();
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			try {
				String withdrawPassword = request.getParameter("password");
				Members member = (Members) object;
				member.setWithdrawPassword(withdrawPassword);
				memberRepository.saveAndFlush(member);
				map.put("code", 0);
			} catch (Exception e) {
				map.put("msg", "未知错误！");
				return map;
			}

		}
		return map;
	}
	//银行卡管理
	@RequestMapping(value="memberBankcardView",method=RequestMethod.GET)
	public String memberBankcardView(HttpSession session,HttpServletRequest request){
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			List<MemberBankcards> mList = memberBankcardsRepository.findMemberBankcards(member.getMemberId());
			MemberBankcards memberBankcards = mList.get(0);
			request.setAttribute("bankCard", memberBankcards.getCardNo());
			request.setAttribute("type", memberBankcards.getMemberBankcardsType());
			request.setAttribute("cardaddress", memberBankcards.getCardaddress());
		}
		return "admin/web/member/memberBankcardView";
	}

	@RequestMapping(value="/changeLoginPwd",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changeLoginPwd(HttpSession session,HttpServletRequest request){
		Map<String, Object> map = new HashMap<>();
		String oldPwd = request.getParameter("oldPwd");
		String newPwd = request.getParameter("newPwd");
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {

			Members member = (Members) object;
			if (oldPwd.equals(member.getPasswords())) {
				member.setMemberId(member.getMemberId());
				member.setPasswords(newPwd);
				memberRepository.saveAndFlush(member);
				map.put("code", 0);
			}else {
				map.put("msg", "原密码输入错误！");
				return map;
			}
		}
		return map;
	}
	@RequestMapping(value="/toOrderView",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> tosubjectBuy(HttpSession session,HttpServletRequest request) throws Exception{
		Map<String, Object> map = new HashMap<>();
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			String serialNumber = "YJ"+DateUtil.getTimeStamp();
			Members member = (Members) object;
			String subjectId = request.getParameter("subjectId");
			String totalFee = request.getParameter("totalFee");
			SubjectOrderRecord sor = new SubjectOrderRecord();
			sor.setSerialNumber(serialNumber);
			sor.setDealType(2);//交易类型
			sor.setAmount(Float.parseFloat(totalFee));//订单金额
			sor.setStatus(1);//状态
			sor.setSubjectId(Integer.parseInt(subjectId));
			sor.setMemberId(member.getMemberId());
			sor.setDelflag(0);
			sor.setCreateDate(new Date());
			sor.setUpdateDate(new Date());
			subjectOrderRecordsRepository.saveAndFlush(sor);//标的订单
			//			session.setAttribute("sor", sor);
			map.put("msg", serialNumber);
			map.put("code", 0);
		}
		return map;
	}
	@RequestMapping(value="orderView",method=RequestMethod.GET)
	public String orderView(HttpSession session,HttpServletRequest request){
		String tradeNo = request.getParameter("tradeNo");//订单编号
		SubjectOrderRecord sor = null;
		try {
			sor = subjectOrderRecordsRepository.sorlist(tradeNo).get(0);
		} catch (Exception e) {
		}
		Subject subject = subjectsRepository.findOne(sor.getSubjectId());
		request.setAttribute("sor", sor);
		request.setAttribute("subject", subject);
		return "admin/web/subject/order";
	}
	@RequestMapping(value="subjectBuy",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> subjectBuy(HttpSession session,HttpServletRequest request) throws SocketException{
		Map<String, Object> map = new HashMap<>();
		Object object = null;
		try {
			object = session.getAttribute("member");
		} catch (Exception e) {
		}
		if (object!=null) {
			Members member = (Members) object;
			//
			String tradeNo = request.getParameter("tradeNo");//订单编号
			SubjectOrderRecord sor = null;
			try {
				SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
				Calendar c = Calendar.getInstance();
				sor = subjectOrderRecordsRepository.sorlist(tradeNo).get(0);
				Subject subject = subjectsRepository.findOne(sor.getSubjectId());
				SubjectPurchaseRecord spr = new SubjectPurchaseRecord();
				String serialNumber = "YJ"+DateUtil.getTimeStamp();
				String ip = GetIP.getRealIp();
				Integer period = subject.getPeriod();
				Float interest = subject.getYearRate()/365*period;
				Float totalFee = sor.getAmount();
				c.add(Calendar.DAY_OF_MONTH,period);
				String period2 = sf.format(c.getTime());
				
				spr.setSerialNumber(serialNumber);
				spr.setAmount(totalFee);
				spr.setDealIp(ip);
				spr.setSubjectId(sor.getSubjectId());
				spr.setMemberId(member.getMemberId());
				spr.setDelflag(0);
				spr.setCreateDate(new Date());
				spr.setUpdateDate(new Date());
				spr.setInterest(interest);
				spr.setIspayment(1);
				spr.setPayInterestTimes(2);//结算利息时间
				spr.setLastProfitDay(Integer.parseInt(period2));//最后计息日  当前日期+标的周期
				Integer bonusFee = 0;//request.getParameter("bonusFee")
				spr.setBonusInfo(totalFee+"-"+bonusFee);
				subjectPurchaseRecordRepository.saveAndFlush(spr);
				Integer bought2 = subject.getBought();
				subject.setBought(bought2+1);//购买人数+1
				subjectsRepository.save(subject);
				MemberAccount ma = null;
				try {
					ma = membersAccountRepository.getMemberByuserId(member.getMemberId()).get(0);
				} catch (Exception e) {
				}
				ma.setUseableBalance(ma.getUseableBalance()-totalFee);
				ma.setInvestAmount(ma.getInvestAmount()+totalFee);
				membersAccountRepository.saveAndFlush(ma);
				
				map.put("code", 0);
				map.put("msg", "购买成功");
			} catch (Exception e) {
				map.put("msg", "未知错误！");
				return map;
			}
		}
		return map;
	}


}
