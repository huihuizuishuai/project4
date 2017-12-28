package org.qhit.dao.lzj;

import org.qhit.entity.MemberBankcards;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface BankcardsRepository extends JpaRepository<MemberBankcards, Integer>{
	//解绑银行卡
	@Transactional
	@Modifying
	@Query(value="update member_bankcards set delflag=2 where member_id=?",nativeQuery=true)
	public void updatecard(Integer memberId);

}
