package org.qhit.dao.cjz;

import java.util.List;

import org.qhit.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface UsersRepository1 extends JpaRepository<Users, Integer>,JpaSpecificationExecutor<Users>{
	@Modifying
	@Query(value="update Users u set u.usersPassword=?1 where u.usersId=?2",nativeQuery=true)
	public void updatepassword(String pwd,Integer uid);
	
	@Query("select us from Users us where us.userName=?")
	public Users findUsers(String username);
}