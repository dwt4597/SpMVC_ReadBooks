<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section>
	<form action=<c:url value="/book_send"/> method="POST" >
		
		<label>사용자ID</label>
		<input type="text" id="b_userid" name="b_userid"
		value="${ID.b_userid}"><br/>
		<label>도서코드</label>
		<input type="text" id="b_isbn" name="b_isbn" 
		value="${ID.b_text}"><br/>
		<label>도서제목</label>
		<input type="text" id="b_title" name="b_title"
		value="${ID.b_title}"><br/>
		<label>독서일자</label>
		<input type="text" id="b_date" name="b_date"
		value="${ID.b_date}"><br/>
		<label>별점</label>
		<input type="text" id="b_star" name="b_star"
		value="${ID.b_star}"><br/>
		<label>독서록</label>
		<input type="text" id="b_text" name="b_text"
		value="${ID.b_text}"><br/>
		
		<button>저장</button>
	</form>


</section>