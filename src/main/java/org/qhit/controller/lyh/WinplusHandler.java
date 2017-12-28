package org.qhit.controller.lyh;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.qhit.entity.Users;
import org.qhit.service.lyh.WinPlusService;
import org.qhit.util.SendMsg_webchinese;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("Admin")
public class WinplusHandler {
	@Autowired
	WinPlusService winService;
	
	//welcome
	@RequestMapping(value={"/index"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/system/index");
		return mv;
	}

	//进入登录页面
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String toLogin() {
		return "login";
	}

	//点击发送验证码--->给手机号发送验证码--->将验证码保存到session作用域
	@RequestMapping(value="/checkedSms",method=RequestMethod.POST)//seccode
	@ResponseBody//此注解不能省略 否则ajax无法接受返回值  
	public Map<String,Object> checkedSms(HttpServletRequest request,HttpSession session)throws Exception {
		Map<String,Object> rMap = new HashMap<>();

		String mobilePhone = request.getParameter("mobilePhone");
		Integer rand = SendMsg_webchinese.checkedSms(mobilePhone);
		//使用时调用
		rMap.put("rand", rand);
		session.setAttribute("rand", rand);
		return rMap;
	}


	@RequestMapping(value="login",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> login(HttpServletRequest request,HttpSession session) {
		Map<String,Object> map = new HashMap<>();
		Users user = new Users();
		Users users2 = null;
		String rand = null ;

		String userName = request.getParameter("userName");
		String userPass = request.getParameter("userPass");
		String mobilePhone = request.getParameter("mobilePhone");
		String code = request.getParameter("code");
		Object objCode = session.getAttribute("rand");
		if(objCode!=null){
			rand = objCode.toString();
		}else {
			map.put("msg", "点击获取验证码");
			return map;
		}
		user.setUserName(userName);
		user.setUsersPassword(userPass);
		user.setMobilePhone(mobilePhone);
		Object[] obj = null ;
		//解决 getSingleResult();返回若null异常问题
		//在getSingleResult的源码里有这样一句： @throws EntityNotFoundException if there is no result也就是说，查不到结果时，它是抛异常的，不会返回null..。
		try {
			obj = winService.getUser(user);

		} catch (Exception e) {
			e.printStackTrace();
		}
		if (obj!=null) {
			users2 = new Users(obj[0].toString(), obj[1].toString(), obj[2].toString());
		}else {
			map.put("msg", "用户名或密码错误");
			return map;
		}
		if (!code.equals(rand)) {
			map.put("msg", "验证码有误，请重新输入");
			return map;
		}else if(user.getUserName().equals(users2.getUserName())&&user.getUsersPassword().equals(users2.getUsersPassword())&&user.getMobilePhone().equals(users2.getMobilePhone())){
			map.put("username",user.getUserName() );
			map.put("code",0);
		}else {
			map.put("msg", "用户名、密码或手机号不匹配");
			return map;
		}
		return map;
	}

	@RequestMapping(value="index/{username}",method=RequestMethod.GET)
	public String index(HttpServletRequest request,@PathVariable String username) {
		request.setAttribute("username", username);
		return "index";
	}



}
