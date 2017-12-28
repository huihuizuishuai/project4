package org.qhit.service.xly;

import org.springframework.data.domain.Page;

public interface SubjectPurchaseRecordService {
	Page getPurchaseRecord(Integer subjcetId, Integer page, Integer pageSize);
}
