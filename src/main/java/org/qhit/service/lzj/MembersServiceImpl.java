package org.qhit.service.lzj;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.qhit.dao.lzj.BankcardsRepository;
import org.qhit.dao.lzj.DepositRepository;
import org.qhit.dao.lzj.MemberAccountRepository;
import org.qhit.dao.lzj.MembersRepository;
import org.qhit.dao.lzj.PlannerRepository;
import org.qhit.dao.lzj.PurchaseRepository;
import org.qhit.dao.lzj.Subject1Repository;
import org.qhit.dao.lzj.SubjectBbinRepository;
import org.qhit.dao.lzj.SubjectPurchaseRepository;
import org.qhit.dao.lzj.TradeRepository;
import org.qhit.dao.lzj.WithdrawRepository;
import org.qhit.entity.FinancialPlanner;
import org.qhit.entity.MemberAccount;
import org.qhit.entity.MemberBankcards;
import org.qhit.entity.MemberDepositRecord;
import org.qhit.entity.MemberTradeRecord;
import org.qhit.entity.MemberWithdrawRecord;
import org.qhit.entity.Members;
import org.qhit.entity.Subject;
import org.qhit.entity.SubjectBbinPurchaseRecord;
import org.qhit.entity.SubjectPurchaseRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;


@Service
public class MembersServiceImpl implements MembersService{
	@Autowired
	MembersRepository membersRepository;
	@Autowired
	MemberAccountRepository memberAccountRepository;
	@Autowired
	PlannerRepository plannerRepository ;
	@Autowired
	WithdrawRepository withdrawRepository;
	@Autowired
	DepositRepository depositRepository;
	@Autowired
	TradeRepository tradeRepository;
	@Autowired
	BankcardsRepository bankcardsRepositor;
	@Autowired
	Subject1Repository subjectRepository;
	@Autowired
	SubjectBbinRepository subjectBbinRepository;
	@Autowired
	PurchaseRepository purchaseRepository;
	@Autowired
	SubjectPurchaseRepository subjectPurchaseRepository;

	
	/***
	 * 分页模糊查询账号管理
	 */
	@Override
	public Page<Members> members(Integer page, Integer size,final Members members) {
		Pageable pageable=new PageRequest(page-1, size);
		Specification<Members> specification=new Specification<Members>() {

			@Override
			public Predicate toPredicate(Root<Members> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				List<Predicate> plist=new ArrayList<>();
				if (members!=null) {
					if (members.getMemberName()!=null&&!members.getMemberName().equals("")) {
						Path memberNamepath=root.get("memberName");
						plist.add(builder.like(memberNamepath, "%"+members.getMemberName()+"%"));

					}else if (members.getMobilePhone()!=null&&!members.getMobilePhone().equals("")) {
						Path mobilePhonepath=root.get("mobilePhone");
						plist.add(builder.like(mobilePhonepath, "%"+members.getMobilePhone()+"%"));

					}else if (members.getNames()!=null&&!members.getNames().equals("")) {
						Path namespath=root.get("names");
						plist.add(builder.like(namespath, "%"+members.getNames()+"%"));

					}else if (members.getCreateDate()!=null&&!members.getCreateDate().equals("")) {
						Path createDatepath=root.get("createDate");
						plist.add(builder.like(createDatepath, "%"+members.getCreateDate()+"%"));

					}
				}

				return builder.and(plist.toArray(new Predicate[plist.size()]));
			}
		};

		return membersRepository.findAll(specification,pageable);
	}
	
	/**
	 * 查询账号详情：账号信息
	 */
	@Override
	public Members findmembers(Integer memberId) {

		return  membersRepository.findOne(memberId);
	}
	
	/**
	 * 查询账号详情：资金信息
	 */
	@Override
	public MemberAccount findMemberAccount(Integer memberId) {
		
		return memberAccountRepository.findOne(memberId);
	}
	
	/**
	 * 查询账号详情：理财师信息
	 */
	@Override
	public FinancialPlanner findplanner(Integer memberId) {
		// TODO Auto-generated method stub
		return plannerRepository.findOne(memberId);
	}
	
	/**
	 * 查询账号详情：提现记录
	 */
	@Override
	public MemberWithdrawRecord findwithdraw(Integer memberId) {
		
		return withdrawRepository.findOne(memberId);
	}
	
	/**
	 * 查询账号详情：充值记录
	 */
	@Override
	public MemberDepositRecord finddeposit(Integer memberId) {
		
		return depositRepository.findOne(memberId);
	}
	
	/**
	 * 询账号详情：钱包记录
	 */
	@Override
	public MemberTradeRecord findtrade(Integer memberId) {
		
		return tradeRepository.findOne(memberId);
	}
	
	
	/**
	 * 查询理财师全部信息
	 */
	@Override
	public List<Object[]> mfobj() {
		
		return membersRepository.mfobj();
	}
	
	/**
	 * 模糊查询理财师全部信息
	 */
	@Override
	public List<Object[]> likeplanner(Members members,FinancialPlanner financialPlanner) {
		
		return membersRepository.likeplanner(members, financialPlanner);
	}
	
	
	//认证审核
	@Override
	public void updateId(FinancialPlanner memberid) {
		plannerRepository.save(memberid);
		
	}
	
	/**
	 * 绑卡管理
	 */
	@Override
	public List<Object[]> likebank(Members members, MemberBankcards memberBankcards) {
		
		return membersRepository.likebank(members, memberBankcards);
	}

	

	/**
	 * 付息计划
	 */
	@Override
	public Page<Subject> findsubject(Integer page, Integer size, Subject subject) {
		Pageable pageable=new PageRequest(page-1, size);
		Specification<Subject> specification=new Specification<Subject>() {

			@Override
			public Predicate toPredicate(Root<Subject> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				List<Predicate> plist=new ArrayList<>();
				if (subject!=null) {
					if (subject.getSubjectName()!=null&&!subject.getSubjectName().equals("")) {
						Path subjectNamepath=root.get("subjectName");
						plist.add(builder.like(subjectNamepath, "%"+subject.getSubjectName()+"%"));
					}
					else if (subject.getStatus()!=null&&!subject.getStatus().equals("")) {
						Path statuspath=root.get("status");
						plist.add(builder.like(statuspath, "%"+subject.getStatus()+"%"));
						
					}
					else if (subject.getSubjectType()!=null&&!subject.getSubjectType().equals("")) {
						Path subjectTypepath=root.get("subjectType");
						plist.add(builder.like(subjectTypepath, "%"+subject.getSubjectType()+"%"));
						
					}
					
				}
				
				return builder.and(plist.toArray(new Predicate[plist.size()]));
			}
		};
		
		return subjectRepository.findAll(specification,pageable);
				
	}
	
	/**
	 * 体验金付息计划
	 */
	@Override
	public List<Object[]> likesb(Integer subjectid) {
		
		return membersRepository.likesb(subjectid);
	}
	
	/**
	 * 根据id查询投资表
	 */


	
	/**
	 * 付息列表
	 */
	@Override
	public List<Object[]> likesp(Integer subjectid, Integer memberid) {
		
		return membersRepository.likesp(subjectid, memberid);
	}
	



	@Override
	public List<Object[]> findMDRPage(Integer page, Integer size, Members members, MemberDepositRecord mdr) {
		return membersRepository.findMDRPage(page, size, members, mdr);
	}

	@Override
	public Integer getcount(MemberDepositRecord memberDepositRecord,Members members) {
		
		return membersRepository.getcount(memberDepositRecord,members );
	}
	
	/**
	 * 提现管理
	 */
	@Override
	public Page<SubjectPurchaseRecord> findspr(Integer page, Integer size, SubjectPurchaseRecord spRecord) {
		Pageable pageable=new PageRequest(page-1, size);
		Specification<SubjectPurchaseRecord> specification=new Specification<SubjectPurchaseRecord>() {

			@Override
			public Predicate toPredicate(Root<SubjectPurchaseRecord> root, CriteriaQuery<?> query,
					CriteriaBuilder builder) {
				List<Predicate> plist=new ArrayList<>();
				if (spRecord!=null) {
					if (spRecord.getSerialNumber()!=null&&!spRecord.getSerialNumber().equals("")) {
						Path serialpath=root.get("serialNumber");
						plist.add(builder.like(serialpath, "%"+spRecord.getSerialNumber()+"%"));
					}
					else if (spRecord.getStatus()!=null&&!spRecord.getStatus().equals("")) {
						Path statuspath=root.get("status");
						plist.add(builder.like(statuspath, "%"+spRecord.getStatus()+"%"));
					}
					else if (spRecord.getIspayment()!=null&&!spRecord.getIspayment().equals("")) {
						Path ispaymentpath=root.get("ispayment");
						plist.add(builder.like(ispaymentpath, "%"+spRecord.getIspayment()+"%"));
					}
					
				}
				
				return builder.and(plist.toArray(new Predicate[plist.size()]));
			}
		};
		
		return subjectPurchaseRepository.findAll(specification,pageable);
	}

	@Override
	public SubjectPurchaseRecord findSubjectPurchaseRecordById(Integer sprId) {
		
		return purchaseRepository.findSubjectPurchaseRecordBysprId(sprId);
	}

	@Override
	public Subject findSubject(Integer subjectId) {
		
		return subjectRepository.findOne(subjectId);
	}




	
	

}


