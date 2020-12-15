package kr.co.gdu.cash.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.gdu.cash.service.*;

@Controller
public class IndexController {
	@Autowired private NoticeService noticeService;
	
	@GetMapping(value="/admin/index")
	public String index(Model model) {	// request.getAttribute();
		int currentPage=1;
		Map<String, Object> map = noticeService.getLatestNoticeListAndInOutList();
		
		model.addAttribute("noticeList", map.get("noticeList"));
		model.addAttribute("inOutList", map.get("inOutList"));
		model.addAttribute("currentPage", currentPage);
		return "index";
	}
}