package org.qhit.service.xly;

import java.util.List;

import org.qhit.entity.OverseaConfig;
import org.springframework.data.domain.Page;

public interface OverseaConfigService {
	/**
	 * 查询界面
	 * @return
	 */
	public List<OverseaConfig> findOverseaConfig();
	/**
	 * 分页
	 * @param page
	 * @param pagesize
	 * @return
	 */
	public Page getOverseaConfig(Integer page,Integer pagesize);
	/**
	 * 添加
	 * @param overseaConfig
	 */
	public void saveOverseaConfig(OverseaConfig overseaConfig);
	/**
	 * 查看预约
	 * @param ocId
	 * @return
	 */
	public OverseaConfig getOver(Integer ocId);

	public Page getOverseaConfigList(int i,Integer page,Integer pagesize);
}
