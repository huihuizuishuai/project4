package org.qhit.dao.xly;

import org.qhit.entity.OverseaConfig;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface OverseaConfigRepository extends JpaRepository<OverseaConfig, Integer>,JpaSpecificationExecutor<OverseaConfig>{

}
