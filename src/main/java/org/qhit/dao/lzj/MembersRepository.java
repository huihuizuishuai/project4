package org.qhit.dao.lzj;


import org.qhit.entity.Members;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

//账号信息
public interface MembersRepository extends JpaRepository<Members, Integer>,JpaSpecificationExecutor<Members>,MembersDao {
	

	

}
