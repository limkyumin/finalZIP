package com.kh.zip.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.zip.admin.model.vo.roomManagement;
import com.kh.zip.common.model.vo.userPageInfo;

public interface roomListService {

	//전체 방요청 갯수
	int roomRequestCount();

	ArrayList<roomManagement> roomRequestList(userPageInfo pi);

	int roomBell();

//	ArrayList<roomManagement> mainRoomRequestList();

	ArrayList<roomManagement> mainRoomRequestList(HashMap<String, Integer> roomMap);

	
	int selectApartmentCnt();

	int selectVillamentCnt();

	int selectHousingCnt();

	int selectPriceOne();

	int selectPriceTwo();

	int selectPriceThree();

	
	
	//방 요청 리스트




}
