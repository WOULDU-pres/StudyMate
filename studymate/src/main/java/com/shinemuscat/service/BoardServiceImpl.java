/* Written By 주현우, 최준영 */
package com.shinemuscat.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shinemuscat.domain.BoardVO;
import com.shinemuscat.domain.Criteria;
import com.shinemuscat.mapper.BoardMapper;
import com.shinemuscat.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	public BoardMapper mapper;
    private final ReplyMapper replyMapper; 

	@Override
	public void register(BoardVO board) throws Exception {
		log.info("register....." + board);
		mapper.insertSelectKey(board);
//		mapper.insert(board);
	}

	@Override
	public BoardVO get(Long bno) throws Exception {
		log.info("get....." + bno);
		BoardVO board = mapper.read(bno);
		if (board == null)throw new RuntimeException(bno + "게시물이 없음");
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) throws Exception {
		log.info("modify......" + board);
		if (mapper.update(board) == 0) throw new RuntimeException(board.getBno()+"번 게시물이 수정되지 않음");
		return true;
	}

	@Override
	public boolean remove(Long bno) throws Exception {
		log.info("modify......" + bno);

        replyMapper.deleteByBno(bno);

		if (mapper.delete(bno) == 0) throw new RuntimeException(bno+"번 게시물이 삭제되지 않음");
		return true;
	}

//	@Override
//	public List<BoardVO> getList() throws Exception {
//			return mapper.getList();
//	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) throws Exception {
		
		log.info("get List with criteria: " + cri);
		
		return mapper.getListWithPaging(cri);
	}

}