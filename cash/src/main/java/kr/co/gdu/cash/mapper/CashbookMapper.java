package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

// @Conpoment
// @Controller, @Service, @Mapper, @Repository : 스테레오타입
@Mapper
public interface CashbookMapper {
	// 전체 cashbooList Excel
	List<Cashbook> selectCashbookListAll();
	List<Map<String, Object>> selectCashInOutList();
	Integer selectSumCashbookPriceByInOut(Map<String, Object> map);
	// cashbookByMonth int selectSumCashbookPriceByInOut(String cashbookKind, int year, int month);
	List<Map<String, Object>> selectCashListByMonth(Map<String, Object> map);
	List<Cashbook> selectCashbookListByDay(Map<String, Object> map);
	// cashbookByDay 내용
	Cashbook selectCashbookByDay(int cashbookId);
	// cashbookList
	List<Cashbook> selectCashbookListByPage(Map<String, Object> map);
	// cashbookByDay 입력
	int insertCashbook(Cashbook cashbook);
	// cashbookByDay 수정
	int updateCashbook(Cashbook cashbook);
	// cashbookByDay 삭제
	int deleteCashbook(int cashbookId);
	// cashbook count
	int countCashbook();
}