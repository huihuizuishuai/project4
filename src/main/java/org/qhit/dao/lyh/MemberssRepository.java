package org.qhit.dao.lyh;

import java.util.List;

import org.qhit.entity.Members;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberssRepository extends JpaRepository<Members, Integer> {
	
	@Query("select m from Members m where memberIdentity=?")
	public List<Members> findByMemberIdentity(String memberIdentity);
	
	@Query("select m from Members m where memberId=?")
	public List<Members> findByMemberId(Integer memberId);
	
	@Query("select m from Members m where m.mobilePhone=?1 and m.passwords=?2")
	public List<Members> findByMembers(String phone,String password);
	
	@Query("select m from Members m where m.mobilePhone=?")
	public List<Members> findBymobilePhone(String phone);
	

}
