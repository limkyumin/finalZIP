package com.kh.zip.userinfo.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Userinfo {

	private int userNo;//USER_NO	NUMBER
	private String userId;//USER_ID	VARCHAR2(20 BYTE)
	private String userPwd;//USER_PWD	VARCHAR2(15 BYTE)
	private String userName;//USER_NAME	VARCHAR2(20 BYTE)
	private String userBirth;//USER_BIRTH	NUMBER(8,0)
	private String userEmail;//USER_EMAIL	VARCHAR2(50 BYTE)
	private String userPhone;//USER_PHONE	VARCHAR2(15 BYTE)
	private String userAddress;//USER_ADDRESS	VARCHAR2(50 BYTE)
	private String userAddressDetail;
	private String userGender;//USER_GENDER	VARCHAR2(1 BYTE)
	private Date enrollDate;//ENROLL_DATE	DATE
	private Date modifyDate;//MODIFY_DATE	DATE
	private Date stopDate;
	private Date quitDate;
	private String userStatus;//USER_STATUS	VARCHAR2(1 BYTE)
	private String roomlist;
	private String changeName;
}