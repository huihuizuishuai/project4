package org.qhit.dao.lzj;

import org.qhit.entity.MemberTradeRecord;
import org.springframework.data.jpa.repository.JpaRepository;

//钱包记录
public interface TradeRepository extends JpaRepository<MemberTradeRecord, Integer>{

}
