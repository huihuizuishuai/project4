package org.qhit.dao.xly;

import java.util.List;

import org.qhit.entity.SysParam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SysParamRepository extends JpaRepository<SysParam, Integer>{
	@Query("select t from SysParam t where t.pcode = ?")
	public List<SysParam> findSysparamList(String pcode);
	@Query(value="select pname from SysParam where pcode=?1 and pvalue=?2",nativeQuery=true)
	public String getName(String string, String type);
}
