package org.qhit.dao.lyh;

import java.util.List;

import org.qhit.entity.MemberBankcards;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberBankcardsRepository extends JpaRepository<MemberBankcards, Integer> {
	
	@Query("select m from MemberBankcards m where cardNo=?")
	public List<MemberBankcards> findBycardNo(String cardNo);
	
	@Query("from MemberBankcards where memberId=?")
	public List<MemberBankcards> findMemberBankcards(Integer memberId);

}
