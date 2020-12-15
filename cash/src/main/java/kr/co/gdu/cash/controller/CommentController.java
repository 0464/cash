package kr.co.gdu.cash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.CommentService;
import kr.co.gdu.cash.vo.Comment;

@Controller
public class CommentController {
	@Autowired CommentService commentService;
	@PostMapping("/admin/addComment")
	public String addComment(Comment comment) {
		commentService.addComment(comment);
		return "redirect:/admin/noticeOne/"+comment.getNoticeId()+"/1";
	}
	
	@GetMapping("/admin/removeComment/{commentId}/{noticeId}")
	public String deleteComment(
						@PathVariable(value = "commentId") int commentId,
						@PathVariable(value = "noticeId") int noticeId) {
		commentService.deleteComment(commentId);
		return "redirect:/admin/noticeOne/"+noticeId+"/1";
	}
}
