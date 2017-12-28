package org.qhit.controller.xly;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.qhit.dao.xly.SubjectRepository;
import org.qhit.entity.Members;
import org.qhit.entity.Subject;
import org.qhit.entity.SysParam;
import org.qhit.service.xly.MemberService;
import org.qhit.service.xly.SubjectPurchaseRecordService;
import org.qhit.service.xly.SubjectService;
import org.qhit.service.xly.SysParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("XIAO")
public class SubjectController {
	@Autowired
	SubjectService subjectService;
	@Autowired
	SubjectRepository subjectRepository;
	@Autowired
	MemberService memberService;
	@Autowired
	SubjectPurchaseRecordService subjectPurchaseRecordService;
	@Autowired
	SysParamService sysParamService;

	@RequestMapping("main")
	public String main(Integer page,HttpServletRequest request,Map<String, Object> map,Subject subject){
		List<SysParam> subjectType = sysParamService.find("subjectType");//查询类别
		List<SysParam> status = sysParamService.find("status");//查询状态
		List<SysParam> guaranteeType = sysParamService.find("guaranteeType");//查询担保方式
		if (page==null) {
			page=1;
		}
		int size=2;//每页显示5条信息
		Page page2=subjectService.findAllPage(page, size, subject);
		map.put("page2", page2);
		map.put("subjectType", subjectType);
		map.put("status", status);
		map.put("guaranteeType", guaranteeType);
		map.put("subject", subject);
		//page2.getNumber();当前页数
		//page2.getContent();结果集
		//page2.getTotalPages();总页数
		return "admin/subject/gu_shou"; 
	}
	
	//执行添加方法
	@RequestMapping("toadd")
	public String toaddSubject(Map<String, Object> map){
		List<SysParam> subjectType = sysParamService.find("subjectType");
		List<SysParam> status = sysParamService.find("status");
		List<SysParam> experStatus = sysParamService.find("experStatus");
		List<SysParam> safetycontrol = sysParamService.find("safetycontrol");
		map.put("subjectType", subjectType);
		map.put("status", status);
		map.put("experStatus", experStatus);
		map.put("safetycontrol", safetycontrol);
		return "admin/subject/add_subject";
	}
	//添加
	@RequestMapping("add")	
	public String addSubject(Subject subject){
		Date date = new Date();
		SimpleDateFormat sb = new SimpleDateFormat("yyyyMMddhhmmss");
		Random ne = new Random();
		int x = ne.nextInt(9000) +1000;
		subject.setCreateDate(date);
		subject.setSerialNumber("YJ"+x);
		subjectService.addSubject(subject);
		return "redirect:main";
	}
	/**
	 * 到修改 
	 * @param subjectId
	 * @param map
	 * @return
	 */
	@RequestMapping(value="toupdate/{subjectId}")
	public String toUpdateSubject(@PathVariable Integer subjectId, Map<String, Object> map){
		List<SysParam> subjectType = sysParamService.find("subjectType");
		List<SysParam> status = sysParamService.find("status");
		List<SysParam> experStatus = sysParamService.find("experStatus");
		List<SysParam> safetycontrol = sysParamService.find("safetycontrol");
		Subject subject = subjectService.seeList(subjectId);
		map.put("subject", subject);
		map.put("subjectType", subjectType);
		map.put("status", status);
		map.put("experStatus", experStatus);
		map.put("safetycontrol", safetycontrol);
		return "admin/subject/UpdateSubject";
	}
	
	/*@ModelAttribute
	public void getSubject(@RequestParam(value="subjectId") Integer subjectId,Map<String, Subject> map){
		if(subjectId != null){
			map.put("subject", subjectRepository.getSubject(subjectId));
		}
	}*/
	
	/**
	 * 修改
	 * @param subject
	 * @return
	 */
	@RequestMapping(value="update")
	public String UpdateSubject(Subject subject){
		Subject subjects= subjectRepository.getSubject(subject.getSubjectId());
		subject.setCreateDate(subjects.getCreateDate());
		subjectService.UpdateSubject(subject);
		
		return "redirect:main";
	}
	/**
	 * 查看投资
	 * @param subjectId
	 * @param map
	 * @return
	 */
	@RequestMapping("/subjectPurchase")
	public String seeList(Integer subjectId,@RequestParam(required=false,defaultValue="1") Integer page,@RequestParam(required=false,defaultValue="20")Integer pageSize,Model model){
		Page subjects = subjectPurchaseRecordService.getPurchaseRecord(subjectId, page, pageSize);
		List<Members> mberList = memberService.selectList();
		model.addAttribute("subjects",subjects);
		model.addAttribute("mberList", mberList);
		model.addAttribute("subjectId",subjectId);
		return "admin/subject/SeeSubjctformation"; 
	}
	@InitBinder
	public void initbinder(WebDataBinder binder){
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
}
