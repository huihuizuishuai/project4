package org.qhit.dao.lyh;

import java.util.List;

import org.qhit.entity.MemberDepositRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberDepositRecordRepository extends JpaRepository<MemberDepositRecord, Integer>{
	
	@Query("from MemberDepositRecord m where m.memberId = ?")
	public List<MemberDepositRecord> mdrList(Integer memberId);
	
	@Query("from MemberDepositRecord m where m.serialNumber = ?")
	public List<MemberDepositRecord> mdrListByserialNumber(String serialNumber);

}
