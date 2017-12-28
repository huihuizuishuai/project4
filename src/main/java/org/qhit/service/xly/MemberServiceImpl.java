package org.qhit.service.xly;

import java.util.List;

import org.qhit.dao.xly.MemberRepository;
import org.qhit.entity.Members;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberRepository memberRepository;
	@Override
	public List<Members> selectList() {
		return memberRepository.findAll();
	}

}
