package org.qhit.dao.lzj;

import org.qhit.entity.SubjectPurchaseRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface SubjectPurchaseRepository extends JpaRepository<SubjectPurchaseRecord, Integer>,JpaSpecificationExecutor<SubjectPurchaseRecord>{
	
	@Transactional
	@Modifying
	@Query(value="update subject_purchase_record set delflag=2 where serial_number=?",nativeQuery=true)
	public void updates1(String serialNumber);
	
	@Transactional
	@Modifying
	@Query(value="update subject_purchase_record set delflag=1 where serial_number=?",nativeQuery=true)
	public void updates2(String serialNumber);
	
	@Transactional
	@Modifying
	@Query(value="update subject_purchase_record set delflag=4 where serial_number=?",nativeQuery=true)
	public void updates3(String serialNumber);
}
