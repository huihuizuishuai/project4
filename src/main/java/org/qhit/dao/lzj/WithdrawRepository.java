package org.qhit.dao.lzj;

import org.qhit.entity.MemberWithdrawRecord;
import org.springframework.data.jpa.repository.JpaRepository;

//提现记录
public interface WithdrawRepository extends JpaRepository<MemberWithdrawRecord, Integer>{

}
