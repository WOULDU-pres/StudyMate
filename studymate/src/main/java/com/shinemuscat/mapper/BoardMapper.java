/* Written By 주현우, 최준영 */
package com.shinemuscat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.shinemuscat.domain.BoardVO;

public interface BoardMapper {

	public List<BoardVO> getList();
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
}
