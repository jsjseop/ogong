<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
<%
	Product product = (Product)request.getAttribute("product");
%>
 --%>
<!DOCTYPE html>
<html lane="ko">
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<meta charset="EUC-KR">
	
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->   
   
	<script type="text/javascript">
	/*function fncAddProduct(){		
		document.detailForm.action='/updateProduct.do';
		document.detailForm.submit();
	}*/
	
	function fncupdateUserSuspend(){
		
		
		$('form').attr("method", "POST").attr("action", "/admin/updateSuspendUser").submit();
	}
	
	$('.radio-value').on('click', function() {
	    var suspendType = $('.radio-value:checked').val(); // 체크된 Radio 버튼의 값을 가져옵니다.
	    
	    if ( suspendType == '1' ) {
	        $('.radio-value-detail').attr('suspendType', 1);
	        $('.radio-value-detail').focus(); 
	    } else if ( suspendType == '2' ) {
	        $('.radio-value-detail').attr('suspendType', 2); 
	        $('.radio-value-detail').focus();
	    } else if ( suspendType == '3' ) {
	        $('.radio-value-detail').attr('suspendType', 3);
	        $('.radio-value-detail').focus(); 
	    }
	});
	
	
	
	$(function(){
		
		$( "button.btn.btn-primary" ).on("click" , function() {
			var email = $('#email').val()
			alert(email);
			fncupdateUserSuspend();
		});
		
		$("a[href='#' ]").on("click" , function() {
			$("form")[0].reset();
		});
		
	});
	
	//<form name="updateProduct" method="post" action="/product/updateProduct">
</script>
</head>



<body>

	<jsp:include page="../common/toolbar.jsp" />
	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">사용자 정지</h3>
	    </div>		
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" method="post" name="updateSuspendUser">
			<input type="hidden" id="email" name="email" value="${receiveReporter}"/>	  
		  <fieldset>
   				 <legend>정지 일자 선택 </legend>
   				 <label for="radio-1 ">7일</label>
    			 <input type="radio" class="radio-value" name="suspendType" id="suspendType" value="1">
   				 <label for="radio-2">30일</label>
   				 <input type="radio" class="radio-value" name="suspendType" id="suspendType" value="2">
   				 <label for="radio-3">영구정지</label>
    			 <input type="radio" class="radio-value" name="suspendType" id="suspendType" value="3">
  		</fieldset>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >정 &nbsp;지</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		  
		</form>		  		  	  	  		  		
		
	</div>



</body>
</html>