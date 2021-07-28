<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<head>
	 	<title>게시판</title>
	</head>
	<body>
	
									  <input type="hidden" name="email"	value="abcd960141@gmail.com"/>  <!--  히든값 -->
	
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
 
    <c:forEach items="${list }" var="board" >
        ${board.boardNo }<br>
        ${board.boardTitle }<br>
        ${board.viewCount}<br>
        ${board.answerCount }<br>
        ${board.boardRegDate}<br>   <br>
    </c:forEach>
    <c:if test="${empty list }">
        ${"데이터가 존재하지않아요."}
    </c:if>
    
</body>
</html>
