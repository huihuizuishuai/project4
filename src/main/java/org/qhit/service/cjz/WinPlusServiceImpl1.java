package org.qhit.service.cjz;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.qhit.dao.cjz.UsersRepository1;
import org.qhit.dao.cjz.UsersRoleRepository;
import org.qhit.entity.UserRole;
import org.qhit.entity.UserRoleRelation;
import org.qhit.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class WinPlusServiceImpl1 implements WinPlusService1 {
	
	@Autowired
	UsersRepository1 usersRepository1;
	@Autowired
	UsersRoleRepository usersRoleRepository;
//	@Autowired
//	UsersDao usersdao;
	@Override
	public List<UserRole> findAllrole() {
		return usersRoleRepository.findAll();
	}

	@Override
	@Transactional
	public void addUser(Users user) {
		usersRepository1.save(user);
	}

	@Override
	public Page<Users> findPage(Integer page, Integer size) {
		Pageable pageable = new PageRequest(page-1, size);
		return usersRepository1.findAll(pageable);
	}

	@Override
	public void deleteUsers(Users user) {
		usersRepository1.delete(user);
	}
	@Override
	public void updateUsers(Users user) {
		usersRepository1.save(user);
	}

	@Override
	public void addRole(UserRole role) {
		usersRoleRepository.save(role);	
	}

	@Override
	public	Users findAllUsers(String name) {
		return usersRepository1.findUsers(name);
	}
	@Override
	public Users findOne(Integer id) {
		return usersRepository1.findOne(id);
	}

//	@Override
//	@Transactional
//	public void updateuserpwd(String pwd,Integer uid) {
//		usersRepository1.updatepassword(pwd,uid);
//		
//	}
//	//后台-系统设置-密码设置-修改密码时判断密码是否存在
//	@Override
//	public Object validateUserpwd(String uname) {		
//		return usersdao.selectpassword(uname);
//	}


}
