package kr.co.gdu.cash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	
	// 공지사항 목록
	@GetMapping("/admin/noticeList/{currentPage}")
	public String noticeList(Model model,
			@PathVariable(value = "") int currentPage) {
		int rowPerPage = 10;
		
		List<Notice> noticeList = noticeService.getNoticeListPage(currentPage, rowPerPage);
		
		int totalCount = noticeService.getCountNotice();	// 전체 데이터 수
		int lastPage = totalCount / rowPerPage;	// 마지막 페이지
		// 10 미만의 개수의 데이터가 있는 페이지를 표시
		if (totalCount % rowPerPage != 0) {	
			lastPage += 1;
		}
		// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
		if (lastPage == 0) { 
			currentPage = 0;
		}
		
		model.addAttribute("noticeList", noticeList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		return "noticeList";
	}
	
	// 공지사항 입력 Form
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		return "addNotice";
	}
	
	// 공지사항 입력 Action
	@PostMapping("/admin/addNotice")
	public String addNotice(NoticeForm noticeForm) {
		noticeService.addNotice(noticeForm);
		return "redirect:/admin/noticeList/1";
	}
	
	// 공지사항 상세 페이지
	@GetMapping("/admin/noticeOne/{noticeId}/{currentPage}")
	public String noticeOne(Model model, 
			@PathVariable(value = "noticeId") int noticeId,
			@PathVariable(value = "") int currentPage) {
		int rowPerPage=3;
		
		Notice notice = noticeService.getNoticeOne(noticeId, currentPage, rowPerPage);
		Notice noticefile = noticeService.getNoticefileOne(noticeId);
		
		int totalCount = noticeService.getCountComment();
		int lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		if(lastPage == 0) { 
			currentPage = 0;
		}
		
		model.addAttribute("notice", notice);
		model.addAttribute("noticefile", noticefile);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		return "noticeOne";
	}
	
	// 공지사항 삭제
	@GetMapping("/admin/removeNotice/{noticeId}")
	public String removeNotice(Model model, 
			@PathVariable(value = "noticeId") int noticeId) {
		noticeService.removeNotice(noticeId);
		return "redirect:/admin/noticeList/1";
	}
	
	// 공지사항 수정 Form
	@GetMapping("/admin/modifyNotice/{noticeId}")
	public String modifyNoticeForm(Model model, 
			@PathVariable(value = "noticeId") int noticeId) {
		Notice notice = noticeService.getNoticeOneList(noticeId);
		model.addAttribute("notice", notice);
		return "modifyNotice";
	}
	
	// 공지사항 수정 Action
	@PostMapping("/admin/modifyNotice")
	public String modifyNoticeAction(NoticeForm noticeForm) {
		noticeService.modifyNotice(noticeForm);
		return "redirect:/admin/noticeOne/" + noticeForm.getNoticeId()+"/1";
	}
	
	// 공지사항 파일 삭제
	@GetMapping("/admin/removeNoticefile/{noticeId}/{noticefileId}")
	public String removeNoticefile(Model model,
								@PathVariable(value = "noticeId") int noticeId,
								@PathVariable(value = "noticefileId") int noticefileId) {
		noticeService.removeNoticefileName(noticefileId);
		return "redirect:/admin/modifyNotice/"+noticeId;
	}
}