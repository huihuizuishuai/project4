package org.qhit.controller.cjz;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.qhit.dao.cjz.UsersRepository1;
import org.qhit.entity.UserRole;
import org.qhit.entity.Users;
import org.qhit.service.cjz.WinPlusService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("CJZ")
public class WinplusHandler1 {
	@Autowired
	WinPlusService1 winservice;
	@Autowired
	UsersRepository1 usersRepository1;
	//添加
	@RequestMapping("addAccount")
	public String addAccount(Map<String, Object> map) {
		List<UserRole> rlist=winservice.findAllrole();
		map.put("rlist", rlist);
		return "admin/system/add_account";
	}
	@RequestMapping("addUser")
	public String addUser(Users user) {
		user.setCreateDate(new Date());
		winservice.addUser(user);
		return "redirect:userlist";
	}
	//分页查询
	@RequestMapping("userlist")
	public String userlist(Map<String, Object> map,Integer page) {
		if (page==null) {
			page=1;
		}
		Integer size=2;
		//当前页数：userspage.getNumber()
		//总页数：userspage.getTotalPages()
		//当前页的结果集：userspage.getContent()
		Page pagename=winservice.findPage(page, size);
		map.put("pagename", pagename);
		return "admin/system/userlist";
	}
	//删除Users
	@RequestMapping(value="deleteUser",method=RequestMethod.DELETE)
	public String delete(Users user){
		winservice.deleteUsers(user);
		return "redirect:userlist";
	}
	//修改
	@RequestMapping("toupdateUser/{usersId}")
	public String toupdate(@PathVariable Integer usersId,Map<String, Object> map){
		Users user=winservice.findOne(usersId);
		List<UserRole> rlist=winservice.findAllrole();
		map.put("rlist", rlist);
		map.put("ulist", user);
		return "admin/system/edit_account";
	}
	@RequestMapping("updateUser")
	public String update(Users user){
		user.setUpdateDate(new Date());
		winservice.updateUsers(user);
		System.out.println(user);
		return "redirect:userlist";
	}
	//UserROle
	@RequestMapping("rolelist")
	public String rolelist(Map<String, Object> map) {
		List<UserRole> rlist=winservice.findAllrole();
		map.put("rlist", rlist);
		return "admin/system/role_list";
	}
	@RequestMapping("addrole")
	public String addrole(UserRole userrole) {
		userrole.setCreateDate(new Date());
		winservice.addRole(userrole);
		return "redirect:rolelist";
	}
//	@RequestMapping("checkUserExsit")
//	public @ResponseBody Object findUserCount(String username){
//		Integer counts=usersRepository1.getUserName(username);
//		Map map = new HashMap();
//		if (counts>=1) {
//			map.put("valid", false);
//		}else{
//			map.put("valid", true);
//		}
//		return map;
//		
//	}
	
	@RequestMapping("permission")
	public String permission(Map<String, Object> map) {
		return "admin/system/permission";
	}
	
	
	
	@RequestMapping("roleadd")
	public String roleadd(Map<String, Object> map) {
		return "admin/system/role_add";
	}
	//修改密码前
	@RequestMapping(value="passwd/{username}",method=RequestMethod.GET)
	public String index(HttpServletRequest request,@PathVariable String username,Map<String, Object> map) {
		Users userss=winservice.findAllUsers(username);
		map.put("findUser", userss);
		return "admin/system/update_passwd";
	}
//	//后台-系统设置-密码设置-确认修改密码
//	@RequestMapping(value="savePasswd")
//	public String updatePasswdPage(Users user,String oldpassword,Map<String, Object> map) {
//		Users userss=winservice.findAllUsers(user.getUserName());
//		if (userss.getUsersPassword().equals(oldpassword)) {
//			winservice.updateuserpwd(userss.getUsersPassword(),userss.getUsersId());		
//		}		
//		return "redirect:Admin/login";
//
//	}

//修改密码验证输入密码是否与原密码一样	
	@RequestMapping("checkPasswordExsit")
	@ResponseBody
	public Map<String,Object> validatepassword(String oldpassword,String userName){
		Map<String,Object> map = new HashMap<>();
		Users userss=winservice.findAllUsers(userName);
		if (!oldpassword.equals(userss.getUsersPassword())) {
			map.put("msg", "原密码输入错误");
			map.put("code",0);
		}else if(oldpassword.equals(userss.getUsersPassword())){
			map.put("msg", "原密码输入正确");
			map.put("code",1);
		}	
		return map;		
	}
	@InitBinder  
	public void initBinder(WebDataBinder binder) {  
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    dateFormat.setLenient(false);  
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  
	}
}
