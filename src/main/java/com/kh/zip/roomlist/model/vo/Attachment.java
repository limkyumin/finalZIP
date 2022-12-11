package com.kh.zip.roomlist.model.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class Attachment {
	
	private int fileNo;
	private int refRno;
	private String originName;
	private String changeName;
	private Date uploadDate;
	private int fileLevel;
	private String status;
}