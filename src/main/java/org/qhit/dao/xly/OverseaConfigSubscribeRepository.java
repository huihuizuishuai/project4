package org.qhit.dao.xly;

import org.qhit.entity.OverseaConfigSubscribe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface OverseaConfigSubscribeRepository extends JpaRepository<OverseaConfigSubscribe, Integer>,JpaSpecificationExecutor<OverseaConfigSubscribe>{

}
