<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script type="text/javascript">

function count_ck(obj){
    var chkbox = document.getElementsByName("chk");
    var chkCnt = 0;
    for(var i = 0; i < chkbox.length; i++){
        if(chkbox[i].checked){
            chkCnt++;
        }
    }
    if(chkCnt>3){
    	showMessage("3개 이상 선택할 수 없습니다.");
        obj.checked = false;
        return false;
    }
}

function showMessage(text) {
    swal.mixin({
        toast: true,
        position: 'center',
        showConfirmButton: false,
        timer: 3000
      })({
          type:'error',
          title: text
      });
}

function showPopup(title, cont, type) {
    swal(title,
         cont,
         type);
}


	$(function(){
		$ ( "#btn1").on("click", function(){
			fncAddStudy();
		});
	});
	
	function fncAddStudy() {
		$("form").attr("method","POST").attr("action","/study/addStudy").submit();
	}
	
	$( function() {
		$('#sdate, #sdate1').datepicker();
		
		$('#sdate').datepicker("option", "maxDate", $("#edate").val());
		
		$('#sdate1').datepicker("option", "maxDate", $("#edate1").val());
		
		$('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
			$("#edate").datepicker( "option", "minDate", selectedDate );
		});
		
		$('#sdate1').datepicker("option", "onClose", function ( selectedDate ) {
			$("#edate1").datepicker( "option", "minDate", selectedDate );
		});
		$('#edate, #edate1').datepicker();
		
		$('#edate').datepicker("option", "minDate", $("#sdate").val());
		
		$('#edate1').datepicker("option", "minDate", $("#sdate1").val());
		
		$('#edate').datepicker("option", "onClose", function ( selectedDate ) {
			$("#sdate").datepicker( "option", "maxDate", selectedDate );
		});
		
		$('#edate1').datepicker("option", "onClose", function ( selectedDate ) {
			$("#sdate1").datepicker( "option", "maxDate", selectedDate );
		});
		
		
	
	});
	$.datepicker.regional['ko'] = {
	        closeText: '닫기',
	        prevText: '이전달',
	        nextText: '다음달',
	        currentText: '오늘',
	        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
	        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	        '7월','8월','9월','10월','11월','12월'],
	        dayNames: ['일','월','화','수','목','금','토'],
	        dayNamesShort: ['일','월','화','수','목','금','토'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	        weekHeader: 'Wk',
	        dateFormat: 'yy-mm-dd',
	        firstDay: 0,
	        isRTL: false,
	        showMonthAfterYear: true,
	        yearSuffix: '',
	        changeMonth: true,
	        changeYear: true,
	        yearRange: 'c-99:c+99',
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);
</script>

<style>
            #selectbox1 { display: none; }
            #selectbox1, div:#selectbox1 { display: none; }
            #selectbox1:checked ~ div:#selectbox1 { display: block; }
            #selectbox2 { display: none; }
            #selectbox2, div:#selectbox2 { display: none; }
            #selectbox2:checked ~ div:#selectbox2 { display: block; }
            
            #selectbox3 { display: none; }
            #selectbox3 ~ div:#selectbox3 { display: none; }
            #selectbox3:checked ~ div:#selectbox3 { display: block; }
            
            #selectbox4 { display: none; }
            #selectbox4 ~ div:#selectbox4 { display: none; }
            #selectbox4:checked ~ div:#selectbox4 { display: block; }
            
            #selectbox5 { display: none; }
            #selectbox5 ~ div:#selectbox5 { display: none; }
            #selectbox5:checked ~ div:#selectbox5 { display: block; }
            
            #selectbox6 { display: none; }
            #selectbox6 ~ div:#selectbox6 { display: none; }
            #selectbox6:checked ~ div:#selectbox6 { display: block; }
            
            #selectbox7 { display: none; }
            #selectbox7 ~ div:#selectbox7 { display: none; }
            #selectbox7:checked ~ div:#selectbox7 { display: block; }
            
            #selectbox8 { display: none; }
            #selectbox8 ~ div:#selectbox8 { display: none; }
            #selectbox8:checked ~ div:#selectbox8 { display: block; }
            
            #selectbox9 { display: none; }
            #selectbox9 ~ div:#selectbox9 { display: none; }
            #selectbox9:checked ~ div:#selectbox9 { display: block; }
            
            #selectbox10 { display: none; }
            #selectbox10 ~ div:#selectbox10 { display: none; }
            #selectbox10:checked ~ div:#selectbox10 { display: block; }
            section.buttons > label {
              display: block;
              text-align: center;
              line-height: 30px;
              border: 1px solid #dddddd;
              background: white;
              color: black;
              width: 160px; height: 45px;
              box-sizing: border-box;
              float: left;
              padding-top: 0.4em;
            }
            input:nth-of-type(1):checked ~ section.buttons >  label:nth-of-type(1) {
              border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(2):checked ~ section.buttons >  label:nth-of-type(2) {
               border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(3):checked ~ section.buttons >  label:nth-of-type(3) {
              border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(4):checked ~ section.buttons >  label:nth-of-type(4) {
                border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(5):checked ~ section.buttons >  label:nth-of-type(5) {
                border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(6):checked ~ section.buttons >  label:nth-of-type(6) {
                border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(7):checked ~ section.buttons >  label:nth-of-type(7) {
               border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(8):checked ~ section.buttons >  label:nth-of-type(8) {
               border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(9):checked ~ section.buttons >  label:nth-of-type(9) {
               border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            input:nth-of-type(10):checked ~ section.buttons >  label:nth-of-type(10) {
               border : 1px solid #ef6c00;
              color : #ef6c00;
            }
            
            section.buttons {
              /* border: 4px dashed red; */
              overflow: hidden;
            }

</style>



</head>
<body>
	<div class="container">
	
		<h1 class="bg-info text-center">스터디 개설</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		  <input type="hidden" name="currentMember"	value="1"/>
		  <input type="hidden" name="maxMember"	value="5"/>
		  <input type="hidden" name="email"	value="user07"/>
		  <input type="hidden" name="studyRole" value="3"/>
		
				   <div class="form-group">
		    <label for="studyThumbnail" class="col-sm-offset-1 col-sm-3 control-label">프로필 사진</label>
		    <div class="col-xs-3">
		      <input type="text" id="studyThumbnail" name="studyThumbnail">
		    </div>
		  </div>
		
		
		
		
		  <div class="form-group">
		    <label for="studyName" class="col-sm-offset-1 col-sm-3 control-label">닉 네 임</label>
		    <div class="col-sm-4" >
		      <input type="text" class="form-control" id="nickname" name="nickname" value="${user.nickname}" placeholder="닉네임">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="studyRoomGrade" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="name" name="name" value="${user.name}" placeholder="이름">
		    </div>
		  </div>
		 
		 <div class="radio">
  <label>
    <input type="radio" name="gender" id="gender" value="${user.gender}" checked>
    남성
  </label>
</div>
<div class="radio">
  <label>
    <input type="radio" name="gender" id="gender" value="${user.gender}">
    여성
  </label>
</div>
<div class="radio disabled">

</div>
		 
		 
		  
		  <div class="form-group">
		  	<label for="studyHashtag" class="col-sm-offset-1 col-sm-3 control-label">모집 기간</label>
		    <span class="col-sm-4">
		      <input type="text" class="form-control" id="sdate" name="recruitmentStartDate" placeholder="모집 시작일자">
		    </span>
		  </div>
		  

		  
		  

		  
		  <div class="form-group">
		    <label for="studyInterest" class="col-sm-offset-1 col-sm-3 control-label">관 심 사</label>
		    <div class="col-xs-3">
		      <input type="text" id="studyInterest" name="studyInterest">
		    </div>
		  </div>
		  
		  
		               <div class="col-sm-10 container-box">
                <div class="inner-container-box">
                    <h3>관심 분야 설정</h3>
                    <hr>
                    관심사는 총 3개까지 설정하실 수 있습니다.<br>
        <form>            
            <input id="selectbox1" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox2" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox3" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox4" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox5" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox6" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox7" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox8" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox9" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox10" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <section class="buttons">
                <label for="selectbox1">어학</label>
                <label for="selectbox2">공무원</label>
                <label for="selectbox3">자격증</label>
                <label for="selectbox4">취업</label>
                <label for="selectbox5">자기계발</label>
                <label for="selectbox6">독서</label>
                <label for="selectbox7">임용</label>
                <label for="selectbox8">기타</label>
            </section>
            <hr style="margin-top : 2em">
    </form>
                    <br>
                    <button class="btn btn-primary" id="saveBtn">저장</button>
                </div>

            </div>
        </div>
    </div>
 </div>
		  
		  
		  
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="btn1" class="btn btn-info"  >등 &nbsp;록</button>
			  <a class="btn btn-info btn" href="/" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
</body>
</html>