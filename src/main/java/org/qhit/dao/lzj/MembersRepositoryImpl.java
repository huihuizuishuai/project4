package org.qhit.dao.lzj;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.qhit.entity.FinancialPlanner;
import org.qhit.entity.MemberBankcards;
import org.qhit.entity.MemberDepositRecord;
import org.qhit.entity.Members;
import org.qhit.entity.Subject;
import org.qhit.entity.SubjectBbinPurchaseRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class MembersRepositoryImpl implements MembersDao{
	@Autowired
	MembersDao MembersDao;
	@PersistenceContext
	EntityManager entityManager;

	@Override
	public List<Members> findmembers() {
		// TODO Auto-generated method stub
		return MembersDao.findmembers();
	}
	
	/**
	 * 查询理财师审核
	 */
	@Override
	public List<Object[]> mfobj() {
		String sql="select m.member_id,m.mobile_phone,member_name,f.orgname,f.mycard,f.address,f.status,f.create_date from members m,financial_planner f where m.member_id=f.member_id";
		List<Object[]> mfobj=entityManager.createNativeQuery(sql).getResultList();
		
		return mfobj;
	}
	
	/**
	 * 模糊查询理财师审核
	 */
	@Override
	public List<Object[]> likeplanner(Members members,FinancialPlanner financialPlanner) {
		
		String sql="select m.member_id,m.mobile_phone,member_name,f.orgname,f.mycard,f.address,f.status,f.create_date from members m,financial_planner f where m.member_id=f.member_id";
			
		
			if (members.getMobilePhone()!=null&&!members.getMobilePhone().equals("")) {
				sql+=" and m.mobile_Phone like '%"+members.getMobilePhone()+"%'";
				
			}
			else if (members.getMemberName()!=null&&!members.getMemberName().equals("")) {
				sql+=" and m.member_name like '%"+members.getMemberName()+"%'";
				
			}
			else if (financialPlanner.getStatus()!=null&&!financialPlanner.getStatus().equals("")) {
				sql+=" and f.status like '%"+financialPlanner.getStatus()+"%'";
				
			}
			
			List<Object[]> likeplanner=entityManager.createNativeQuery(sql).getResultList();
		return likeplanner;
	}
	


	@Override
	public void updateId(FinancialPlanner memberid) {
		String sql="update Financial_planner set status=1 where member_id = "+memberid;
		entityManager.createNativeQuery(sql);
		
	}
	
	/**
	 * 绑卡管理
	 */
	@Override
	public List<Object[]> likebank(Members members, MemberBankcards memberBankcards) {
		String sql="select m.member_id,m.mobile_phone,m.member_name,m.member_identity,b.member_bankcards_type,b.card_no,b.cardaddress,b.delflag,b.create_date from members m,member_bankcards b where m.member_id=b.member_id";
		if (members.getMobilePhone()!=null&&!members.getMobilePhone().equals("")) {
			sql+=" and mobile_phone like'%"+members.getMobilePhone()+"%'";
			
		}
		else if (members.getMemberName()!=null&&!members.getMemberName().equals("")) {
			sql+=" and member_name like'%"+members.getMemberName()+"%'";
			
		}
		else if (memberBankcards.getCardNo()!=null&&!memberBankcards.getCardNo().equals("")) {
			sql+=" and card_no like'%"+memberBankcards.getCardNo()+"%'";
			
		}

		List<Object[]> likebank=entityManager.createNativeQuery(sql).getResultList();
		return likebank;
	}
	
	/**
	 * 体验金付息计划
	 */
	@Override
	public List<Object[]> likesb(Integer subjectid) {
		String sql="select distinct sp.member_id,sp.serial_number,m.mobile_phone,member_name,m.member_identity,sp.amount,sp.interest,sp.create_date,sp.ispayment,s.subject_name,s.period,s.year_rate from MEMBERS m,SUBJECT_BBIN_PURCHASE_RECORD sp, SUBJECT s where m.member_id in (select member_id from SUBJECT_BBIN_PURCHASE_RECORD sb where subject_id  in ("
      +" select subject_id  from  SUBJECT s where subject_id =3))";

		List<Object[]> likesb=entityManager.createNativeQuery(sql).getResultList();
		
		return likesb;
	}
	
	/**
	 * 付息列表
	 */
	@Override
	public List<Object[]> likesp(Integer subjectid, Integer memberid) {
		String sql="select distinct sp.member_id,sp.serial_number,m.mobile_phone,member_name,m.member_identity,sp.amount,sp.interest,(sp.amount+sp.interest),sp.create_date,sp.update_date,sp.ispayment,s.subject_name,s.period,s.year_rate from MEMBERS m,SUBJECT_BBIN_PURCHASE_RECORD sp, SUBJECT s where m.member_id in (select member_id from SUBJECT_BBIN_PURCHASE_RECORD sb where subject_id  in ("
      +" select subject_id  from  SUBJECT s where subject_id =3))";
		List<Object[]> likesp=entityManager.createNativeQuery(sql).getResultList();
		return likesp;
	}

	@Override
	public List<SubjectBbinPurchaseRecord> findsbb(Integer memberId) {
		String sql="select * from subject_bbin_purchase_record where member_id='"+memberId+"'";
		List<SubjectBbinPurchaseRecord> findsbb=entityManager.createNativeQuery(sql).getResultList();
		return findsbb;
	}
	
	/**
	 * 充值管理
	 */
	@Override
	public List<Object[]> findMDRPage(Integer page, Integer size, Members members, MemberDepositRecord mdr) {
		String sql="select * from (select gg.*,rownum rn from (select mdr.member_id,mdr.serial_number,m.mobile_phone,mdr.amount,mdr.status,mdr.pay_channel_name,mdr.pay_channel_order_no,mdr.create_date"
  +" from member_deposit_record mdr,members m where mdr.member_id=m.member_id )gg where 1=1 " ;
		if (mdr.getSerialNumber()!=null&&!mdr.getSerialNumber().equals("")) {
			sql+=" and serial_number like '%"+mdr.getSerialNumber()+"%'";
		}
		else if (members.getMobilePhone()!=null&&!members.getMobilePhone().equals("")) {
			sql+=" and mobile_Phone like '%"+members.getMobilePhone()+"%'";
		}
		else if (mdr.getStatus()!=null&&!mdr.getStatus().equals("")) {
			sql+=" and status like '%"+mdr.getStatus()+"%'";
		}
		else if (mdr.getPayChannelOrderNo()!=null&&!mdr.getPayChannelOrderNo().equals("")) {
			sql+=" and pay_channel_order_no like '%"+mdr.getPayChannelOrderNo()+"%'";
		}
		System.out.println(sql);
		 sql +=" and rownum<="+page*size+") where rn>"+(page-1)*size+"  " ;
		List<Object[]> pagemember = entityManager.createNativeQuery(sql).getResultList();
		return pagemember;
	}

	@Override
	public Integer getcount(MemberDepositRecord memberDepositRecord,Members members) {
		String sql="select count(*) from (select mdr.serial_number,m.mobile_phone,mdr.amount,mdr.status,mdr.pay_channel_name,mdr.pay_channel_order_no,mdr.create_date"
				+" from member_deposit_record mdr,members m where mdr.member_id=m.member_id) a where 1=1 ";
		
		if (memberDepositRecord.getSerialNumber()!=null&&!memberDepositRecord.getSerialNumber().equals("")) {
			sql+= " and a.serial_number like '%"+memberDepositRecord.getSerialNumber()+"%'";
		}
		else if (members.getMobilePhone()!=null&&!members.getMobilePhone().equals("")) {
			sql+= " and a.mobile_phone like '%"+members.getMobilePhone()+"%'";
		}
		else if (memberDepositRecord.getStatus()!=null&&!memberDepositRecord.getStatus().equals("")) {
			sql+= " and a.status like '%"+memberDepositRecord.getStatus()+"%'";
		}
		else if (memberDepositRecord.getPayChannelOrderNo()!=null&&!memberDepositRecord.getPayChannelOrderNo().equals("")) {
			sql+= " and a.pay_channel_order_no like '%"+memberDepositRecord.getPayChannelOrderNo()+"%'";
		}
		Integer count =Integer.parseInt(entityManager.createNativeQuery(sql).getSingleResult().toString()) ;
		return count;
	}



	

}
