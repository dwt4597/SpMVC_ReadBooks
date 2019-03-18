<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
$(function(){
	$("#btn_save").click(function(){
		$("form").submit()
	})
	$("#btn_update").click(function(){
		let fData = ("form").serialize()
		
		$.ajax({
			url : "<c:url value='/memo_update'/>",
			method :"POST",
			data: fData,
			processData:false,
			contentType:false,
			success:function(result){
				alert('update success')
			},
			error:function(){
				alert("error")				
			}
		})
	})
	$("#btn_delete").click(function(){
		let id=$(this).attr("data-id")
		location.href="<c:url value='/bookdelete/'/>" + id
	})
})
</script>
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
		<div>
		<c:choose>
			<c:when test="${empty ID}">
				<button type="button" id="btn_save">저장</button>
			</c:when>
			<c:otherwise>
				<button type="button" id="btn_update">수정</button>
				<button type="button" id="btn_delete" data-id="${ID.b_id}">삭제</button>
			</c:otherwise>	
		</c:choose>
		</div>
	</form>
</section>