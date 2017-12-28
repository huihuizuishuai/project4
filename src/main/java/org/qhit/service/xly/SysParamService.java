package org.qhit.service.xly;

import java.util.List;

import org.qhit.entity.SysParam;

public interface SysParamService {
	public List<SysParam> find(String pcode);
	
	public String getName(String string, String type);
}
