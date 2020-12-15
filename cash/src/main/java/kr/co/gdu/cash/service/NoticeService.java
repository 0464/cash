package kr.co.gdu.cash.service;

import java.io.File;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.cash.mapper.*;
import kr.co.gdu.cash.vo.*;

@Service
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper cashbookMapper;
	@Autowired private NoticefileMapper noticefileMapper;
	// aws http://54.180.138.45/cash/
	private final String PATH ="/home/ubuntu/tomcat9/webapps/cash/src/main/webapp/upload/";
	// home
	// private final String PATH ="D:\\git\\git\\cash\\src\\main\\webapp\\upload\\";
	// goodee
	// private final String PATH ="D:\\git\\maven.1606201723605\\cash\\src\\main\\webapp\\upload\\";

	public Map<String, Object> getLatestNoticeListAndInOutList() {
		List<Notice> noticeList = noticeMapper.selectLatestNoticeList();
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", noticeList);
		map.put("inOutList", inOutList);
		
		return map;
	}
	
	public List<Notice> getNoticeList() {
		return noticeMapper.selectLatestNoticeList();
	}
	
	public List<Notice> getNoticeListPage(int currentPage, int rowPerPage) {
		// currentPage, rowPerPage를 통해 beginRow, rowPerPage 전달하여
		// noticeMapper 메소드를 호출한다.
		// 이후 결과값을 받아 return 한다.
		
		int beginRow = (currentPage - 1) * rowPerPage;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		List<Notice> noticeList = noticeMapper.selectNoticeListByPage(map);
		
		return noticeList;
	}
	
	public int getCountNotice() {
		return noticeMapper.countNotice();
	}
	
	public int getCountComment() {
		return noticeMapper.selectCommentcount();
	}
	
	public Notice getNoticeOne(int noticeId, int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("noticeId", noticeId);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		Notice noticeOne = noticeMapper.selectNoticeOne(map);
		
		return noticeOne;
	}
	public Notice getNoticefileOne(int noticeId) {
		Notice noticefile = noticeMapper.selectNoticefileOne(noticeId);
		return noticefile;
	}
	
	public void addNotice(NoticeForm noticeForm) {
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		// 1. notice db 입력 -> key값 받음
		noticeMapper.insertNotice(notice); // setnoticeId(SELECT LAST_INSERT_ID())
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefile() != null) {
			noticefile = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefile()) {
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId());
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-", "");
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileSize(mf.getSize());
				nf.setNoticefileType(mf.getContentType());
				noticefile.add(nf);
				try {
					mf.transferTo(new File(PATH+filename+ext));
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(noticefile != null) {
			for(Noticefile nf : noticefile) {
				noticefileMapper.insertNoticefile(nf);
			}
		}
	}
	
	public void modifyNotice(NoticeForm noticeForm) {
		Notice notice = new Notice();
		notice.setNoticeId(noticeForm.getNoticeId());
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());

		noticeMapper.updateNotice(notice); // setnoticeId(SELECT LAST_INSERT_ID())
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefile() != null) {
			noticefile = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefile()) {
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId());
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-", "");
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileSize(mf.getSize());
				nf.setNoticefileType(mf.getContentType());
				noticefile.add(nf);
				try {
					mf.transferTo(new File(PATH+filename+ext));
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(noticefile != null) {
			for(Noticefile nf : noticefile) {
				noticefileMapper.insertNoticefile(nf);
			}
		}
	}
	
	public void removeNotice(int noticeId) {
		// ISSUE 댓글이 달린 게시물도 삭제 되야함
		
		// 게시글을 참조하는 파일을 삭제
		List<String> noticefileNameList = noticefileMapper.selectNoticeFileNameList(noticeId);
		for(String s:noticefileNameList) {
			File file = new File(PATH+s);
			if(file.exists()) {
				file.delete();
			}
		}
		// 게시글을 참조하는 파일테이블 데이터 삭제
		noticefileMapper.deleteNoticefile(noticeId);
		// 게시글 삭제
		noticeMapper.deleteNotice(noticeId);
	}

	public void removeNoticefileName(int noticefileId) {
		noticefileMapper.deleteNoticefileName(noticefileId);
	}

	public Notice getNoticeOneList(int noticeId) {
		Notice notice = noticeMapper.selectNoticeOneList(noticeId);
		return notice;
	}
}