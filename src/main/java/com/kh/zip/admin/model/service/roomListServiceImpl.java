package com.kh.zip.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zip.admin.model.dao.roomDao;
import com.kh.zip.admin.model.vo.roomManagement;
import com.kh.zip.common.model.vo.userPageInfo;

@Service
public class roomListServiceImpl implements roomListService {

	@Autowired
	private roomDao roomDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int roomRequestCount() {
		
		return roomDao.roomRequestCount(sqlSession);
	}

	@Override
	public ArrayList<roomManagement> roomRequestList(userPageInfo pi) {

		return roomDao.roomRequestList(sqlSession,pi);
	}

	@Override
	public int roomBell() {

		return roomDao.roomBell(sqlSession);
	}

	

	@Override
	public int selectApartmentCnt() {
		
		return roomDao.selectApartmentCnt(sqlSession);
	}

	@Override
	public int selectVillamentCnt() {
		
		return roomDao.selectVillamentCnt(sqlSession);
	}

	@Override
	public int selectHousingCnt() {
		
		return roomDao.selectHousingCnt(sqlSession);
	}

	@Override
	public int selectPriceOne() {
		
		return roomDao.selectPriceOne(sqlSession);
	}

	@Override
	public int selectPriceTwo() {
		
		return roomDao.selectPriceTwo(sqlSession);
	}

	@Override
	public int selectPriceThree() {
		
		return roomDao.selectPriceThree(sqlSession);
	}

//	@Override
//	public ArrayList<roomManagement> mainRoomRequestList() {
//		
//		return roomDao.mainRoomRequestList(sqlSession);
//	}
	
	
	@Override
	public ArrayList<roomManagement> mainRoomRequestList(HashMap<String, Integer> roomMap) {
		// TODO Auto-generated method stub
		return roomDao.mainRoomRequestList(sqlSession, roomMap);
	}





	

}
