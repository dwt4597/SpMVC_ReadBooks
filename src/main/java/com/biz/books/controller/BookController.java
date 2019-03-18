package com.biz.books.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.biz.books.model.BookVO;
import com.biz.books.service.BookService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BookController {
	
	@Autowired
	BookService bService;
	
	@RequestMapping(value="memo",method=RequestMethod.GET)
	public String memo(Model model) {
		
		return "bodys/memo_form";
	}
	
	@RequestMapping(value="memo_update",method=RequestMethod.GET)
	public String memo(Model model,@RequestParam String id) {
		long b_id=Long.valueOf(id);
		BookVO vo = bService.findById(b_id);
		model.addAttribute("ID",vo);
		return "bodys/memo_form";
	}
	
	@RequestMapping(value="memo_update",method=RequestMethod.POST)
	public String memo(Model model,@ModelAttribute BookVO bookVO) {
		bService.update(bookVO);
		return "redirect:/";
	}
	
	
	@RequestMapping(value="book_send", method=RequestMethod.POST)
	public String send(Model model, @ModelAttribute BookVO bookVO) {
		
		bService.insert(bookVO);
	
		return "redirect:/";
	}
	
	@RequestMapping(value="book_list",method=RequestMethod.GET)
	public String list(Model model) {
		
		List<BookVO> bList = bService.selectAll();
		model.addAttribute("BOOKS",bList);
		return "home";
	}
	
	@RequestMapping(value="bookdelete/{id}", method=RequestMethod.GET)
	public String deleteBook(Model model, @PathVariable long id, HttpSession httpSession) {
		bService.deleteBook(id);

		return "redirect:/";
	}
	
}
