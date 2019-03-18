package com.biz.books.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.books.model.BookVO;

public interface BookDao {

	@Select("select * from tbl_books")
	public List<BookVO> selectAll();
	
	@Select("select * from tbl_books where b_userid = #{b_userid}")
	public List<BookVO> selectByUserId(String b_userid);
	
	@Select("select * from tbl_books where b_id=#{b_id}")
	public BookVO findById(long b_id);
	
	/* SEQ 안만들고 하는방법 => 중간에 데이터가 빠지면 안됨. 위험한방법임.
	@SelectKey(statement="select count(*) +1 from tbl_books",
				keyProperty = "id",
				before=true,
				resultType = Long.class
			)
	*/
	
	
	@InsertProvider(type=BookSQL.class, method="book_insert_sql")
	public int insert(BookVO bookVO);
	
	@UpdateProvider(type=BookSQL.class, method="book_update_sql")
	public int update(BookVO bookVO);
	
	@Delete("delete from tbl_books where b_id=#{b_id}")
	public int bookDelete(long b_id);
	
	
}
