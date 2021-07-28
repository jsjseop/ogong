<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>

	<meta charset="EUC-KR"><!-- 1 -->
	
	
	
	
	<!-- ÂüÁ¶ : http://getbootstrap.com/css/   ÂüÁ¶ -->
<<<<<<< HEAD
=======
	<meta name="viewport" content="width=device-width, initial-scale=1.0" /><!-- 2 -->
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.6/css/bootstrap.min.css" ><!-- 3 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.6/css/bootstrap-theme.min.css" ><!-- 4 -->
	
	
	<link rel="stylesheet" type="text/css" href="../css/mainBack.css" >
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script><!-- 5 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.6/js/bootstrap.min.js" ></script><!-- 6 -->
<<<<<<< HEAD
=======
>>>>>>> refs/remotes/origin/í…ŒìŠ¤íŠ¸
=======
>>>>>>> refs/heads/ì—°ìŠµìš©2
>>>>>>> refs/heads/í…ŒìŠ¤íŠ¸
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet"><!-- 8 -->
   
   
   
   
   
    <!-- Bootstrap Dropdown Hover JS -->
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	
	<!-- 11 -->
	<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');body, table, div, p, th, td{
font-family: 'Do Hyeon', sans-serif;
}
        
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript"><!-- 12 -->
		
		//============= È¸¿øÁ¤º¸¼öÁ¤ Event  Ã³¸® =============	
		$(function() {
			//==> DOM Object GET 3°¡Áö ¹æ¹ý ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button[name='±¸¸Å']" ).on("click" , function() {
					alert("ÃßÈÄ¾÷µ¥ÀÌÆ®")	
				});
			
		});
		
		 $(function() {
		//	 $( "button[name='ÀÌÀü']" ).on("click" , function() {
			$( "button[name='ÀÌÀü']"  ).on("click" , function() {	 
				
				 self.location = "/product/listProduct?menu=search";
				});
		 });
	</script>
	
</head>


<body>
<form name="detailForm" method="post">

	<!-- ToolBar Start /////////////////////////////////////-->
 	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
 
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  È­¸é±¸¼º div Start /////////////////////////////////////-->
	
	<div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
        <p>One fine body&hellip;</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
	
	
	
	<div class="container">
	
		<div class="page-header">
	      <h1>${user.nickname}´ÔÀÇ ÇÁ·ÎÇÊ</h1>
	    </div>
	
			  <input type="hidden" name="email"	value="${user.email}"/>  <!--  È÷µç°ª -->
	
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>´Ð³×ÀÓ</strong></div>
			<div class="col-xs-8 col-md-4">${user.nickname}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>ÀÌ¸§</strong></div>
			<div class="col-xs-8 col-md-4">${user.name}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>»ý³â¿ùÀÏ</strong></div>
			<div class="col-xs-8 col-md-4">${user.birth}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>¸ñÇ¥¿Í °¢¿À</strong></div>
			<div class="col-xs-8 col-md-4">${user.goal}</div>
			
		</div>
		<hr>
				<div class="row">
				
				
	  		<div class="col-xs-4 col-md-2"><strong>°ü½É»ç</strong></div>

			  <button type="button" class="btn btn-default btn-lg">${user.studyInterest1}</button>
					  <button type="button" class="btn btn-default btn-lg">${user.studyInterest2}</button>
					  <button type="button" class="btn btn-default btn-lg">${user.studyInterest3}</button>
			
		</div>
		
		

		

		
		<br/>
		
 	</div>
 	<!--  È­¸é±¸¼º div Start /////////////////////////////////////-->
</form>
</body>

</html>