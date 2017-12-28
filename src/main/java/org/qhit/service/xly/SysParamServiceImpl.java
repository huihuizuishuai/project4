package org.qhit.service.xly;

import java.util.List;

import org.qhit.dao.xly.SysParamRepository;
import org.qhit.entity.SysParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SysParamServiceImpl implements SysParamService {
	@Autowired
	SysParamRepository sysParamRepository;
	@Override
	public List<SysParam> find(String pcode) {
		return sysParamRepository.findSysparamList(pcode);
	}
	@Override
	public String getName(String string, String type) {
		// TODO Auto-generated method stub
		return sysParamRepository.getName(string, type);
	}

}
