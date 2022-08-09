package com.kh.zip.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.zip.admin.model.service.roomListService;
import com.kh.zip.admin.model.service.userInquiryService;
import com.kh.zip.admin.model.vo.roomManagement;

@Controller
public class ajaxRoomController {

	@Autowired
	userInquiryService userInquiryService;
	
	@Autowired
	roomListService roomListService;
	
	@ResponseBody
	@RequestMapping(value="ajaxRoom",produces="application/json; charset=UTF-8")
	public String ajaxRoom(Model model,HttpSession session,int startNum2, int endNum2){
	
		HashMap<String,Integer> roomMap = new HashMap<>();
		
		roomMap.put("startNum2", startNum2);
		roomMap.put("endNum2", endNum2);
		
		ArrayList<roomManagement> mainBellList = roomListService.mainRoomRequestList(roomMap); 
		
		return new Gson().toJson(mainBellList);
	}
}