package kr.co.gdu.cash.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RestCashbookMapper {
	// cashbookYearList
	public Map<String, Object> selectCashbookYearList();
	// cashbookYearOutList
	public Map<String, Object> selectCashbookYearOutList();
	// cashbookYearlyList
	public List<Map<String, Object>> selectCashbookYearlyList();
	// cashbookYearlyOutList
	public List<Map<String, Object>> selectCashbookYearlyOutList();
	// cashbook2018List
	public Map<String, Object> selectCashbook2018List();
	// cashbookCategoryOutList
	public List<Map<String, Object>> selectCashbookCategoryOutList();
	// cashbookInOutList
	public List<Map<String, Object>> selectCashbookInOutList();
	// cashbookYearInOutList
	public List<Map<String, Object>> selectCashbookYearInOutList();
	// cashbookAllOutInList
	public List<Map<String, Object>> selectCashbookAllOutInList();
}
