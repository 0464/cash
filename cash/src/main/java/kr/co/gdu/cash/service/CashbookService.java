package kr.co.gdu.cash.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.*;
import kr.co.gdu.cash.vo.*;

@Service
@Transactional
public class CashbookService {
	@Autowired private CashbookMapper cashBookMapper;
	
	// Excel download
	public List<Cashbook> getCashbookListAll() {
		return cashBookMapper.selectCashbookListAll();
	}
	
	public List<Cashbook> getCashbookListByPage(int currentPage, int rowPerPage) {
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		return cashBookMapper.selectCashbookListByPage(map);
	}
	
	public int getSumCashbookPriceByInOut(String cashbookKind, int currentYear, int currentMonth) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cashbookKind", cashbookKind);
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		
		Integer sum = cashBookMapper.selectSumCashbookPriceByInOut(map);
		
		return sum;
	}
	
	public List<Map<String, Object>> getCashListByMonth(int currentYear, int currentMonth) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		
		return cashBookMapper.selectCashListByMonth(map);
	}
	
	public List<Cashbook> getCashbookListByDay(int currentYear, int currentMonth, int currentDay) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		map.put("currentDay", currentDay);
		
		return cashBookMapper.selectCashbookListByDay(map);
	}
	
	public Cashbook getCashbookByDay(int cashbookId) {
		Cashbook cashbook = cashBookMapper.selectCashbookByDay(cashbookId);
		
		return cashbook;
	}
	public int getCountCashbook() {
		return cashBookMapper.countCashbook();
	}
	
	public int addCashbook(Cashbook cashbook) {
		return cashBookMapper.insertCashbook(cashbook);
	}
	
	public int modifyCashbook(Cashbook cashbook) {
		return cashBookMapper.updateCashbook(cashbook);
	}
	
	public int removeCashbook(int cashbookId) {
		return cashBookMapper.deleteCashbook(cashbookId);
	}
}