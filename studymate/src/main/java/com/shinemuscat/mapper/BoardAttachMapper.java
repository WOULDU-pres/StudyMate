/* Written By 주현우 */
package com.shinemuscat.mapper;

import java.util.List;

import com.shinemuscat.domain.BoardAttachVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBno(Long bno);
}
