package org.qhit.dao.lzj;

import org.qhit.entity.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface Subject1Repository extends JpaRepository<Subject, Integer>,JpaSpecificationExecutor<Subject>{

}
