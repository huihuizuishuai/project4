package org.qhit.util;
import java.util.HashMap;
import java.util.Map;

public class ResponseMsg{
	private int code;
	private String msg;
	private Map<String, Object> paramsMap = new HashMap();

	public ResponseMsg() {
	}
	public ResponseMsg(int code, String msg, Map<String, Object> paramsMap) {
		this.code = code;
		this.msg = msg;
		this.paramsMap = paramsMap;
	}
	public int getCode() {
		return this.code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return this.msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getParamsMap() {
		return this.paramsMap;
	}
	public void setParamsMap(Map<String, Object> paramsMap) {
		this.paramsMap = paramsMap;
	}

	public static ResponseMsg getError(String message)
	{
		ResponseMsg msg = new ResponseMsg();
		msg.setCode(1);
		msg.setMsg(message);
		return msg;
	}

	public static ResponseMsg getOk(String message)
	{
		ResponseMsg msg = new ResponseMsg();
		msg.setCode(0);
		msg.setMsg(message);
		return msg;
	}
}