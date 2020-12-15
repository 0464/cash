package kr.co.gdu.cash.restservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.RestMemberMapper;

@Service
@Transactional
public class RestMemberService {
	@Autowired private RestMemberMapper restMemberMapper;
	
	public String getMemberId(String id) {
		return restMemberMapper.selectMemberId(id);
	}
}
