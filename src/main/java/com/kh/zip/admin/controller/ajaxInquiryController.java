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
import com.kh.zip.admin.model.vo.userInquiry;

@Controller
public class ajaxInquiryController {

	
	@Autowired
	userInquiryService userInquiryService;
	
	@Autowired
	roomListService roomListService;
	
	@ResponseBody
	@RequestMapping(value="ajaxInquiry",produces="application/json; charset=UTF-8")
	public String ajaxInquiry(Model model,HttpSession session,int startNum, int endNum){
		//ajax String : new Gson().toJson(ArrayList, Map)
		HashMap<String,Integer> map = new HashMap<>();
		//  map<key, value>
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		ArrayList<userInquiry> mainMsgList = userInquiryService.mainInquiryList(map);

		return new Gson().toJson(mainMsgList);
		
	}
}