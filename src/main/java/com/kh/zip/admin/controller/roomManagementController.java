
package com.kh.zip.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.zip.admin.model.service.roomListService;
import com.kh.zip.admin.model.service.userInquiryService;
import com.kh.zip.admin.model.vo.roomManagement;
import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.common.template.userPagination;

@Controller
public class roomManagementController {
	
	@Autowired
	private roomListService roomListService;
	
	@Autowired
	private userInquiryService userInquiryService;
	
	
	//규민 방요청/수락 관리 리스트띄우기 + 페이징처리
	@RequestMapping("roomManagement.li")
	public String roomManagement(@RequestParam(value="rpage",defaultValue="1") int currentPage,Model model){
		
		int listCount = roomListService.roomRequestCount();
		
		int pageLimit = 10;
		int adminLimit = 10;
		
		userPageInfo pi = userPagination.getPageInfo(listCount, currentPage, pageLimit, adminLimit);
		
		ArrayList<roomManagement> list = roomListService.roomRequestList(pi);
		
		
		//우측 화면 상단 종 버튼 방승인 요청 COUNT 띄우기
		int bellCount = roomListService.roomBell();
		
		//우측 화면 상단 메시지 버튼 1:1문의 요청 COUNT띄우기
		
	
				
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("bellCount", bellCount);
			
		
		return "admin/roommanagement";
	}
	

	
	
	//규민 방요청 디테일 뷰(방요청 글상세보기 -> 승인 거절 버튼 클릭처리하기 
	//				 -> 승인 및 거절시 방요청/수락관리 리스트에서 없어져야함 
	

	
	
	
	
}
