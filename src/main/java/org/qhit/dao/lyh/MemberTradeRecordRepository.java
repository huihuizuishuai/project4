package org.qhit.dao.lyh;

import java.util.List;

import org.qhit.entity.MemberTradeRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberTradeRecordRepository extends JpaRepository<MemberTradeRecord, Integer> {
	
	@Query("from MemberTradeRecord m where m.memberId =?1 and m.fundFlow=?2 ")
	public List<MemberTradeRecord> memberTradeRecords(Integer memberId,Integer fundFlow);

}
