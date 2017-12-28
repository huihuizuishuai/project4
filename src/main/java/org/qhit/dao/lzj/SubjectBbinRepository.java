package org.qhit.dao.lzj;

import org.qhit.entity.SubjectBbinPurchaseRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface SubjectBbinRepository extends JpaRepository<SubjectBbinPurchaseRecord, Integer>{
	@Transactional
	@Modifying
	@Query(value="update subject_bbin_purchase_record set ispayment=1 where member_id=?",nativeQuery=true)
	public void updatesb(Integer memberId);
}
