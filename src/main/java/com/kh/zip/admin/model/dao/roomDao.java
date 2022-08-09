package com.kh.zip.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.zip.admin.model.vo.roomManagement;
import com.kh.zip.common.model.vo.userPageInfo;

@Repository
public class roomDao {

	public int roomRequestCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminRoomMapper.roomRequestCount");
	}

	public ArrayList<roomManagement> roomRequestList(SqlSessionTemplate sqlSession, userPageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getUserLimit();
		int limit = pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("adminRoomMapper.roomRequestList", null, rowBounds);
	}

	public roomManagement detailRoom(SqlSessionTemplate sqlSession, int roomNo) {

		return sqlSession.selectOne("adminRoomMapper.detailRoom", roomNo);
	}

	public int roomBell(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminRoomMapper.roomBell");
	}


	public int selectApartmentCnt(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminRoomMapper.selectApartmentCnt");
	}

	public int selectVillamentCnt(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminRoomMapper.selectVillamentCnt");
	}

	public int selectHousingCnt(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminRoomMapper.selectHousingCnt");
	}

	public int selectPriceOne(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminRoomMapper.selectPriceOne");
	}

	public int selectPriceTwo(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminRoomMapper.selectPriceTwo");
	}

	public int selectPriceThree(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminRoomMapper.selectPriceThree");
	}

//	public ArrayList<roomManagement> mainRoomRequestList(SqlSessionTemplate sqlSession) {
//		
//		return (ArrayList)sqlSession.selectList("adminRoomMapper.mainRoomRequestList");
//	}
	
	
	public ArrayList<roomManagement> mainRoomRequestList(SqlSessionTemplate sqlSession, HashMap<String, Integer> roomMap) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminRoomMapper.mainRoomRequestList", roomMap);
	}



	
	
}
