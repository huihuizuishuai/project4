package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016082500310689";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCLpFjgoVNe8T3nRRxpdZ3ywcEIPonIz29WKUlcwUfxS0LKwwW0YrkuFNRtsBUXMN2XKvQ0jVrvLFbH7YcAJxHfyemRQPlLKSghjKOeKdyktleTZwr2l7xeTcFwfIVUetLL7nLfsn44XvE4+Gh2MkWBYY8ft2sceJkpJJmpV2lE6xTjUyVFiVxAY4szOKa1wjfVyPF1/W6GewabBdDSS/i2X2YknnJr583+953brJxTHZAj7W7/UYTp4POFP/RtVpL6i0iu7WRRHj0R7wSeLA833ExZzE5ofUo8sb9eFEDyHBmomlUF64PrKJLEI7cN+oRnTC5hrnLqhxFNLti+NRijAgMBAAECggEAaditNbeTBkg97+tG2fk5PCT5OFKPBhOWBO1Ommw3KAMwIZkp3c1nKDLJwkrR8b4seMUqThtHbjthnDHDPq5esg7OaDejvwD3VlbQPrbkdEVypFxaxwfE1IaDtcvtFFf1KHcZw838NqZgmhpQtCbu4F8eqZ/SJMaU8ca4Ys/LD10uVJQLP33M9yYFz5tb8CKTc0tQjPpneVa9JFxOJJrwZg09v3DBzFm8QIFXqbBfQ56TRSdYYL1e6EnjZiLsUKpCEegg20LvjBhTenWmu7SNiM1zbuWuSC776J13Klk92hoYI4JvBM2GwFMRsnFVMnqnmnYmxo9j5/txUa3vNalWYQKBgQDhxgpdW4pG7VQPvjrTWIV39FQGfmMpX/uaySAEDTIvjMrrZl2O7kxBOsoPx/JKQ2wyrISTsc+M/96CvPNcjDSRPMS4E0HnR66elbTORpK1+juSsfKUzVswyy7khVwa47i2JN7ksipTJ3UHXhCpsv4+wyURe2N0g66Ri/+hg3ngfQKBgQCeVk9Q+eJTM5a5FUwZBSR9T1AVCboyvmiMRTPZwHUELIo3BilM4dVOVjzO5CGB1/cA5GvbvDbVcIzcwZZ69fB1Uh7G2HXbqH2zSmYH1Lojbqw58+ip7hioa9XYpFFJL2QOs7palXKCwXc4Ak9JceiTSWxjhJ1aV24bDTDHHUBHnwKBgEbiRp7I/sEGAj5vG0j/oefnbfob9EYpPHV8b/DVs8v6CDugB/+4EXjpXEdYH1nxkSbXw0gbq245Z0Lk0ANegaKX0at5YFecydZAamPZBHbd+ZY1CFRvpRHMuQxGUoSeun91VAW5alBxMuz9O34MFIbf/eNfOfp63XQU4E11We6BAoGAdwYoj5WYdbT1G2KQFsrP2EbzyyzJxHVv/+nRhWHwVNfqelxuVXX6M+4NvfSt335qFkifb8m3apE1wojfxsT0Ii0+J3n2ds3c2BcYRdC6sAH1A4d/oaXy8UBGu5kh5aLzUz312zw2nWYzaW4LDgnLrFRoXxMEejH4+erbfQJXHL8CgYAXRnHkCx35x7cip0TCiF3wTWxtyicqTSBDMALelpTZMXX/6+tk4yFUTEz2oBKc3KWKWtXdG6/MB4zFB0ziPc+1Hdb97reCGOb9j4NR2l4Oxiv+5DXQSOQzlRNIfupk7wrqL1SB4Fqm5SuOI+hUGUZ7aL8Ro+lvv/vgT/D5wc6+TQ==";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqM3zFF4C04Pf7SU2MCIspdLqE3HIJkRAufl7iFvFRAqXYfKEZNEAHQ057Fw4b09szmO8I8VaY51M3z07UcT0nemkN7vr7PstN9Tch6OmaIKjhUrQH8UG8UsWvycpIoXwebCbMGxQX++CzbQ1SrB1jTVz4P1lRyIe6T05/60YKn4nscY/9TuOEjY+fHDQeH/aMBdgVhCOnNqxEixfA+xUBShz9RvzppjzCK362lcRIwOLzF45Mal2tqoqZkDe1bbksW7Fwg0Zq1Yd9LNic48lpJaJwMz9nHK5lx0tOIWtNJDJRBUoioQUeO+9A48TlBztzN86aNRgLwIe0ulUBacmWwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://32122100.ngrok.io/winplus/views/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://32122100.ngrok.io/winplus/Main/returnUrl";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

