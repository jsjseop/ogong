<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소켓 서버</title>




<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.js"></script>
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.css"  rel='stylesheet'/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>

<style type="text/css">
#chat{
	bottom: 20px;
	right: 20px;
	position: fixed;
}
#attendance{
	top: 20px;
	right: 20px;
	position: fixed;
}
</style>
</head>


<body>
	
	<form>
		<input type="hidden" id="studyNo" value="${studyNo}">
		<input type="hidden" id="email" value="${email}">
	</form>
	<button id="attendance">출 석</button>
	<button id="chat">채팅하기</button>
     
	
	<div style="float:center;width:600px;margin:auto;"id='calendar'></div>

	
<script type="text/javascript">

	document.addEventListener('DOMContentLoaded', function() {
		
		var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	dafaultDate : "2021-07-19",
 			editable : true,
 			eventLimit : true,
 			events: [
 				{
 					title : "long event",
 					start : "2021-07-01",
 					end : "2021-07-03"
 				},
 			]
	    });
	    calendar.render();
	});

	$(function (){
    	
    	
    	var studyNo= $('#studyNo').val();
    	var email= $('#email').val();
    	
    	
    	$("#chat").on("click", function (){
    		popWin = window.open("/studyroom/chat?studyNo="+studyNo+"&email="+email,
					"popWin",
					"left=600, top=700, width=770, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
    	
    	});
    	
    	$('#attendance').on("click", function(){

    		$.ajax({
    			type: 'post',
    			url: "/studyroom/json/addAttendance",
    			data: {
    				email: email,
    				studyNo: studyNo
    			},
    			dataType : "text",
    			success: function (data, status){
					
    				if(data == null){
    					alert("출석 체크 되었습니다.");
    				}else if (data != null){
    					alert("이미 출석 체크 하셧습니다.");
    				}
    				
    				
    			}
    		});
    		
    	});
    	
    	 
    });
	
	
	
</script>
</body>
</html>