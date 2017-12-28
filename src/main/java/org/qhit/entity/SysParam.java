package org.qhit.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class SysParam {
	private Integer pid;//
	private String pcode;//类型
	private String pname;//类型名称
	private String pvalue;//类型状态

	@Id
	@SequenceGenerator(name="sys_param",sequenceName="seq_sys_param",allocationSize=1)
	@GeneratedValue(generator="sys_param",strategy=GenerationType.SEQUENCE)
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPvalue() {
		return pvalue;
	}
	public void setPvalue(String pvalue) {
		this.pvalue = pvalue;
	}


}
