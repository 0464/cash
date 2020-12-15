package kr.co.gdu.cash.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.RestCashbookService;

@RestController
public class RestCashbookController {
	@Autowired RestCashbookService restCashbookService;
	
	@GetMapping("/admin/cashbookYearList")
	public Map<String, Object> cashbookYearList() {
		Map<String, Object> map = restCashbookService.getCashbookYearList();
		return map;
	}
	
	@GetMapping("/admin/cashbookYearOutList")
	public Map<String, Object> cashbookYearOutList() {
		Map<String, Object> map = restCashbookService.getCashbookYearOutList();
		return map;
	}
	
	@GetMapping("/admin/cashbookYearlyList")
	public List<Map<String, Object>> cashbookYearlyList() {
		List<Map<String, Object>> list = restCashbookService.getCashbookYearlyList();
		return list;
	}
	
	@GetMapping("/admin/cashbookYearlyOutList")
	public List<Map<String, Object>> cashbookYearlyOutList() {
		List<Map<String, Object>> list = restCashbookService.getCashbookYearlyOutList();
		return list;
	}
	
	@GetMapping("/admin/cashbook2018List")
	public Map<String, Object> cashbook2018List() {
		Map<String, Object> map = restCashbookService.getCashbook2018List();
		return map;
	}
	
	@GetMapping("/admin/cashbookCategoryOutList")
	public List<Map<String, Object>> cashbookCategoryOutList() {
		List<Map<String, Object>> list = restCashbookService.getCashbookCategoryOutList();
		return list;
	}
	
	@GetMapping("/admin/cashbookInOutList")
	public List<Map<String, Object>> cashbookInOutList() {
		List<Map<String, Object>> list = restCashbookService.getCashbookInOutList();
		return list;
	}
	
	@GetMapping("/admin/cashbookYearInOutList")
	public List<Map<String, Object>> cashbookYearInOutList() {
		List<Map<String, Object>> list = restCashbookService.getCashbookYearInOutList();
		return list;
	}
	
	@GetMapping("/admin/cashbookAllOutInList")
	public List<Map<String, Object>> cashbookAllOutInList() {
		List<Map<String, Object>> list = restCashbookService.getCashbookAllOutInList();
		return list;
	}
}
