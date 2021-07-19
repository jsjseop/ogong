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
				fncAddSendMessage();
			});
		});	
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		function fncAddSendMessage(){
			//Form 유효성 검증
		 	//var name = document.detailForm.prodName.value;
			//var detail = document.detailForm.prodDetail.value;
			//var manuDate = document.detailForm.manuDate.value;
			//var price = document.detailForm.price.value;
			var sender = "${message.sender.email}";
			var receiver = $("input[name='receiver.email']").val();
			var messageContents = $("input[name='messageContents']").val();
			
			
		/* 	if(receiver == null || receiver.length<1){
				alert("수신자 이메일은 반드시 입력해야 합니다.");
				alert(receiver);
				return;
			}
			
			if(messageContents == null || messageContents.length<1){
				alert("보낼 내용은 반드시 입력해야 합니다.");
				alert(messageContents);
				return;
			} */
			alert(sender);
			alert(receiver);
			alert(messageContents);
			
			$("form").attr("method", "POST").attr("action", "/integration/addSendMessage").submit();
			
		}
//	$( function() {
//		    $( "#manuDate" ).datepicker();
//	});


</script>
</head>

<body>
	


	<div class="container">
		
		<h1 class="bg-primary text-center">쪽지보내기</h1>
	
<form class="form-horizontal" method="post" name="addSendMessage" >

  <!-- 발신자 이메일 출력 -->
  <div class="form-group">
    <label for="message.sender.email" class="col-sm-offset-1 col-sm-3 control-label">발신자 이메일</label>
    <input type="hidden" name="sender.email" value="${message.sender.email}"/>
    <div class="col-sm-4">${message.sender.email}</div>
  </div> 
  
  <!-- 수신자 이메일 입력 -->
   <div class="form-group">
    <label for="message.receiver.email" class="col-sm-offset-1 col-sm-3 control-label">수신자 이메일</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="message.receiver.email" name="receiver.email" placeholder="받는 사람 이메일을 입력하세요">
    </div>
  </div>
  
  <!-- 내용 입력 -->
   <div class="form-group">
    <label for="messageContents" class="col-sm-offset-1 col-sm-3 control-label">내용</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" rows="15" id="messageContents" name="messageContents" placeholder="내용을 입력해 주세요.">
    </div>
  </div>  
  
  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="btn1" class="btn btn-info"  >보&nbsp;내&nbsp;기</button>
			  <a class="btn btn-info btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
</form>

</div>
</body>
</html>