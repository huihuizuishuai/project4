package org.qhit.dao.lyh;

import java.util.List;

import org.qhit.entity.MemberAccount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

public interface MembersAccountRepository extends JpaRepository<MemberAccount,Integer>,JpaSpecificationExecutor<MemberAccount> {
	
	
	@Query("select m from MemberAccount m where memberId=?")
	public List<MemberAccount> getMemberByuserId(Integer memberId);
}
