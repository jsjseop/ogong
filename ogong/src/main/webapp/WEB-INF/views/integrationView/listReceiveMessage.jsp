<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

 
<!DOCTYPE html>
<html lang="en">
  <head>


	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   	
    
    <link rel="canonical" href="https://getbootstrap.com/docs/3.3/examples/dashboard/">
	
    

    <!-- Bootstrap core CSS -->
    
 	<link href="/resources/css/bootstrap3.3.7.css" rel="stylesheet">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/css/dashboard.css" rel="stylesheet">

    <script src="/resources/javascript/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
	<style>
        body {
            padding-top : 70px;
        }       
   	</style>
	<style>
 
		
 		@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');
		
		body, 
		table, 
		div, 
		p, 
		th, 
		td{
		font-family: 'Do Hyeon', sans-serif;
		}
		
				
   	</style>   	
   	
	<script type="text/javascript">
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/integration/listSendMessage").submit();
	}

	$(function(){
		
		$("ul li:nth-child(2)").on("click", function(){
			$("#myModal2").find('#receiver').val($(this).find('input').val());
		});

		$("ul li:nth-child(3)").on("click", function(){
			$("#myModalReport").find('#receiveReporter').val($(this).find('input').val());
		});		
	
	})		
	
	
	$(function(){
		
			
	 	$( "button:contains('보낸쪽지함')" ).on("click" , function() {
	 		location.href = "/integration/listSendMessage";
		});
	 	$( "button:contains('받은쪽지함')" ).on("click" , function() {
	 		location.href = "/integration/listReceiveMessage";
		});
	 	

	 	
	})
	
	$(function(){
				
		
		
		
 		$("#deletebtn").on("click" , function() {

 		 	
  			
 			  var messageArr = new Array();
   				
 		 	 $("input[class='messageNo']:checked").each(function(){
 		 		messageArr.push($(this).val());
 			 });
 		 	 
 		  		$.ajax({
		  			 	 url : "/integration/deleteTest",
			  		  	 type : "POST",
		  		  	 	 data : { messageNo : messageArr },
		    		 	 success : function(result){
		   		   	 	 	if(result == 1){
		    		 		 	location.href = "/integration/listSendMessage";
		   		   	 	 	} else {
		   		   	 	 		alert("삭제 실패")
		   		   	 	 	}
		   		   	 		
		  		  	 	}
		  		  	 	 
  		  		});
 		  		alert("삭제가 완료되었습니다.")
 		  		$("input[class='messageNo']:checked").parent().parent().parent().remove();
 		});
 		
 		
 		$("#deletebtn2").on("click" , function() {
 			
 			var messageDelete = $(".deleteMessage").val()
			
			
 			
			$.ajax({
				
				url : "/integration/json/deleteMessage/"+messageDelete,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status){
					
				}
			});
			alert("삭제가 완료되었습니다.")
			$("#trRemove").remove();
 			
 		});
 		
 		$("button[name='refresh']").on("click", function(){
 			location.href = "/integration/listReceiveMessage";
 		});
 		

 		
	})
	</script>    
    
  </head>

  <body>

	<jsp:include page="../common/toolbar.jsp" />
	<jsp:include page="../integrationView/addSendMessage.jsp" />
	<jsp:include page="../integrationView/addSendMessage2.jsp" />
	<jsp:include page="../adminView/addReport.jsp" />
	
    <div class="container-fluid">
      <div class="row">

        <div class="col-sm-3 col-md-2 sidebar">
       
	      	<button type="button" style="width: 120px; " id="myButton" class="btn btn-primary col-md-1" data-toggle="modal" data-target="#myModal" >
	  			쪽지보내기
			</button>
  
	      	<button type="button" style="width: 120px;" id="myButton" class="btn btn-primary" >
	  			받은쪽지함
			</button>
			
	      	<button type="button" style="width: 120px;" id="myButton" class="btn btn-primary" >
	  			보낸쪽지함
			</button>
			
		
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          
          <h2 class="sub-header">받은쪽지함</h2>
          <div class="table-responsive">
            <table class="table table-bordered">
              <thead>
					<div class="btn-toolbar" role="toolbar" >
       					<div class="btn-group" role="group" >				
       						<div class="allCheck">
								&nbsp&nbsp<input style="zoom:2.0;" type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck"></label>
									<script>
										$("#allCheck").click(function() {
											var chk = $("#allCheck").prop("checked");
											if (chk) {
												$('.messageNo').prop("checked", true);
											} else {
												$('.messageNo').prop("checked", false);
											}
										});
									</script>
							</div>
						</div>
						<div class="btn-group" role="group">
       							<button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal" data-target="#exampleModal">
       								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
       							</button>	       							
						</div>
					    <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default" name="refresh" aria-label="Left Align">
							      <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
							    </button>					  	
					    </div>
					    
						<div class="text-right" style="font-size:15px;">
							<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage} 페이지</p>
						</div>					    
					    						
					  	

					</div>
              </thead>
              <tbody>
                <tr>

	    	  <c:if test="${ ! empty list}">
		 	 	<c:set var="i" value="0" />
		  		<c:forEach var="message" items="${list}">
		  			<tr id="trRemove">
			  			<td align="left">
			  				<div class="checkBox">
			  					&nbsp<input style="zoom:1.5;" type="checkbox" class="messageNo" name="messageNo"  value="${message.messageNo}"/>
									<script>
										$(".messageNo").click(function() {
											$("#allCheck").prop("checked", false);
										});
									</script>		  					
							</div>
						</td>
						<td align="left">
							<div class="dropdown">
								<a id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
									${message.sender.email}
								</a>
								  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">프로필보기</a></li>
								    <li role="presentation"><a role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#myModal2">쪽지보내기
								    <input type="hidden" value="${message.sender.email}" /></a></li>
								    <li role="presentation"><a role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#myModalReport">신고하기
								    <input type="hidden" value="${message.sender.email}" /></a></li>
								  </ul>									
							</div>
						</td>								  			
			  			<td align="left">${message.messageContents}</td>
			  			<td align="left">${message.sendDate}</td>
						<td align="left">
							<div class="delete">
	    						<button type="button" class="deleteMessage" name="deleteMessage"  value="${message.messageNo}" data-toggle="modal" data-target="#exampleModal2">삭제</button>
	   						</div>
			  			</td>
		  			
		  			</tr>
		  		</c:forEach>
		  	  </c:if>
				  <c:if test="${empty list }">
				  	<tr>
				  		<td align="center">	</td>
				  		<td align="center"></td>
				  		<td align="center"> 쪽지가 없습니다. </td>
				  	</tr>
				  </c:if>		  	  
                </tr>

              </tbody>
            </table>
            					<div class="btn-toolbar" role="toolbar" >
       					<div class="btn-group" role="group" >				
       						<div class="allCheck">
								&nbsp&nbsp<input style="zoom:2.0;" type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck"></label>
									<script>
										$("#allCheck").click(function() {
											var chk = $("#allCheck").prop("checked");
											if (chk) {
												$('.messageNo').prop("checked", true);
											} else {
												$('.messageNo').prop("checked", false);
											}
										});
									</script>
							</div>
						</div>
						<div class="btn-group" role="group">
       							<button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal" data-target="#exampleModal">
       								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
       							</button>	       							
						</div>
					    <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default" name="refresh" aria-label="Left Align">
							      <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
							    </button>					  	
					    </div>
					    
						<div class="text-right" style="font-size:15px;">
							<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage} 페이지</p>
						</div>
						<div class="row">						
						    <div class="col-md-6 text-right">
							    <form class="form-inline" name="detailForm">
							      
								  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
								  <input type="hidden" id="currentPage" name="currentPage" value=""/>
								  
								</form>
					    	</div>				
							
						</div>											    
					    						
					  	

					</div>
		 <!-- Modal 쪽지 선택삭제-->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">선택삭제</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        선택한 쪽지을 정말 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			      	<button type="button" id="deletebtn" class="btn btn-primary" data-dismiss="modal">삭제하기</button>
			       	<button type="button" class="btn btn-primary" data-dismiss="modal">취소하기</button>
			      </div>
			    </div>
			  </div>
			</div>	
			
		 <!-- Modal 쪽지 삭제-->
			<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel2">삭제</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        쪽지을 정말 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			      	<button type="button" id="deletebtn2" class="btn btn-primary" data-dismiss="modal">삭제하기</button>
			       	<button type="button" class="btn btn-primary" data-dismiss="modal">취소하기</button>
			      </div>
			    </div>
			  </div>
			</div>            
            
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
    
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="/resources/javascript/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/javascript/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>