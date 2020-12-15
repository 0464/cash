package kr.co.gdu.cash.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.RestMemberService;

@RestController
public class RestMemberController {
	@Autowired private RestMemberService restMemberService;
	
	@PostMapping("/admin/idCheck")
	public String idCheck(@RequestParam(value="id") String id) {
		String returnId = restMemberService.getMemberId(id);
		if(returnId == null) {
			return "yes";
		}
		return "no";
	}
}
