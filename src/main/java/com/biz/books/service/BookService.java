package com.biz.books.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.books.mapper.BookDao;
import com.biz.books.model.BookVO;

@Service
public class BookService {

	@Autowired
	BookDao dao;
	
	public List<BookVO> selectAll(){
		
		return dao.selectAll();
		
	}

	public List<BookVO> selectByUserId(String b_userid){
		
		return dao.selectByUserId(b_userid);
	}
	
	public BookVO findById(long b_id) {
		
		return dao.findById(b_id);
	}
	
	public int insert(BookVO bookVO) {
		
		int ret = dao.insert(bookVO);
		
		return ret;
	}
	
	public int update(BookVO bookVO) {
		return dao.update(bookVO);
	}
	
	public int deleteBook(long id) {
		return dao.bookDelete(id);
	}
	
	
}
