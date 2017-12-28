package org.qhit.dao.lyh;

import org.qhit.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

public interface UsersRepository extends JpaRepository<Users, Integer>,UsersDao,JpaSpecificationExecutor<Users> {

	@Query("select u from Users u where userName=?")
	public Users getUserByuserName(String username);
	
	@Query("select u from Users u where mobilePhone=?")
	public Users getUsersByMobilePhone(String mobilePhone);

	public Integer mprCount(Integer memberId);
	

}
