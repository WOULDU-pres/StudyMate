package com.shinemuscat.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.shinemuscat.domain.BoardVO;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:**/*-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper mapper;
	
    @Test
    public void testGetList() {
        log.info("Testing getList...");
        List<BoardVO> list = mapper.getList();
        assertNotNull(list);
        list.forEach(board -> log.info(board));
    }
	
    @Test
    public void testInsert() {

        BoardVO existingBoard = mapper.read(1L); 
        assertNotNull(existingBoard);
       
        String existingUserId = existingBoard.getUser_id();
        assertNotNull(existingUserId); 
    	
        log.info("Testing insert...");
        BoardVO board = new BoardVO();
        board.setTitle("Test Title");
        board.setContent("Test Content");
        board.setUser_id("test_user");
        board.setRecruitmenttype_id(1);
        board.setRecruitmentnumber_id(1);
        board.setPosition_id(1);
        board.setTechstack_id(1);
        board.setContactmethod_id(1);
        board.setWorktype_id(1);
        board.setDuration_id(1);
        board.setDeadline(new Date());
        board.setUser_id(existingUserId);

        mapper.insert(board);
        log.info("Inserted Board: " + board);
    }

    @Test
    public void testInsertSelectKey() {
        BoardVO existingBoard = mapper.read(1L); 
        assertNotNull(existingBoard);
       
        String existingUserId = existingBoard.getUser_id();
        assertNotNull(existingUserId); 
    	
        log.info("Testing insertSelectKey...");
        BoardVO board = new BoardVO();
        board.setTitle("Test Title with SelectKey");
        board.setContent("Test Content with SelectKey");
        board.setUser_id("test_user");
        board.setRecruitmenttype_id(1);
        board.setRecruitmentnumber_id(2);
        board.setPosition_id(1);
        board.setTechstack_id(1);
        board.setContactmethod_id(1);
        board.setWorktype_id(1);
        board.setDuration_id(1);
        board.setDeadline(new Date());
        board.setUser_id(existingUserId);

        mapper.insertSelectKey(board);
        log.info("Inserted Board with SelectKey: " + board);
        assertNotNull(board.getBno());
    }

    @Test
    public void testRead() {
        log.info("Testing read...");
        Long bno = 1L; // Replace with an existing bno
        BoardVO board = mapper.read(bno);
        assertNotNull(board);
        log.info("Read Board: " + board);
    }
}
