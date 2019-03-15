<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" 
	content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
$(function(){
	
	$(".memo_tr").click(function(){
		let id = $(this).attr("data-id")
		$.ajax({
			url : "<c:url value='/memo_update'/>",
			method:"GET",
			data : {id:id},
			success:function(result){
				$("#body").html(result)
				
				
			}
			
		})
		
	})
	
})
</script>



</head>
<body>
<%@ include file="/WEB-INF/views/include/menu.jspf" %>
<section>
	<article id="body">
		<table>
		 <tr>
		 	<th>번호</th>
			<th>사용자ID</th>
			<th>도서코드</th>
			<th>도서제목</th>
			<th>독서일자</th>
			<th>별점</th>
		 </tr>
		 
		 <c:choose>
			<c:when test ="${empty BOOKS}">
				<tr><td colspan=6>데이터가 없습니다.</td></tr>	
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${BOOKS}" varStatus="i">
				<tr class="memo_tr" data-id="${vo.b_id}">
					<td>${i.count}</td>
					<td>${vo.b_userid}</td>
					<td>${vo.b_isbn}</td>
					<td>${vo.b_title}</td>
					<td>${vo.b_date}</td>
					<td>${vo.b_star}</td>
				</tr>
				</c:forEach>
			</c:otherwise>
	 </c:choose>
	</table>
	<button id="btn_memo">작성하기</button>
	</article>
</section>


</body>
</html>