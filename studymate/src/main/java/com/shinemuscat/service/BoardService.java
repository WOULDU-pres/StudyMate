/* Written By 주현우, 최준영 */
package com.shinemuscat.service;

import java.util.List;

import com.shinemuscat.domain.BoardVO;

public interface BoardService {
	public void register(BoardVO board) throws Exception;
	public BoardVO get(Long bno) throws Exception;
	public boolean modify(BoardVO board) throws Exception;
	public boolean remove(Long bno) throws Exception;
	public List<BoardVO> getList() throws Exception;
}
