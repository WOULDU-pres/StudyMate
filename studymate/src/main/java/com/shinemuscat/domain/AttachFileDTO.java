/* Written By 주현우 */
package com.shinemuscat.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	
	private String fileName;
	private String uploadPath;
	private	String uuid;
	private boolean image;
}


