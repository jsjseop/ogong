<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<head>
<script src="https://kit.fontawesome.com/e3409dba93.js"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap')
	;

body, table, div, p, th, td {
	font-family: 'Do Hyeon', sans-serif;
}
</style>

</head>

<body>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	

	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
	
	<body>

	
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

</body>

