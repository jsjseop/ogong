<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	게시판<br/>
	<a href="/board/listBoard">/board/listBoard</a><br/><hr/>
	신고 조회<br/>
	<a href="/admin/listUserReport">/admin/listUserReport</a><br/>
	회원 조회<br/>
	<a href="/admin/listTotalUser?listType=1">/admin/listTotalUser?listType=1</a><br/><hr/>
	그룹스터디<br/>
	<a href="/study/addStudy">/study/addStudy</a><br/>
	<a href="/study/listStudy">/study/listStudy</a><br/>
	스터디룸<br/>
	<a href="/studyroom/listParticipation?studyNo=10007">/studyroom/listParticipation?studyNo=10007</a><br/><hr/>
	자율스터디<br/>
	<a href="/selfStudy/addStudy?studyType=self">/selfStudy/addStudy?studyType=self</a><br/>
	<a href="/selfStudy/listStudy?studyType=self">/selfStudy/listStudy?studyType=self</a>
	
</body>
</html>