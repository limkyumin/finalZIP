package com.kh.zip.roomlist.model.vo;

import lombok.Data;

@Data
public class Wishlist {
	
	private int wishNo;
	private int roomNo;
	private int userNo;
	private String status;
	private String userId;
	private String title;
	private String address;
}