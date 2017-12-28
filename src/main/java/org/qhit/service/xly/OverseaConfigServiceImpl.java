package org.qhit.service.xly;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.qhit.dao.xly.OverseaConfigRepository;
import org.qhit.entity.OverseaConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

@Service
public class OverseaConfigServiceImpl implements OverseaConfigService {
	@Autowired
	OverseaConfigRepository overseaConfigRepository;
	@Override
	public List<OverseaConfig> findOverseaConfig() {
		// TODO Auto-generated method stub
		return overseaConfigRepository.findAll();
	}

	@Override
	public Page getOverseaConfig(Integer page, Integer pagesize) {
		// TODO Auto-generated method stub
		Order order = new Order(Direction.DESC,"addtime");
		Sort sort = new Sort(order);
		Pageable pageable = new PageRequest(page-1, pagesize,sort);
		return overseaConfigRepository.findAll(pageable);
	}

	@Override
	public void saveOverseaConfig(OverseaConfig overseaConfig) {
		// TODO Auto-generated method stub
		overseaConfigRepository.save(overseaConfig);
	}

	@Override
	public OverseaConfig getOver(Integer ocId) {
		// TODO Auto-generated method stub
		return overseaConfigRepository.findOne(ocId);
	}

	@Override
	public Page getOverseaConfigList(final int i, Integer page, Integer pagesize) {
		// TODO Auto-generated method stub
		Pageable pageable = new PageRequest(page-1, pagesize);
		//通常使用 Specification 的匿名内部类
		Specification<OverseaConfig> specification = new Specification<OverseaConfig>() {
			public Predicate toPredicate(Root<OverseaConfig> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Path path = root.get("status");
				Predicate predicate = cb.notEqual(path, i);
				return predicate;
			}
		};
		return overseaConfigRepository.findAll(specification, pageable);
	}

}
