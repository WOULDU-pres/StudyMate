<<<<<<< HEAD
package com.shinemuscat.domain;

import java.util.Date;
=======
/* Written By 주현우 */
package com.shinemuscat.domain;

import java.util.Date;
import java.util.List;
>>>>>>> 5280721fcb8b47441c555dd88d97016805823064

import lombok.Data;

@Data
public class BoardVO {
	private Long bno;
	private String title;
	private String content;
<<<<<<< HEAD
	private Date regdate;
	private Date updateDate;
	private int views;
	private Date deadline;
	
	private int recruitmenttype_id;
	private int recruitmentnumber_id;
	private int position_id;
	private int techstack_id;
	private int contactmethod_id;
	private int worktype_id;
	private int duration_id;
	private String user_id;
=======
	private String writer;
	private Date regdate;
	private Date updateDate;
	
	private List<BoardAttachVO> attachList;
>>>>>>> 5280721fcb8b47441c555dd88d97016805823064
}
