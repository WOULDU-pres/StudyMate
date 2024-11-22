package com.shinemuscat.domain;

import lombok.Data;

@Data
public class BoardAttachVO {
	private String fileName;
	private String fileType;
	private	String uuid;
	private String uploadPath;
	
	private Long bno;
}
