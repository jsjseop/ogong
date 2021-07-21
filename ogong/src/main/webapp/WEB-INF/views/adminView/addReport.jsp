<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>    
<html>
<head>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
	
<script type="text/javascript">



	
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#btn1" ).on("click" , function() {
				fncAddReport();
			});
		});	
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		function fncAddReport(){
			//Form 유효성 검증
		 	//var name = document.detailForm.prodName.value;
			//var detail = document.detailForm.prodDetail.value;
			//var manuDate = document.detailForm.manuDate.value;
			//var price = document.detailForm.price.value;
		
			var reportReason = $("input[name='reportReason']").val();
			
			if(reportReason == null || reportReason.length<1){
				alert("신고사유 반드시 입력하여야 합니다.");
				return;
			}

		
			$("form").attr("method", "POST").attr("action", "/admin/addReport").submit();
			
		}
//	$( function() {
//		    $( "#manuDate" ).datepicker();
//	});


</script>
</head>

<body>
	
	<jsp:include page="../common/toolbar.jsp" />

	<div class="container">
		
		<h1 class="bg-primary text-center">신 고 하 기</h1>
	
<form class="form-horizontal" method="post" name="addReport" >

		  <!-- 신고사유 -->
		  <div class="form-group">
		    <label for="reportReason" class="col-sm-offset-1 col-sm-3 control-label">신 고 사 유</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="reportReason" name="reportReason" placeholder="신고 사유를 작성하세요">
		    </div>
		  </div> 
  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="btn1" class="btn btn-info"  >신 &nbsp;고</button>
			  <a class="btn btn-info btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
</form>

</div>
</body>
</html>









