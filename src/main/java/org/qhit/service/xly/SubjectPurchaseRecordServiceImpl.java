package org.qhit.service.xly;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.qhit.dao.xly.SubjectPurchaseRecordRepository;
import org.qhit.entity.SubjectPurchaseRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

@Service
public class SubjectPurchaseRecordServiceImpl implements SubjectPurchaseRecordService {
@Autowired
SubjectPurchaseRecordRepository subjectPurchaseRecordRepository;

public Page getPurchaseRecord(final Integer subjcetId,Integer page,Integer pagesize){
	Pageable pageable = new PageRequest(page-1, pagesize);
	//通常使用 Specification 的匿名内部类
	Specification<SubjectPurchaseRecord> specification = new Specification<SubjectPurchaseRecord>(){

		public Predicate toPredicate(Root<SubjectPurchaseRecord> root,
				CriteriaQuery<?> query, CriteriaBuilder cb) {
			Path path = root.get("subjectId");
			Predicate predicate = cb.equal(path, subjcetId);
			return predicate;
		}
	};
	return subjectPurchaseRecordRepository.findAll(pageable);
	
}
}
