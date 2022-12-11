package com.kh.zip.inquiry.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.common.template.userPagination;
import com.kh.zip.inquiry.model.service.Inquiryservice;
import com.kh.zip.inquiry.model.vo.Inquiry;
import com.kh.zip.inquiry.model.vo.Reply;

@Controller
public class Inquirycontroller {
	
	@Autowired
	private Inquiryservice inquiryservice;
	
	@RequestMapping("inquiry.in")
	public String inquiryMain(@RequestParam(value="ipage",defaultValue="1") int currentPage, int userNo, Model model) {
		
		int pageLimit = 10;
		int inquiryLimit = 10;
		
		if(userNo != 1) {
			
			int listCount = inquiryservice.selectListCount1(userNo);
			
			userPageInfo pi = userPagination.getPageInfo(listCount, currentPage, pageLimit, inquiryLimit);
			
			ArrayList<Inquiry> list = inquiryservice.selectAll1(pi, userNo);
			
			model.addAttribute("list", list);
			
			model.addAttribute("pi", pi);
			
			return "inquiry/inquirymain";
		}
		else {
			
			int listCount = inquiryservice.selectListCount2();
			
			userPageInfo pi = userPagination.getPageInfo(listCount, currentPage, pageLimit, inquiryLimit);
			
			ArrayList<Inquiry> list = inquiryservice.selectAll2(pi);
			
			model.addAttribute("list", list);
			
			model.addAttribute("pi", pi);
			
			return "inquiry/inquirymain";
		}
	}
	
	@RequestMapping("enrollPage.in")
	public String inquiryEnrollPage() {
		
		return "inquiry/inquirypage";
	}
	
	@RequestMapping("insert.in")
	public String insertInquiry(Inquiry i, MultipartFile upfile, HttpSession session, Model model) {
		
		String changeName = saveFile(upfile, session);
		
		i.setOriginName(upfile.getOriginalFilename());
		i.setChangeName("resources/upfiles/"+changeName);
		
		int result = inquiryservice.insertInquiry(i);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg","1:1 문의가 등록되었습니다.");
			model.addAttribute("userNo", i.getUserNo());
			return "redirect:inquiry.in";
		}
		else {
			
			model.addAttribute("errorMsg", "1:1 문의 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("inSert.in")
	public String inSertInquiry(Inquiry i, HttpSession session, Model model) {
		
		int result = inquiryservice.insertInquiry(i);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg","1:1 문의가 등록되었습니다.");
			model.addAttribute("userNo", i.getUserNo());
			return "redirect:inquiry.in";
		}
		else {
			
			model.addAttribute("errorMsg", "1:1 문의 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("detail.in")
	public String inquiryDetail(int ino, Model model) {
		
		Inquiry i = inquiryservice.inquiryDetail(ino);
		
		ArrayList<Reply> list = inquiryservice.selectReply(ino);
		
		model.addAttribute("i", i);
		
		model.addAttribute("list", list);
		
		return "inquiry/inquirydetail";
	}
	
	@RequestMapping("updateForm.in")
	public String updateInquiryForm(int ino, HttpSession session, Model model) {
		
		Inquiry i = inquiryservice.inquiryDetail(ino);
		
		model.addAttribute("i", i);
		
		return "inquiry/inquiryupdate";
	}
	
	@RequestMapping("update.in")
	public String updateInquiry(Inquiry i, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			new File(session.getServletContext().getRealPath("/"+i.getChangeName())).delete();
			
			String changeName = saveFile(upfile, session);
			
			i.setOriginName(upfile.getOriginalFilename());
			i.setChangeName("resources/upfiles/"+changeName);
			
		}
		int result = inquiryservice.updateInquiry(i);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg","1:1 문의가 수정되었습니다.");
			return "redirect:detail.in?ino="+i.getInquiryNo();
		}
		else {
			
			model.addAttribute("errorMsg", "1:1 문의 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.in")
	public String deleteInquiry(int ino, String changeName, HttpSession session, Model model) {
		
		
		new File(session.getServletContext().getRealPath("/"+changeName)).delete();
		
		int result = inquiryservice.deleteInquiry(ino);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg","1:1 문의가 삭제되었습니다.");
			return "redirect:inquiry.in";
		}
		else {
			
			model.addAttribute("errorMsg", "1:1 문의 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("reportPage.in")
	public String reportPage(String userId, Model model) {
		model.addAttribute("userId", userId);
		
		return "inquiry/reportpage";
	}
	
	@RequestMapping("insertReply.in")
	public String insertReply(int ino, String replyContent, HttpSession session, Model model) {
		
		Reply r = new Reply();
		r.setRefIno(ino);
		r.setReplyContent(replyContent);
		
		int result = inquiryservice.insertReply(r);
		
		if(result > 0) {
			
			inquiryservice.updateAnswerStatus(ino);
			
			session.setAttribute("alertMsg","답글이 등록되었습니다.");
			return "redirect:detail.in?ino=" + ino;
		}
		else {
			
			model.addAttribute("errorMsg", "답글 등록 실패");
			return "common/errorPage";
		}
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/upfiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
}