<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>게시판</title>
	</head>
	<body>
	
									  <input type="hidden" name="email"	value="${user.email}"/>  <!--  히든값 -->
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form role="form" method="post" action="/board/write">
					<table>
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
						
						
						
						<c:forEach items="${list}" var = "board">
							<tr>
								<td><c:out value="${board.boardNo}" /></td>
								<td><c:out value="${board.boardTitle}" /></td>
								<td><c:out value="${board.viewCount}" /></td>
							</tr>   
						</c:forEach>
						
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>
