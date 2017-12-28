package org.qhit.dao.lyh;

import java.util.List;

import org.qhit.entity.FinancialPlanner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface FinancialPlannerRepository extends JpaRepository<FinancialPlanner, Integer> {
	
	@Query("from FinancialPlanner f where f.memberId = ?")
	public List<FinancialPlanner> fpList(Integer memberId);

}
