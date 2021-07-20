<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<html>
<body>
<h2>[회원정보 수정]</h2>
<form action='<c:url value='UpdatePassword'/>' method="post">
    <div>이름<input type="text" name="nickname" id="nickname" value="${user.nickname}" readonly="readonly"></div>    
    <div>아이디<input type="text" name="email" id="memberId" value="${user.email}" readonly="readonly"></div>
    <div>비밀번호<input type="text" name="password" id="password" value="${password}"></div>

    <button class="btn btn-success" type="submit" id="submit">수정완료</button>
    <button type="button" onclick="location.href='/'">처음으로</button>
    
    </form>
</body>
</html>

