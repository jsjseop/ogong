<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="/resources/css/join.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<form id="join_form" method="post" ">
	<div class="wrap">
			<div class="subjecet">
				<span>회원가입</span>
			</div>
			
			
			
			

			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="email">
				</div>
				<span class="final_mail_ck">이메일을 입력해주세요.</span>
				<sapn class="mail_input_box_warn"></sapn>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span>
				</div>
			</div>
		
			<div class="join_button_wrap">
				<input type="button" class="join_button" value="가입하기">
			</div>
		</div>
	</form>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

var code = "";				//이메일전송 인증번호 저장위한 코드

 /* 유효성 검사 통과유무 변수 */
/*  var idCheck = false;			// 아이디
 var idckCheck = false;			// 아이디 중복 검사
 var pwCheck = false;			// 비번
 var pwckCheck = false;			// 비번 확인
 var pwckcorCheck = false;		// 비번 확인 일치 확인
 var mailCheck = false;			// 이메일
 var mailnumCheck = false;		// 이메일 인증번호 확인 */

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		$(".join_button").click(function() {
			$("#join_form").attr("action", "addUser");
			$("#join_form").submit();
		})
		
		

		
		
		
		
		
		/* 입력값 변수 */
		var id = $('.id_input').val(); 				// id 입력란
		var pw = $('.pw_input').val();				// 비밀번호 입력란
		var pwck = $('.pwck_input').val();			// 비밀번호 확인 입력란
		var mail = $('.mail_input').val();			// 이메일 입력란
		
		
		

		
		/* 이메일 유효성 검사 */
		
		if(mail == ""){
			$('.final_mail_ck').css('display','block');
			mailCheck = false;
		}else{
			$('.final_mail_ck').css('display', 'none');
			mailCheck = true;
		}		
		
		
		
		/* 최종 유효성 검사 */
		if(mailCheck&&mailnumCheck ){

			$("#join_form").attr("action", "/member/join");
			$("#join_form").submit();			
			
		}		
		
		return false;

	});
});


/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
	
	var email = $(".mail_input").val();			// 입력한 이메일
	var cehckBox = $(".mail_check_input");		// 인증번호 입력란
	var boxWrap = $(".mail_check_input_box");	// 인증번호 입력란 박스
	var warnMsg = $(".mail_input_box_warn");	// 이메일 입력 경고글
	
	/* 이메일 형식 유효성 검사 */
	if(mailFormCheck(email)){
		warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
		warnMsg.css("display", "inline-block");
	} else {
		warnMsg.html("올바르지 못한 이메일 형식입니다.");
		warnMsg.css("display", "inline-block");
		return false;
	}	
	
	$.ajax({
		
		type:"GET",
		url:"mailCheck?email=" + email,
		success:function(data){
			
			//console.log("data : " + data);
			cehckBox.attr("disabled",false);
			boxWrap.attr("id", "mail_check_input_box_true");
			code = data;
			
		}
				
	});
	
});

/* 인증번호 비교 */
$(".mail_check_input").blur(function(){
	
	var inputCode = $(".mail_check_input").val();		// 입력코드	
	var checkResult = $("#mail_check_input_box_warn");	// 비교 결과 	
	
	if(inputCode == code){							// 일치할 경우
		checkResult.html("인증번호가 일치합니다.");
		checkResult.attr("class", "correct");		
		mailnumCheck = true;
	} else {											// 일치하지 않을 경우
		checkResult.html("인증번호를 다시 확인해주세요.");
		checkResult.attr("class", "incorrect");
		mailnumCheck = false;
	}	
	
});



/* 비밀번호 확인 일치 유효성 검사 */

$('.pwck_input').on("propertychange change keyup paste input", function(){
	
	var pw = $('.pw_input').val();
	var pwck = $('.pwck_input').val();
	$('.final_pwck_ck').css('display', 'none');
	
	if(pw == pwck){
		$('.pwck_input_re_1').css('display','block');
		$('.pwck_input_re_2').css('display','none');
		pwckcorCheck = true;
	}else{
		$('.pwck_input_re_1').css('display','none');
		$('.pwck_input_re_2').css('display','block');
		pwckcorCheck = false;
	}
	
	
});





 /* 입력 이메일 형식 유효성 검사 */
 function mailFormCheck(email){
	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return form.test(email);
}

</script>

</body>
</html>