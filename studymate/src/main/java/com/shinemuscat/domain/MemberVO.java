package com.shinemuscat.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String user_id;
	private String password;
	private String nickname;
	private boolean enabled;

	private List<AuthVO> authList;
	
}
