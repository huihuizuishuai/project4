package org.qhit.dao.lzj;

import org.qhit.entity.FinancialPlanner;
import org.springframework.data.jpa.repository.JpaRepository;
//理财师信息
public interface PlannerRepository extends JpaRepository<FinancialPlanner, Integer>{
	
	
	
}
