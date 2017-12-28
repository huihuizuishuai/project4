package org.qhit.util;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

public class SendMsg_webchinese {

	public static Integer checkedSms(String phone)throws Exception{
		//随机数,利用random发送随机验证码
		Integer rand=(int) ((Math.random()*(9999-1000+1))+1000);
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.api.smschinese.cn"); 
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码
		NameValuePair[] data ={ new NameValuePair("Uid", "xxxxxxx"),new NameValuePair("Key", "26cd113d7e317d86332b"),new NameValuePair("smsMob",phone),new NameValuePair("smsText","验证码："+rand)};
		post.setRequestBody(data);

		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		System.out.println("statusCode:"+statusCode);
		for(Header h : headers)
		{
			System.out.println(h.toString());
		}
//		String result = new String(post.getResponseBodyAsString().getBytes("gbk")); 
//		System.out.println(result); //打印返回消息状态


		post.releaseConnection();
		return rand;
	}

}