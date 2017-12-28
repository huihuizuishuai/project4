package org.qhit.service.xly;

import java.util.List;

import org.qhit.entity.Subject;
import org.springframework.data.domain.Page;

public interface SubjectService {
	/**
	 * 查询界面
	 * @return
	 */
	public List<Subject> selectSubject();
	/**
	 * 添加
	 * @param subject
	 */
	public void addSubject(Subject subject);
	
	/**
	 * 编辑
	 * @param subject
	 * @return
	 */
	public void UpdateSubject(Subject subject);
	/**
	 * 分页
	 * @param page
	 * @param size
	 * @return
	 */
	public Page findAllPage(Integer page,Integer size,final Subject subject);
	/**
	 * 查看投资
	 * @param subjectId
	 * @return
	 */
	public Subject seeList(Integer subjectId);
	
	
	
}
