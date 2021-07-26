<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">


	
<head>


	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <!-- <link href="/resouces/css/animate.min.css" rel="stylesheet"> -->
   <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="../css/mainBack.css" >
	
	
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
  	<script type="text/javascript">
		 $(function() {
			 	$("a:contains('로그아웃')").on("click" , function() {
					$(self.location).attr("href","/user/logout");
					//self.location = "/user/logout"
				}); 
		});
		
		 
		 $.ajax(
				 {
 					url : "/integration/json/listBananaRanking/",
 					method : "GET" ,
 					dataType : "json" ,
 					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"	 						
 					} ,
 					
 					success : function(JSONData, status){
 						alert(JSONData);	
 					}
				 });
		 
		 
 	 </script> 

</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<div class="contatiner">
		<table class="table table-bordered">
		  	<thead>   
		  	    <tr>	       		
   					<th align="center">1~5 위</th>
   					<th align="left">닉네임</th>
   					<th align="left">채택수</th>
	    		</tr>
	    	</thead>
	    	<tbody class="ct_list_pop">
	    		<c:set var="i" value="0"/>
	    		<c:forEach var="answer" items="${list}">
	    			<c:set var="i" value="${i+1}"/>
				    		<tr>
				    			<td align="center">${i}위</td>
				    			<td align="left">${answer.answerWriter.email}</td>
				    			<td align="left">${answer.adoptionCount}</td>
				    		</tr>
	    		</c:forEach>
	    	</tbody>	
		</table>
		
		<table class="table table-bordered">
		  	<thead>   
		  	    <tr>	       		
   					<th align="center">1~5 위</th>
   					<th align="left">닉네임</th>
   					<th align="left">바나나 수</th>
	    		</tr>
	    	</thead>
	    	<tbody class="ct_list_pop">
		 	 	<c:set var="i" value="0" />
		  		<c:forEach var="user" items="${list2}">
		  			<c:set var="i" value="${ i+1 }" />
		  			<tr>
			  			<td align="center">${i}위</td>
			  			<td align="left">${user.nickname}</td>
			  			<td align="left">${user.bananaCount}</td>
		  			</tr>
		  		</c:forEach>
	    	</tbody>	
		</table>
				
	</div>

  	 

</body>

</html>