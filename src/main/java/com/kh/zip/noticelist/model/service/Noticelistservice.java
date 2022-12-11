package com.kh.zip.noticelist.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.noticelist.model.vo.Noticelist;

public interface Noticelistservice {
	
	int selectListCount();
	
	ArrayList<Noticelist> selectAll(userPageInfo pi);
	
	int increaseCount(int noticeNo);
	
	int insertNoticelist(Noticelist n);
	
	Noticelist noticelistDetail(int noticeNo);
	
	int updateNoticelist(Noticelist n);
	
	int deleteNoticelist(int noticeNo);
	
	int selectSearchList(HashMap<String,String> map);
	
	ArrayList<Noticelist> selectSearchList2(HashMap<String,String> map, userPageInfo pi);
}