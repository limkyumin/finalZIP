package com.kh.zip.roomlist.model.vo;

import lombok.Data;

@Data
public class Roomlist {
	
	private int roomNo;
	private int userNo;
	private String title;
	private String buildingType;
	private int buildingLevel;
	private int tenantNumber;
	private String address;
	private String addressDetail;
	private String wishGender;
	private String wishAge;
	private String petYn;
	private String smokeYn;
	private int price;
	private String content;
	private String status;
	private String userId; // userinfo 테이블과 join해서 사용하기위해 추가로 변수 선언함
	private String changeName; // attachment 테이블과 join해서 사용하기위해 추가로 변수 선언함
	private int rownum;
}