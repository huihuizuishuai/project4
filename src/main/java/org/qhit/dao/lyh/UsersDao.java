package org.qhit.dao.lyh;

import java.util.List;

import org.qhit.entity.FinanceProductSubscribe;
import org.qhit.entity.MemberProfitRecord;
import org.qhit.entity.Subject;
import org.qhit.entity.Users;

public interface UsersDao {
	public Object[] getUser(Users users);
	public Object[] getUser2(Users users);
	/**
	 * 标的购买（投资记录）
	 */
	public List<Object[]> sprObj(Integer memberId,Integer page,Integer rows);
	public List<Object[]> mprList(Integer memberId,Integer page,Integer rows);
	public List<Object[]> fpsList(Integer memberId,Integer page,Integer rows);//,Integer page,Integer rows
	public List<Object[]> mdrObj(Integer memberId,Integer page,Integer rows);//,Integer page,Integer rows
	public List<Object[]> mwrObj(Integer memberId,Integer page,Integer rows);//,Integer page,Integer rows
	public List<Object[]> tyjObj(Integer memberId);//,Integer page,Integer rows体验金
	
	public List<Subject> subjects(Integer subjectId,Integer subType,Integer yearRate,Integer period,Integer status);
	
	public Integer sprCount(Integer memberId);
	public Integer mprCount(Integer memberId);
	public Integer fpsCount(Integer memberId);
	public Integer mdrCount(Integer memberId);
	public Integer mwrCount(Integer memberId);
	

}
