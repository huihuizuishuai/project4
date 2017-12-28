package org.qhit.service.xly;

import org.qhit.entity.OverseaConfigSubscribe;
import org.springframework.data.domain.Page;

public interface OverseaConfigSubscribeService {
	Page getPageSubscribe(Integer page, Integer pageSize, Integer id);
	void save(OverseaConfigSubscribe overseaConfigSubscribe);
}
