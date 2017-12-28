package org.qhit.dao.lyh;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.qhit.entity.FinanceProductSubscribe;
import org.qhit.entity.MemberProfitRecord;
import org.qhit.entity.Subject;
import org.qhit.entity.SubjectPurchaseRecord;
import org.qhit.entity.Users;

public class UsersRepositoryImpl implements UsersDao {

	@PersistenceContext
	EntityManager entityManager;


	@Override
	public Object[] getUser(Users users) {
		String sql = "select USER_NAME,USERS_PASSWORD,MOBILE_PHONE from Users where USER_NAME = '"+users.getUserName()+"'";
		Object[] obj = (Object[]) entityManager.createNativeQuery(sql).getSingleResult();
		if (obj.length>0) {
			return obj;
		}else {
			return null;
		}
	}

	public Object[] getUser2(Users users) {
		String sql = "select USERS_ID,USER_NAME,USERS_PASSWORD,STATUS from Users where MOBILE_PHONE = '"+users.getMobilePhone()+"'";
		Object[] obj = (Object[]) entityManager.createNativeQuery(sql).getSingleResult();
		if (obj.length>0) {
			return obj;
		}else {
			return null;
		}
	}
	//SELECT * FROM (SELECT e.*, ROWNUM rn FROM (select * from FinanceProductSubscribe fps where fps.memberId='"+memberId+"') e WHERE ROWNUM <= "+rows*page+") WHERE rn >"+(page-1)*rows+"
	public List<Object[]> sprObj(Integer memberId,Integer page,Integer rows) {
		String sql = "SELECT * FROM (SELECT e.*, ROWNUM rn FROM (select spr.serial_number,s.subject_name,spr.amount,spr.interest,spr.ispayment,spr.create_date from subject_purchase_record spr,subject s where spr.subject_id=s.subject_id and spr.member_id='"+memberId+"' order by spr.create_date desc) e WHERE ROWNUM <= "+rows*page+") WHERE rn >"+(page-1)*rows+"";
		Query query = entityManager.createNativeQuery(sql);
		List<Object[]> sprObj = query.getResultList();
		return sprObj;
	}
	@Override
	public List<Subject> subjects(Integer subjectId,Integer subType,Integer yearRate,Integer period,Integer status) {
		String hql ="select s from Subject s where 1=1 ";
		if (subjectId!=null) {
			hql += " and s.subjectId='"+subjectId+"'";
		}
		if (subType!=null&&subType!=0) {
			hql += " and s.subjectType='"+subType+"'";
		}
		if (yearRate!=null&&yearRate!=0) {
			if (yearRate==1) {
				hql += " and s.yearRate=6.0";
			}
			if (yearRate==2) {
				hql += " and s.yearRate=6.5";
			}
			if (yearRate==3) {
				hql += " and s.yearRate=7.0";
			}
			if (yearRate==4) {
				hql += " and s.yearRate>7.0";	
			}
		}
		if (period!=null&&period!=0) {
			if (period==1) {
				hql += " and s.period<15";
			}
			if (period==2) {
				hql += " and s.period>=15 and s.period<30";
			}
			if (period==3) {
				hql += " and s.period>=30 and s.period<180";
			}
			if (period==4) {
				hql += " and s.period>=180 and s.period<365";
			}
			if (period==5) {
				hql += " and s.period>=365";
			}
		}
		if (status!=null&&status!=0) {
			if (status==1) {
				hql += " and s.status=1";
			}
			if (status==2) {
				hql += " and s.status=2";
			}
			if (status==3) {
				hql += " and s.status=3";
			}
		}
		List<Subject> subjects = entityManager.createQuery(hql).getResultList();
		return subjects;
	}

	@Override
	public Integer sprCount(Integer memberId) {
		String sql = "select count(*) from (select spr.serial_number,s.subject_name,spr.amount,spr.interest,spr.ispayment,spr.create_date from subject_purchase_record spr,subject s where spr.subject_id=s.subject_id and spr.member_id='"+memberId+"')a";
		String sprCount = entityManager.createNativeQuery(sql).getResultList().get(0).toString();
		return Integer.parseInt(sprCount);
	}

	@Override
	public List<Object[]> fpsList(Integer memberId,Integer page,Integer rows) {
		String sql = "SELECT * FROM (SELECT e.*, ROWNUM rn FROM (select * from finance_product_subscribe  fps where fps.member_id='"+memberId+"') e WHERE ROWNUM <= "+rows*page+") WHERE rn >"+(page-1)*rows+"";
		Query query = entityManager.createNativeQuery(sql);
		List<Object[]> fpsobj = query.getResultList();
		return fpsobj;
	}

	@Override
	public List<Object[]> mprList(Integer memberId, Integer page, Integer rows) {
		String sql = "SELECT * FROM (SELECT e.*, ROWNUM rn FROM (select * from member_profit_record where member_id='"+memberId+"') e WHERE ROWNUM <= "+rows*page+") WHERE rn >"+(page-1)*rows+"";
		Query query = entityManager.createNativeQuery(sql);
		List<Object[]> sprObj = query.getResultList();
		return sprObj;
	}

	@Override
	public Integer mprCount(Integer memberId) {
		String sql = "select count(*) from (select * from member_profit_record where member_id='"+memberId+"')a";
		String mprCount = entityManager.createNativeQuery(sql).getResultList().get(0).toString();
		return Integer.parseInt(mprCount);
	}

	@Override
	public Integer fpsCount(Integer memberId) {
		String sql = "select count(*) from (select * from finance_product_subscribe where member_id = "+memberId+")";
		String fpsCount = entityManager.createNativeQuery(sql).getResultList().get(0).toString();
		return Integer.parseInt(fpsCount);
	}

	@Override
	public List<Object[]> mdrObj(Integer memberId, Integer page, Integer rows) {
		String sql = "SELECT * FROM (SELECT e.*, ROWNUM rn FROM (select * from member_deposit_record where member_id='"+memberId+"' order by create_date desc) e WHERE ROWNUM <= "+rows*page+") WHERE rn >"+(page-1)*rows+"";
		Query query = entityManager.createNativeQuery(sql);
		List<Object[]> mdrObj = query.getResultList();
		return mdrObj;
	}

	@Override
	public Integer mdrCount(Integer memberId) {
		String sql = "select count(*) from (select * from member_deposit_record where member_id='"+memberId+"')";
		String mdrCount = entityManager.createNativeQuery(sql).getResultList().get(0).toString();
		return Integer.parseInt(mdrCount);
	}

	@Override//
	public List<Object[]> mwrObj(Integer memberId, Integer page, Integer rows) {
		String sql = "SELECT * FROM (SELECT e.*, ROWNUM rn FROM (select * from member_withdraw_record where member_id = '"+memberId+"' order by create_date desc) e WHERE ROWNUM <= "+rows*page+") WHERE rn >"+(page-1)*rows+"";
		Query query = entityManager.createNativeQuery(sql);
		List<Object[]> mwrObj = query.getResultList();
		return mwrObj;
	}

	@Override
	public Integer mwrCount(Integer memberId) {
		String sql = "select count(*) from (select * from member_withdraw_record where member_id = '"+memberId+"')";
		String mwrCount = entityManager.createNativeQuery(sql).getResultList().get(0).toString();
		return Integer.parseInt(mwrCount);
	}

	@Override
	public List<Object[]> tyjObj(Integer memberId) {
		String sql = "select distinct ma.bbin_amount,s.subject_name,sbpr.amount,s.refund_way,s.start_date,s.end_date,s.status,s.period,s.year_rate,ma.total_profit from member_account ma left join subject_bbin_purchase_record sbpr on ma.member_id=sbpr.member_id left join subject s on ma.member_id=s.borrowerid where ma.member_id='"+memberId+"'";
		List<Object[]> tyjObj = entityManager.createNativeQuery(sql).getResultList();
		return tyjObj;
	}

}
