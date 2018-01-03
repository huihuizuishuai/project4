package org.qhit.dao.lzj;

import org.qhit.entity.MemberAccount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

//资金信息
public interface MemberAccountRepository extends JpaRepository<MemberAccount, Integer>,JpaSpecificationExecutor<MemberAccount> {

	//修改投资累计收益
	@Transactional
	@Modifying
	@Query(value="update member_account m set m.total_Profit=m.total_Profit+?1 where member_id=?2",nativeQuery=true)
	public void updateToatal(Float total,Integer memberId);
	
	//投资资金
		@Transactional
		@Modifying
		@Query(value="update Member_Account m set m.invest_Amount=m.invest_Amount-m.imuseale_Balance where m.member_Id=?",nativeQuery=true)
		public void updateInvestAmount(Integer memberId);

		//可用余额
		@Transactional
		@Modifying
		@Query(value="update Member_Account m set m.useable_Balance=m.useable_Balance+m.imuseale_Balance where m.member_Id=?",nativeQuery=true)
		public void updateUseAble(Integer memberId);

		//修改冻结资金
		@Transactional
		@Modifying
		@Query(value="update  Member_Account m set m.imuseale_Balance=0 where m.member_Id=?",nativeQuery=true)
		public void updateImusealeBalance(Integer memberId);
		
		//修改可用余额
		@Transactional
		@Modifying
		@Query(value="Update Member_Account m set m.useable_balance=m.useable_Balance+?1 where member_Id=?2",nativeQuery=true)
		public void updateUseable(Float useable_balance,Integer memberId);

}
