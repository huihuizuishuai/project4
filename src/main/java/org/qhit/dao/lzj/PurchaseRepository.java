package org.qhit.dao.lzj;
import org.qhit.entity.SubjectPurchaseRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface PurchaseRepository extends JpaRepository<SubjectPurchaseRecord, Integer>{
	//付息列表立即还款
	@Transactional
	@Modifying
	@Query(value="update subject_purchase_record set ispayment=1 where member_id=?",nativeQuery=true)
	public void updatesp(Integer memberId);
}
