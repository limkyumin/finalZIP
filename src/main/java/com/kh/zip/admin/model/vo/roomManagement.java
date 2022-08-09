package com.kh.zip.admin.model.vo;

import lombok.Data;

@Data
public class roomManagement {

	private int roomNo;//	ROOM_NO	NUMBER	No		1	등록번호
	private int userNo;//	USER_NO	NUMBER	Yes		2	회원번호
	private String title;//	TITLE	VARCHAR2(150 BYTE)	No		3	제목
	private String bulidingType;//	BUILDING_TYPE	VARCHAR2(30 BYTE)	No		4	건물유형
	private int bulidingLevel;//	BUILDING_LEVEL	NUMBER	No		5	층수
	private int tenantNumber; //	TENANT_NUMBER	NUMBER	No		6	총인원수
	private String address;//	ADDRESS	VARCHAR2(200 BYTE)	No		7	주소
	private String addressDetail;//	ADDRESS_DETAIL	VARCHAR2(100 BYTE)	No		8	상세주소
	private String wishGender;//	WISH_GENDER	VARCHAR2(10 BYTE)	Yes		9	선호성별
	private String wishAge;//	WISH_AGE	VARCHAR2(10 BYTE)	Yes		10	선호연령대
	private String petYn;//	PET_YN	VARCHAR2(10 BYTE)	Yes		11	반려동물유무
	private String smokeYn;//	SMOKE_YN	VARCHAR2(10 BYTE)	Yes		12	흡연여부
	private String price;//	PRICE	VARCHAR2(10 BYTE)	Yes		13	한달방세
	private String content;//	CONTENT	VARCHAR2(4000 BYTE)	No		14	내용
	private String status;//	STATUS	VARCHAR2(1 BYTE)	Yes	'W' 	15	상태값
	private String userId; 
	// userinfo 테이블과 join해서 사용하기위해 추가로 변수 선언함 (성학님 룸리스트 참조 했음 -규민)
}
