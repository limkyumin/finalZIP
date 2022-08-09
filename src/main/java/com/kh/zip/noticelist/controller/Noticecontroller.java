package com.kh.zip.noticelist.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.common.template.userPagination;
import com.kh.zip.noticelist.model.service.Noticelistservice;
import com.kh.zip.noticelist.model.vo.Noticelist;

@Controller
public class Noticecontroller {
	
	@Autowired
	Noticelistservice noticelistservice;
	
	@RequestMapping("noticelist.no")
	public String noticelistMain(@RequestParam(value="npage",defaultValue="1") int currentPage, Model model) {
		
		int pageLimit = 10;
		int noticeLimit = 10;
		
		int listCount = noticelistservice.selectListCount();
		
		userPageInfo pi = userPagination.getPageInfo(listCount, currentPage, pageLimit, noticeLimit);
		
		ArrayList<Noticelist> list = noticelistservice.selectAll(pi);
		
		model.addAttribute("list", list);
		
		model.addAttribute("pi", pi);
		
		return "noticelist/noticelistmain";
	}
	
	@RequestMapping("enrollPage.no")
	public String enrollPage() {
		
		return "noticelist/noticelistpage";
	}
	
	@RequestMapping("insert.no")
	public String insertNoticelist(Noticelist n, HttpSession session, Model model) {
		
		int result = noticelistservice.insertNoticelist(n);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg","공지사항이 등록되었습니다.");
			return "redirect:noticelist.no";
		}
		else {
			
			model.addAttribute("errorMsg", "공지사항 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("detail.no")
	public String noticelistDetail(int nno, Model model) {
		
		int result = noticelistservice.increaseCount(nno);
		
		if(result > 0) {
			
			Noticelist n = noticelistservice.noticelistDetail(nno);
			
			model.addAttribute("n", n);
			
			return "noticelist/noticelistdetail";
		}
		else {
			
			model.addAttribute("errorMsg", "상세보기 실패");
			
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateForm.no")
	public String updateNoticelistForm(int nno, HttpSession session, Model model) {
		
		Noticelist n = noticelistservice.noticelistDetail(nno);
		
		model.addAttribute("n", n);
		
		return "noticelist/noticelistupdate";
	}
	
	@RequestMapping("update.no")
	public String updateNoticelist(Noticelist n, HttpSession session, Model model) {
		
		int result = noticelistservice.updateNoticelist(n);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg","공지사항이 수정되었습니다.");
			return "redirect:detail.no?nno="+n.getNoticeNo();
		}
		else {
			
			model.addAttribute("errorMsg", "공지사항 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.no")
	public String updateNoticelist(int nno, HttpSession session, Model model) {
		
		int result = noticelistservice.deleteNoticelist(nno);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg","공지사항이 삭제되었습니다.");
			return "redirect:noticelist.no";
		}
		else {
			
			model.addAttribute("errorMsg", "공지사항 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("search.no")
	public String searchNoticeList(int currentPage, String type, String keyword, Model model) {
		
		HashMap<String,String> map = new HashMap<>();
		
		map.put("type", type);
		map.put("keyword", keyword);
		
		int searchCount = noticelistservice.selectSearchList(map);
		
		int pageLimit = 10;
		int noticeLimit = 10;
		
		userPageInfo pi = userPagination.getPageInfo(searchCount, currentPage, pageLimit, noticeLimit);
		
		ArrayList<Noticelist> list = noticelistservice.selectSearchList2(map, pi);
		
		model.addAttribute("list", list);
		
		model.addAttribute("pi", pi);
		
		model.addAttribute("map", map);
		
		return "noticelist/noticelistmain";
	}
}