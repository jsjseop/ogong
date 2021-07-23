<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 메인</title>
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.css"  />

<script src="https://code.jquery.com/jquery-3.2.1.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>

<style type="text/css">
body {
    padding-top : 70px;
}
#chat{
	bottom: 20px;
	right: 20px;
	position: fixed;
}
#attendance{
	right: 20px;
	top : 90px;
	position: fixed;
}
#calendar{
	float:center;
	width: 600px;
	margin: auto;
	padding-top : 50px;
}
.fc-toolbar-chunk {
  display: flex; /* 일렬로 나란히 */
  align-items: center;/*  수직 가운데 정렬 */
}
#edit-desc{
	margin: 0px;
	width: 570px;
	height: 160px;
}
</style>
</head>


<script type="text/javascript">
$(function () {
	
	$('#start').datetimepicker({
	    format: 'YYYY-MM-DD HH:mm',
	    minDate: moment()
	});
	
	$('#end').datetimepicker({
		format: 'YYYY-MM-DD HH:mm',
		minDate: moment()
	});

});

</script>

<body>

	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
		
		<form>
			<input type="hidden" id="studyNo" value="${studyNo}">
			<input type="hidden" id="email" value="${user.email}">
		</form>
		<button id="attendance">출 석</button>
		<button id="chat">채팅하기</button>
	     
		
		<div id='calendar'></div>
	

	<!-- 모달창 -->
	 <div class="modal fade" tabindex="-1" role="dialog" id="myModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">일정 등록</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="calendarTitle" id="title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="calendarStartDate" id="start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="calendarEndDate" id="end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">일정 내용</label>
                                <textarea class="inputModal" name="calendarContents"
                                    id="contents"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save">저장</button>
                    </div>
                    <!-- <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div> -->
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
	
	
	
<script type="text/javascript">

	function update(info){
		var id = info.event.id;
		var start = info.event.start;
		var end = info.event.end;
		var title = info.event.title;
		
		var msg;
		/* alert(JSON.stringify(info));
		alert("id :"+id);
		alert("start :"+start);
		alert("end :"+end);
		alert("title :"+title); */
		$.ajax({
			type : 'post',
			data : JSON.stringify({
				calendarNo : id,
				calendarTitle : title,
				calendarStartDate : start,
				calendarEndDate : end
			}),
			datatype : 'json',
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			async : false,
			url : "/studyroom/json/updateCalendar",
			success : function(result) {
				if (result == true){
					msg = "수정되었습니다.";
				} else {
					msg = '수정에 실패했습니다';
				}
			},
			error : function(xhr, status, error){
				msg = error; 
			}
		});
		return msg;
	}

	document.addEventListener('DOMContentLoaded', function() {
		
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, { 
			locale : 'ko', 
			timeZone : 'local',
			dayMaxEventRows: true,
			views : { 
				  timeGrid: {
				      dayMaxEventRows: 3 // 날짜당 최대 보여줄수 있는 일정 갯수  3개 이상은 +more로 보임
				    }
			},
			views : {
                month : {
                  columnFormat : 'dddd'
                },
                agendaWeek : {
                  columnFormat : 'M/D ddd',
                  titleFormat  : 'YYYY년 M월 D일',
                  dayMaxEventRows   : false
                },
                agendaDay : {
                  columnFormat : 'dddd',
                  dayMaxEventRows   : false
                },
                listWeek : {
                  columnFormat : ''
                }
            },
			customButtons: {
			    addButton: {
			    	text: '일정 등록',
			    	click: function() {
			     		$("#myModal").modal("show");
			     		
			     		$("#save").on("click", function(){
			     			
			     			var title = $('#title').val();
			     			var startDate = $('#start').val();
			     			var endDate = $('#end').val();
			     			var contents = $('#contents').val();
			     			var studyNo = $('#studyNo').val();
			     			
			     			var calendar = {calendarTitle:title,	
			     					calendarStartDate:startDate,
			     					calendarEndDate:endDate,
			     					calendarContents:contents,
			     					};
			     			var study = {studyNo:studyNo};
			     			
			     			var list = [calendar=calendar, studyNo=study];
			     			
			     			alert(JSON.stringify(list));
			     			if(title == null || title == ""){
			     				alert("제목을 입력 하세요");
			     			} else if (startDate == "" || endDate == ""  ){
			     				alert("날짜를 입력하세요.");
			     			} else {
			     				
			     				$.ajax({
				     				type: 'post',
				     				url: '/studyroom/json/addCalendar',
				     				data : JSON.stringify(list),
				     				headers : {
				     					"Accept" : "application/json",
				     					"Content-Type" : "application/json"
				     				},
				     				datatype : 'json',
				     				success : function(data) {
				     					if (data == true){
				     						alert("등록 완료");
				     						$("#myModal").modal("hide");
				     					}
				     				},
				     				error:function(request, status, error){
										
										alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
									}		
				     			});	
			     			}	
			     		});	     		
			     	}
			    }
			},
			headerToolbar: { 
				left: 'today addButton', 
				center: 'prev title next', 
				right: 'dayGridMonth,timeGridWeek,timeGridDay' 
			},
			buttonText:{
				today : "오늘",
				month : '월',
				week : '주',
				day : '일',
				list : '주간 일정표'
			},
			initialDate: '2021-07-20', 
			navLinks: true,
			selectable: true, 
			selectMirror: true, 
			select: function(arg) { 
				console.log(arg); 
				
				var title = prompt('입력할 일정:'); 
				if (title) { 
					calendar.addEvent({
						title: title,
						start: arg.start,
						end: arg.end,
						allDay: arg.allDay,
						backgroundColor:"yellow",
						textColor:"blue" 
					}) 
				} 
			calendar.unselect() 
		},
		eventDrop : function(info){
			if(confirm("수정 하시겠습니까?")){
				var msg = update(info);
				alert(msg);
			} else {
				info.revert();
			}
		},
		eventResize : function(info){
			if (confirm("수정 하시겠습니까?")){
				var msg = update(info);
				alert(msg);
			} else {
				info.revert();
			}	
		},
		eventClick: function(arg) {
			console.log("#등록된 일정 클릭#"); 
			if (confirm('일정을 삭제 하시겠습니까??')) {
				alert(arg.event.id);
				$.ajax({
					type : 'get',
					url : "/studyroom/json/deleteCalendar/"+arg.event.id,
					datatype : 'text',
					success : function (result){
						
						if(result == true) {
							alert("일정 삭제 완료");
							arg.event.remove(); 
						}
					},
					error:function(request, status, error){
						
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			} 
			
		},
		editable: true, 
		dayMaxEvents: true, 
		events: function(info, successCallback, failureCallback){
			
			$.ajax({
				type:"get",
				url:"/studyroom/json/getCalendarList/"+${studyNo},
				dataType:"json",
				success : function(data) {
					alert(JSON.stringify(data));
					var events = [];
					$.each(data, function(index, data){

						events.push({
							id : data.calendarNo,
							title: data.calendarTitle,
							start: data.calendarStartDate,
							end: data.calendarEndDate,
							backgroundColor:"yellow",
							textColor:"blue" 
						});
					});
					
					successCallback(events);
				}
			
			});
		},
		eventTimeFormat: {
			hour: '2-digit',
			minute: '2-digit',
			hour12: false
		}
			
	}); 
		calendar.render();
	});
	
	///////////////////////채팅 과 출석체크//////////////////////////

	$(function (){
    	
		
    	var studyNo= $('#studyNo').val();
    	var email= $('#email').val();
    	
    	
    	$("#chat").on("click", function (){
    		popWin = window.open("https://ogong-chat.herokuapp.com/chat?studyNo="+studyNo+"&email="+email,
					"popWin",
					"left=600, top=700, width=770, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
    	
    	});
    	
    	$('#attendance').on("click", function(){

    		$.ajax({
    			url: "/studyroom/json/addAttendance/"+studyNo,
    			method : "GET" ,
    			dataType : "text",
    			success: function (data, status){

    				if(data == ""){
    					alert("출석 체크 완료");
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