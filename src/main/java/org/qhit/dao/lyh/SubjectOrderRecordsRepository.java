package org.qhit.dao.lyh;

import java.util.List;

import org.qhit.entity.SubjectOrderRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SubjectOrderRecordsRepository extends JpaRepository<SubjectOrderRecord, Integer>{

	@Query("from SubjectOrderRecord where serialNumber = ?")
	public List<SubjectOrderRecord> sorlist(String serialNumber);
}
