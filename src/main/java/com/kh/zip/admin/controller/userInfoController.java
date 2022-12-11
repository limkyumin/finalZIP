package com.kh.zip.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.zip.admin.model.service.roomListService;
import com.kh.zip.admin.model.service.userInquiryService;
import com.kh.zip.admin.model.service.userService;
import com.kh.zip.admin.model.vo.roomManagement;
import com.kh.zip.admin.model.vo.userInfo;
import com.kh.zip.admin.model.vo.userInquiry;
import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.common.template.userPagination;

@Controller
public class userInfoController {
	
	@Autowired
	private userService userService;
	
	@Autowired
	private roomListService roomListService;
	
	@Autowired
	private userInquiryService userInquiryService;
	
	//관리자 메인페이지
	@RequestMapping("admin.ui")
	public String adminMain(Model model) {
		
		//금일
		int todayYmemberCnt = userService.selectYmemberCnt();	//신규 = Y ENROLL_DATE
		int todaySmemberCnt = userService.selectSmemberCnt();	//정지 = P STOP_DATE
		int todayQmemberCnt = userService.selectQmemberCnt();	//탈퇴 = N QUIT_DATE
//		int todayFMemberCnt = userService.selectMemberCnt();	//강제탈퇴 = F
		
		//이번달
		int monthYmemberCnt = userService.selectYmemberMonthCnt();	//신규 = Y ENROLL_DATE
		int monthSmemberCnt = userService.selectSmemberMonthCnt();	//정지 = P STOP_DATE
		int monthQmemberCnt = userService.selectQmemberMonthCnt();	//탈퇴 = N QUIT_DATE
		
		//아파트 , 빌라, 주택
		int apartmentCnt = roomListService.selectApartmentCnt();
		int villaCnt = roomListService.selectVillamentCnt();
		int housingCnt = roomListService.selectHousingCnt();
		
		//건물 가격
		int priceOne = roomListService.selectPriceOne();		//30~50
		int priceTwo = roomListService.selectPriceTwo();		//50~70
		int priceThree = roomListService.selectPriceThree();	//70이상
		
		int roomCount = roomListService.roomBell();
		
		int inquiryCount = userInquiryService.inquiryMsg();
		
		
		//메인에 방요청/수락 메시지버튼 3개씩 나오게 처리(ajax)
		HashMap<String,Integer> roomMap = new HashMap<String,Integer>();	
		roomMap.put("startNum2", 1);
		roomMap.put("endNum2", 3);	
		ArrayList<roomManagement> mainBellList = roomListService.mainRoomRequestList(roomMap); 
		
		
		//메인에 1:1문의 메시지버튼 3개씩 나오게 처리(ajax)
		HashMap<String,Integer> map = new HashMap<String,Integer>();	
		map.put("startNum", 1);
		map.put("endNum", 3);		
		ArrayList<userInquiry> mainMsgList = userInquiryService.mainInquiryList(map);
		
		
		model.addAttribute("todayYmemberCnt", todayYmemberCnt);
		model.addAttribute("todaySmemberCnt", todaySmemberCnt);
		model.addAttribute("todayQmemberCnt", todayQmemberCnt);
		
		model.addAttribute("monthYmemberCnt", monthYmemberCnt);
		model.addAttribute("monthSmemberCnt", monthSmemberCnt);
		model.addAttribute("monthQmemberCnt", monthQmemberCnt);
		
		
		model.addAttribute("roomCount", roomCount);
		model.addAttribute("inquiryCount", inquiryCount);
		model.addAttribute("mainBellList", mainBellList);
		model.addAttribute("mainMsgList", mainMsgList);
		
		model.addAttribute("apartmentCnt", apartmentCnt);
		model.addAttribute("villaCnt", villaCnt);
		model.addAttribute("housingCnt", housingCnt);
		
		model.addAttribute("priceOne", priceOne);
		model.addAttribute("priceTwo", priceTwo);
		model.addAttribute("priceThree", priceThree);
		
		return "admin/adminmain";
	}
	
	//규민파트 회원 리스트 띄우기+페이징 
	@RequestMapping("member.li")
	public String memberManagement(@RequestParam(value="mpage",defaultValue="1") int currentPage,Model model) {
																					

		int listCount = userService.selectListCountAdmin();
		
		int pageLimit = 10;
		int adminLimit = 10;
		
		userPageInfo pi = userPagination.getPageInfo(listCount, currentPage, pageLimit, adminLimit);
		
		ArrayList<userInfo> list = userService.selectUserList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/usermanagement";
	}
	
	//규민파트 회원 상태수정
	@RequestMapping("memStatus.update")
	public String memberStatus(userInfo u,HttpSession session,Model model) {
		
		int result = userService.memberStatus(u);
		
		return "redirect:member.li";
	}
	
	//규민파트 회원 검색	
	@RequestMapping("search.mem")
	public String userSearch(@RequestParam(value="mpage",defaultValue="1") int currentPage,Model model,
							 String type, String keyword,userPageInfo pi)
	{
		
		//소문자도 구분되게 하는 방법
		if(keyword.equals("y")||keyword.equals("n")||keyword.equals("f")||keyword.equals("p")) {
			keyword = keyword.toUpperCase();
		}
		
		HashMap<String,String> map = new HashMap<>();
		
		map.put("type", type);
		map.put("keyword", keyword);
		
		int searchCount = userService.selectSearchCount(map); // 검색결과에 대한 개수 페이징
		
		int pageLimit = 10;		//페이지 개수
		int adminLimit = 10;	//페이지에 띄울 유저수
		
		pi = userPagination.getPageInfo(searchCount, currentPage, pageLimit, adminLimit);
		
		ArrayList<userInfo> list = userService.selectUserList2(map,pi); // 검색에 대한 결과
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		model.addAttribute("type", type);
		model.addAttribute("map", map);
		
		return "admin/usermanagement";
		
	}
	
	@RequestMapping("todayYmember.li")
	public String todayYmember(@RequestParam(value="mpage",defaultValue="1") int currentPage,Model model) {
		
		int listCount = userService.selectListCountYmember();
		
		int pageLimit = 10;
		int adminLimit = 10;
		
		userPageInfo pi = userPagination.getPageInfo(listCount, currentPage, pageLimit, adminLimit);
		
		ArrayList<userInfo> list = userService.selectUserListYmember(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/usermanagementYmember";
	}
	
	@RequestMapping("searchYmem.mem")
	public String userSearchYmember(@RequestParam(value="mpage",defaultValue="1") int currentPage,Model model,
							 String type, String keyword,userPageInfo pi)
	{
		
		//소문자도 구분되게 하는 방법
		if(keyword.equals("y")||keyword.equals("n")||keyword.equals("f")||keyword.equals("p")) {
			keyword = keyword.toUpperCase();
		}
		
		HashMap<String,String> map = new HashMap<>();
		
		map.put("type", type);
		map.put("keyword", keyword);
		
		int searchCount = userService.selectSearchCountYmember(map); // 검색결과에 대한 개수 페이징
		
		int pageLimit = 10;		//페이지 개수
		int adminLimit = 10;	//페이지에 띄울 유저수
		
		pi = userPagination.getPageInfo(searchCount, currentPage, pageLimit, adminLimit);
		
		ArrayList<userInfo> list = userService.selectUserListYmember2(map,pi); // 검색에 대한 결과
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		model.addAttribute("type", type);
		model.addAttribute("map", map);
		
		return "admin/usermanagementYmember";
		
	}
}