<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->


<!-- Bootstrap Dropdown Hover JS -->
<script type="text/javascript">


</script>
</head>
<body>
     
     <div class="container"> 
     <input type="hidden" value="${studyNo}"></intput>
  
     	<div class="page-header text-default">
        	<h3 align="center">그룹스터디 회원 목록</h3>
      	</div>

		<div class="row">
			<jsp:include page="../layout/sidebar.jsp"/>
				<div class="col-md-9 text-left">
			<table class="table table-hover table-striped">
             	<thead>
             		<tr>
                    	<th align="center">닉네임</th>
                        <th align="center">출석률</th>
                        <th align="center">뭘 넣을까</th>
                        <th align="center">뭘 넣을까</th>
                    </tr>
                </thead>
            <tbody>
                       <c:forEach var="gMember" items="${list}">
	               <tr>
	               	  <td align="left">${gMember.member.nickname}
	               	  <input type="hidden"
	                     value="${gMember.member.email}" /></td>
	                  <td align="left">${gMember.attendanceRate} %</td>
	                  <td align="left">뭘 넣을까</td>
	                  <td align="left">뭘 넣을까</td>
	               </tr>
	            </c:forEach>
        				</tbody>
                  </table>
            
      		 </div>	
      		 
                  
                </div>
          </div> 
</body>
</html>