package org.qhit.dao.xly;

import org.qhit.entity.Members;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface MemberRepository extends JpaRepository<Members, Integer>,JpaSpecificationExecutor<Members>{

}
