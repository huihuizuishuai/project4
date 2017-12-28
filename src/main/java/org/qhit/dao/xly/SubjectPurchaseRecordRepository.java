package org.qhit.dao.xly;

import org.qhit.entity.SubjectBbinPurchaseRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface SubjectPurchaseRecordRepository extends JpaRepository<SubjectBbinPurchaseRecord, Integer>,JpaSpecificationExecutor<SubjectBbinPurchaseRecord>{

}
