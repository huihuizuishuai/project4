package org.qhit.dao.lzj;

import org.qhit.entity.MemberAccount;
import org.springframework.data.jpa.repository.JpaRepository;

//资金信息
public interface MemberAccountRepository extends JpaRepository<MemberAccount, Integer> {

}
