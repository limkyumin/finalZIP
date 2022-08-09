package com.kh.zip.roomlist.model.service;

import java.util.ArrayList;

import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.roomlist.model.vo.Attachment;
import com.kh.zip.roomlist.model.vo.Roomlist;
import com.kh.zip.roomlist.model.vo.Wishlist;

public interface Roomlistservice {
	
	ArrayList<Roomlist> searchRoomAll();
	
	Roomlist detailRoom(int roomNo);
	
	String selectUserId(int userNo);
	
	String selectMasterId(int roomNo);
	
	ArrayList<Attachment> selectImages(int roomNo);
	
	Attachment selectDocument(int roomNo);
	
	Roomlist checkRoom(int userNo);
	
	int registerRoom(Roomlist r);
	
	int registerThumbnail(Attachment at);
	
	void registerImages(Attachment at);
	
	void registerDocument(Attachment at);
	
	int updateRoom(Roomlist r);
	
	void updateFiles(int roomNo);
	
	int updateThumbnail(Attachment at);
	
	void updateImages(Attachment at);
	
	void updateDocument(Attachment at);
	
	int deleteRoom(int roomNo);
	
	int approveRoom(int roomNo);
	
	Wishlist selectWishlist(Wishlist w);
	
	int addWishlist(Wishlist w);
	
	int removeWishlist(Wishlist w);
	
	ArrayList<Roomlist> selectOption(Roomlist r);
	
	ArrayList<Roomlist> roomenroll(int userNo);

	ArrayList<Wishlist> mywishlist(int userNo, userPageInfo pi);

	int wishListCount(int userNo);
}