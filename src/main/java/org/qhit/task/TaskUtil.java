package org.qhit.task;

import org.qhit.dao.lzj.PurchaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

public class TaskUtil {
	@Autowired
	PurchaseRepository purchaseRepository;

	@Scheduled(cron = "0 0/1 15,* * * ?")
	public void test() {
		//去扫描到期时间的购买记录的数据
		System.out.println("=============================================================");
		purchaseRepository.updatesubject_purchase_record();
	}

}
