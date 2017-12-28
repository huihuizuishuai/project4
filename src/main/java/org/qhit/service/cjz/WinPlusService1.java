package org.qhit.service.cjz;

import java.util.List;

import org.qhit.entity.UserRole;
import org.qhit.entity.UserRoleRelation;
import org.qhit.entity.Users;
import org.springframework.data.domain.Page;

public interface WinPlusService1 {
//查询UserRole表
public List<UserRole> findAllrole();
//查询Users表
public Users findAllUsers(String name);
//Users表的添加
public void addUser(Users user);
//删除
public void deleteUsers(Users user);
//分页查询
public Page<Users> findPage(Integer page,Integer size);
public void updateUsers(Users user);
//角色添加
public void addRole(UserRole role);
//修改
public Users findOne(Integer uid);
//
//public void updateuserpwd(String pwd,Integer uid);
////后台-系统设置-账户设置-修改账号时判断密码是否纯在
//public Object validateUserpwd(String uname);
}
