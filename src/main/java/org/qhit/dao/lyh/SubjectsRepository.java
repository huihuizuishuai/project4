package org.qhit.dao.lyh;

import java.util.List;

import org.qhit.entity.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SubjectsRepository extends JpaRepository<Subject, Integer> {
	
	@Query("from Subject where subjectId = ?")
	public List<Subject> subjects(Integer subjectId);

}
