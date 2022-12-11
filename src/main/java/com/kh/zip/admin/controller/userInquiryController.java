package com.kh.zip.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.zip.admin.model.service.userInquiryService;
import com.kh.zip.admin.model.vo.userInquiry;
import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.common.template.userPagination;

@Controller
public class userInquiryController {
	
	@Autowired
	private userInquiryService userInquiryService;
	

	
	//규민 1:1 문의 관리 내역 띄우기 + 페이징처리
	@RequestMapping("userInquiry.li")
	public String userInquiry(@RequestParam(value="aipage",defaultValue="1") int currentPage,Model model) {
		
		int listCount = userInquiryService.inquiryListCount();
		
		int pageLimit = 10;
		int adminLimit = 10;
		
		userPageInfo pi = userPagination.getPageInfo(listCount, currentPage, pageLimit, adminLimit);
		
		ArrayList<userInquiry> list = userInquiryService.selectInquiryList(pi);
		
		//우측 화면 상단 메시지 버튼 1:1문의 COUNT 띄우기		
		int inquiryCount = userInquiryService.inquiryMsg();
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("inquiryCount", inquiryCount);
		
		return "admin/userinquiry";
	}
}