package kr.co.gdu.cash.restmapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RestMemberMapper {
	public String selectMemberId(String id);
}
