package com.kh.zip.roomlist.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.roomlist.model.dao.Roomlistdao;
import com.kh.zip.roomlist.model.vo.Attachment;
import com.kh.zip.roomlist.model.vo.Roomlist;
import com.kh.zip.roomlist.model.vo.Wishlist;

@Service
public class Roomlistserviceimpl implements Roomlistservice{
	
	@Autowired
	private Roomlistdao roomlistdao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Roomlist> searchRoomAll() {
		
		return roomlistdao.searchRoomAll(sqlSession);
	}

	@Override
	public Roomlist detailRoom(int roomNo) {
		
		return roomlistdao.detailRoom(sqlSession, roomNo);
	}
	
	@Override
	public String selectUserId(int userNo) {
		
		return roomlistdao.selectUserId(sqlSession, userNo);
	}

	@Override
	public String selectMasterId(int roomNo) {
		
		return roomlistdao.selectMasterId(sqlSession, roomNo);
	}
	
	@Override
	public ArrayList<Attachment> selectImages(int roomNo) {
		
		return roomlistdao.selectImages(sqlSession, roomNo);
	}
	
	@Override
	public Attachment selectDocument(int roomNo) {
		
		return roomlistdao.selectDocument(sqlSession, roomNo);
	}
	
	@Override
	public Roomlist checkRoom(int userNo) {
		
		return roomlistdao.checkRoom(sqlSession, userNo);
	}
	
	@Override
	public int registerRoom(Roomlist r) {
		
		return roomlistdao.registerRoom(sqlSession, r);
	}
	
	@Override
	public int registerThumbnail(Attachment a) {
		
		return roomlistdao.registerThumbnail(sqlSession, a);
	}

	@Override
	public void registerImages(Attachment a) {
		
		roomlistdao.registerImages(sqlSession, a);
	}

	@Override
	public void registerDocument(Attachment a) {
		
		roomlistdao.registerDocument(sqlSession, a);
	}

	@Override
	public int updateRoom(Roomlist r) {
		
		return roomlistdao.updateRoom(sqlSession, r);
	}
	
	@Override
	public void updateFiles(int roomNo) {
		
		roomlistdao.updateFiles(sqlSession, roomNo);
	}
	
	@Override
	public int updateThumbnail(Attachment a) {
		
		return roomlistdao.updateThumbnail(sqlSession, a);
	}

	@Override
	public void updateImages(Attachment a) {
		
		roomlistdao.updateImages(sqlSession, a);
	}

	@Override
	public void updateDocument(Attachment a) {
		
		roomlistdao.updateDocument(sqlSession, a);
	}

	@Override
	public int deleteRoom(int roomNo) {
		
		return roomlistdao.deleteRoom(sqlSession, roomNo);
	}

	@Override
	public int approveRoom(int roomNo) {
		
		return roomlistdao.approveRoom(sqlSession, roomNo);
	}

	@Override
	public Wishlist selectWishlist(Wishlist w) {
		
		return roomlistdao.selectWishlist(sqlSession, w);
	}

	@Override
	public int addWishlist(Wishlist w) {
		
		return roomlistdao.addWishlist(sqlSession, w);
	}

	@Override
	public int removeWishlist(Wishlist w) {
		
		return roomlistdao.removeWishlist(sqlSession, w);
	}

	@Override
	public ArrayList<Roomlist> selectOption(Roomlist r) {
		
		return roomlistdao.selectOption(sqlSession, r);
	}
	
	@Override
	public ArrayList<Roomlist> roomenroll(int userNo) {
		
		return roomlistdao.roomenroll(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<Wishlist> mywishlist(int userNo, userPageInfo pi) {
		
		return roomlistdao.mywishlist(sqlSession, userNo, pi);
	}

	@Override
	public int wishListCount(int userNo) {
		
		return roomlistdao.wishListCount(sqlSession, userNo);
	}
}