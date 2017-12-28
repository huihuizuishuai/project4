package org.qhit.dao.lzj;

import org.qhit.entity.MemberDepositRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

//充值记录
public interface DepositRepository extends JpaRepository<MemberDepositRecord, Integer>{
	
	@Transactional
	@Modifying
	@Query(value="update member_deposit_record set status=1 where serial_number=?",nativeQuery=true)
	public void recharge(String serialNumber);

}
