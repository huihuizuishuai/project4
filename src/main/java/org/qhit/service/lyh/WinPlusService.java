package org.qhit.service.lyh;

import java.util.List;

import org.qhit.entity.FinanceProductSubscribe;
import org.qhit.entity.MemberAccount;
import org.qhit.entity.MemberProfitRecord;
import org.qhit.entity.Subject;
import org.qhit.entity.SubjectPurchaseRecord;
import org.qhit.entity.Users;

public interface WinPlusService {
	
	public Object[] getUser(Users users);
	public Object[] getUser2(Users users);
	
	
	public List<Object[]> sprObj(Integer memberId,Integer page,Integer rows);
	public List<Object[]> mprList(Integer memberId,Integer page,Integer rows);
	public List<Subject> subjects(Integer subjectId,Integer subType,Integer yearRate,Integer period,Integer status);
	public Integer sprCount(Integer memberId);
	public Integer fpsCount(Integer memberId);
	public List<Object[]> fpsList(Integer memberId,Integer page,Integer rows);//,Integer page,Integer rows
	public Integer mprCount(Integer memberId);
	public List<Object[]> mdrObj(Integer memberId,Integer page,Integer rows);
	public Integer mdrCount(Integer memberId);
	public List<Object[]> mwrObj(Integer memberId,Integer page,Integer rows);//,Integer page,Integer rows
	public Integer mwrCount(Integer memberId);
	public List<Object[]> tyjObj(Integer memberId);//,Integer page,Integer rows体验金
}
