<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
 
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
