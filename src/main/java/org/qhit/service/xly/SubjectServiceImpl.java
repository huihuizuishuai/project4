package org.qhit.service.xly;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.qhit.dao.xly.SubjectRepository;
import org.qhit.entity.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import oracle.net.aso.p;
@Service
public class SubjectServiceImpl implements SubjectService {
	@Autowired
	SubjectRepository subjectRepository;
	/**
	 * 查询界面
	 */
	@Override
	public List<Subject> selectSubject() {
		return subjectRepository.findAll();
	}
	/**
	 * 添加
	 */
	@Override
	public void addSubject(Subject subject) {
		subjectRepository.save(subject);
	}
	/**
	 * 编辑
	 */
	@Override
	public void UpdateSubject(Subject subject) {
		subjectRepository.save(subject);
	}


	/**
	 * 查看投资
	 */
	@Override
	public Subject seeList(Integer subjectId) {
		return subjectRepository.findOne(subjectId);
	}




	@Override
	public Page findAllPage(Integer page, Integer size, Subject subject) {
		Pageable pageable=new PageRequest(page-1, size);
		Specification<Subject> specification=new Specification<Subject>() {

			@Override
			public Predicate toPredicate(Root<Subject> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				List<Predicate> plist = new ArrayList<>();
				if (subject!=null) {
					if (subject.getSubjectName()!=null&&!"".equals(subject.getSubjectName())) {
						Path path = root.get("subjectName");
						plist.add(builder.like(path, "%"+subject.getSubjectName()+"%"));
					}
					if (subject.getSubjectType()!=null&&!"".equals(subject.getSubjectType())) {
						Path path1 = root.get("subjectType");
						plist.add(builder.equal(path1, subject.getSubjectType()));
					}
					if (subject.getStatus()!=null&&!"".equals(subject.getStatus())) {
						Path path2 = root.get("status");
						plist.add(builder.equal(path2, subject.getStatus()));
					}
				}



				return builder.and(plist.toArray(new Predicate[plist.size()]));
			}
		};
		// TODO Auto-generated method stub
		return subjectRepository.findAll(specification,pageable);
	}
}
