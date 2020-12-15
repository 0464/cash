package kr.co.gdu.cash.restservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.restmapper.RestCashbookMapper;
import kr.co.gdu.cash.vo.Cashbook;

@Service
@Transactional
public class RestCashbookService {
	@Autowired private RestCashbookMapper restCashbookMapper;

	public Map<String, Object> getCashbookYearList() {
		return restCashbookMapper.selectCashbookYearList();
	}
	
	public Map<String, Object> getCashbookYearOutList() {
		return restCashbookMapper.selectCashbookYearOutList();
	}
	
	public List<Map<String, Object>> getCashbookYearlyList() {
		return restCashbookMapper.selectCashbookYearlyList();
	}
	
	public List<Map<String, Object>> getCashbookYearlyOutList() {
		return restCashbookMapper.selectCashbookYearlyOutList();
	}
	
	public Map<String, Object> getCashbook2018List() {
		return restCashbookMapper.selectCashbook2018List();
	}
	
	public List<Map<String, Object>> getCashbookCategoryOutList() {
		return restCashbookMapper.selectCashbookCategoryOutList();
	}
	
	public List<Map<String, Object>> getCashbookInOutList() {
		return restCashbookMapper.selectCashbookInOutList();
	}
	
	public List<Map<String, Object>> getCashbookYearInOutList() {
		return restCashbookMapper.selectCashbookYearInOutList();
	}
	
	public List<Map<String, Object>> getCashbookAllOutInList() {
		return restCashbookMapper.selectCashbookAllOutInList();
	}
}
