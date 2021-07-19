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

	$(function (){
		$("tbody td:nth-child(4)").find('button:contains("승인")').on("click", function(){
			alert($(this).val()+"미구현")
		})
		
		$("tbody td:nth-child(4)").find('button:contains("거절")').on("click", function(){
			alert($(this).val()+"미구현")
		})
			
	});

</script>
</head>
<body>
     <form name="detailForm">
     <div class="container"> 
     <input type="hidden" value="${studyNo}"/>
  
     	<div class="page-header text-default">
        	<h3 align="center">그룹스터디 참가신청 회원 목록</h3>
      	</div>

		<div class="row">
			<jsp:include page="../layout/sidebar.jsp"/>
				<div class="col-md-9 text-left">
            <p class="text-default">전체 ${totalCount} </p>
			<table class="table table-hover table-striped">
             	<thead>
             		<tr>
                    	<th align="center">닉네임</th>
                        <th align="center">신청동기</th>
                        <th align="center">각오</th>
                        <th align="center">승인여부</th>
                    </tr>
                </thead>
            <tbody>
                       <c:forEach var="gMember" items="${list}">
	               <tr>
	               	  <td align="left">${gMember.member.nickname}
	               	  <input type="hidden"
	                     value="${gMember.member.email}" /></td>
	                  <td align="left">${gMember.participationReason}</td>
	                  <td align="left">${gMember.determination}</td>
	                  <td align="left">
	                  	<c:choose>
	                  		<c:when test="${gMember.approvalFlag == 1}">
	                  			승인됨
	                  		</c:when>
	                  		<c:when test="${gMember.approvalFlag != 1}">
	                  			<button type="button"  value="${gMember.groupStudyMemberNo}" >승인</button>
	                  			<button type="button"  value="${gMember.groupStudyMemberNo}">거절</button>
	                  		</c:when>
	                  	</c:choose>
	                 </td>
	               </tr>
	            </c:forEach>
        				</tbody>
                  </table>
            
      		 </div>	
      		 
                  
                </div>
          </div> 
          
          </form>
</body>
</html>









