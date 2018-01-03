package org.qhit.dao.lzj;
import java.util.List;

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

	//到期时间
	@Transactional
	@Modifying
	@Query(value="update  subject_purchase_record t  set t.status='1' where t.create_date+t.pay_interest_times<sysdate and t.status='0'",nativeQuery=true)
	public void updatesubject_purchase_record();

	//
	public SubjectPurchaseRecord findSubjectPurchaseRecordBysprId(Integer sprId);

	//
	@Transactional
	@Modifying
	@Query(value="update SubjectPurchaseRecord s set s.interest=?1 where s.sprId=?2")
	public  void  UpdateInterestById(Float interest,Integer sprId);

	//
	@Transactional
	@Modifying
	@Query("update SubjectPurchaseRecord s set s.status=4 where s.sprId=?1")
	public void  updateStatus(Integer sprId); 

	

}
