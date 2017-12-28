package org.qhit.dao.xly;

import org.qhit.entity.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

public interface SubjectRepository extends JpaRepository<Subject, Integer>,JpaSpecificationExecutor<Subject> {
	
	@Query("From Subject s where s.subjectId = ?")
	public Subject getSubject(Integer subjectId);

}
