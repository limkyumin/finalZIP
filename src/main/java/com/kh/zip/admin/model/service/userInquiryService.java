package com.kh.zip.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.zip.admin.model.vo.userInquiry;
import com.kh.zip.common.model.vo.userPageInfo;

public interface userInquiryService {

	int inquiryListCount();

	ArrayList<userInquiry> selectInquiryList(userPageInfo pi);

	int inquiryMsg();

//	ArrayList<userInquiry> mainInquiryList();

	ArrayList<userInquiry> mainInquiryList(HashMap<String, Integer> map);
}
