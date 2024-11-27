/* Written By 최준영 */

package com.shinemuscat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import com.shinemuscat.domain.BoardVO;
import com.shinemuscat.service.BoardService;


@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	
	@GetMapping("/list")
	public String list(Model model) {
		try {
			log.info("list....");
			model.addAttribute("list", service.getList());
			return "board/list";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		try {
			log.info("register: " + board);
			service.register(board);
			rttr.addFlashAttribute("result", board.getBno());
			return "redirect:/board/list";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping("/register")
	public void register() {}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		try {
			log.info("/get or modify.....");
			model.addAttribute("board", service.get(bno));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		try {
			log.info("modify: " + board);
			if(service.modify(board)) {
				rttr.addFlashAttribute("result", "success");
			}
			return "redirect:/board/list";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		try {
			log.info("remove...." + bno);
			if (service.remove(bno)) {
				rttr.addFlashAttribute("result", "success");
			}
			return "redirect:/board/list";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
