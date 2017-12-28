package org.qhit.service.xly;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.qhit.dao.xly.OverseaConfigSubscribeRepository;
import org.qhit.entity.OverseaConfigSubscribe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

@Service
public class OverseaConfigSubscribeServiceImpl implements OverseaConfigSubscribeService {
	@Autowired
	OverseaConfigSubscribeRepository overseaConfigSubscribeRepository;

	@Override
	public Page getPageSubscribe(Integer page, Integer pageSize,final Integer id) {
		// TODO Auto-generated method stub
		Pageable pageable=new PageRequest(page-1, pageSize);
		//通常使用 Specification 的匿名内部类
		Specification<OverseaConfigSubscribe> specification = new Specification<OverseaConfigSubscribe>() {

			public Predicate toPredicate(Root<OverseaConfigSubscribe> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Path path = root.get("oversea_id");
				Predicate predicate = cb.equal(path, id);
				return predicate;
			}
		};
		return overseaConfigSubscribeRepository.findAll(specification, pageable);
	}

	@Override
	public void save(OverseaConfigSubscribe overseaConfigSubscribe) {
		// TODO Auto-generated method stub
		overseaConfigSubscribeRepository.save(overseaConfigSubscribe);
	}


}

