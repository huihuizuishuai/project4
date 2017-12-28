package org.qhit.service.lyh;

import java.util.List;

import org.qhit.dao.lyh.MembersAccountRepository;
import org.qhit.dao.lyh.UsersRepository;
import org.qhit.entity.FinanceProductSubscribe;
import org.qhit.entity.MemberAccount;
import org.qhit.entity.MemberProfitRecord;
import org.qhit.entity.Subject;
import org.qhit.entity.SubjectPurchaseRecord;
import org.qhit.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class WinPlusServiceImpl implements WinPlusService {
	
	@Autowired
	UsersRepository usersRepository;
	
	@Autowired
	MembersAccountRepository memberAccountRepository;

	@Override
	public Object[] getUser(Users users){
		return usersRepository.getUser(users);
	}
	public Object[] getUser2(Users users){
		return usersRepository.getUser2(users);
	}
	@Override
	public List<Object[]> sprObj(Integer memberId,Integer page,Integer rows) {
		return usersRepository.sprObj(memberId,page,rows);
	}
	@Override
	public List<Subject> subjects(Integer subjectId,Integer subType,Integer yearRate,Integer period,Integer status) {
		return usersRepository.subjects(subjectId, subType, yearRate, period, status);
	}
	@Override
	public Integer sprCount(Integer memberId) {
		return usersRepository.sprCount(memberId);
	}
	@Override
	public List<Object[]> fpsList(Integer memberId,Integer page,Integer rows) {///, Integer page, Integer rows
		return usersRepository.fpsList(memberId,page,rows);
	}
	@Override
	public Integer fpsCount(Integer memberId) {
		return usersRepository.fpsCount(memberId);
	}
	@Override
	public List<Object[]> mprList(Integer memberId, Integer page, Integer rows) {
		return usersRepository.mprList(memberId, page, rows);
	}
	@Override
	public Integer mprCount(Integer memberId) {
		return usersRepository.mprCount(memberId);
	}
	@Override
	public List<Object[]> mdrObj(Integer memberId, Integer page, Integer rows) {
		return usersRepository.mdrObj(memberId, page, rows);
	}
	@Override
	public Integer mdrCount(Integer memberId) {
		return usersRepository.mdrCount(memberId);
	}
	@Override
	public List<Object[]> mwrObj(Integer memberId, Integer page, Integer rows) {
		return usersRepository.mwrObj(memberId, page, rows);
	}
	@Override
	public Integer mwrCount(Integer memberId) {
		return usersRepository.mwrCount(memberId);
	}
	@Override
	public List<Object[]> tyjObj(Integer memberId) {
		return usersRepository.tyjObj(memberId);
	}

}
