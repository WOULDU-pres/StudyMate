/* Written By 주현우, 최준영 */

package com.shinemuscat.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno;
	private String title;
	private String content;
	private Date regdate;
	private Date updateDate;
	private int views;
	
    @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date deadline;
	
	private int recruitmenttype_id;
	private int recruitmentnumber_id;
	private int position_id;
	private int techstack_id;
	private int contactmethod_id;
	private int worktype_id;
	private int duration_id;
	private String user_id;
	
	private String nickname;
	private String recruitmenttype_name;
	private String recruitmentnumber;
	private String position_name;
	private String techstack_name;
	private String contactmethod_name;
	private String worktype_name;
	private String duration_name;
	
	private List<BoardAttachVO> attachList;
}
