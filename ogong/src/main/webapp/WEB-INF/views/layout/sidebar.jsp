<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$( function (){
		$("a:contains('스터디룸 정보조회')").on("click", function(){
			self.location = "/studyroom/getStudyroomInfo?studyNo="+${studyNo}
		});
		
		$("a:contains('참가신청')").on("click", function(){
			self.location = "/studyroom/listParticipation?studyNo="+${studyNo}
		});
		
		$("a:contains('스터디원')").on("click", function(){
			self.location = "/studyroom/listGSMember?studyNo="+${studyNo}
		});
	});
</script>

</head>
<body>


        <div class="col-sm-2 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <!-- <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li> -->
            <li><a href="#">스터디룸 메인</a></li>
            <li><a href="#">스터디룸 정보조회</a></li>
            <li><a href="#">파일 공유 게시판</a></li>
            <li><a href="#">참가신청 회원 목록</a></li>
            <li><a href="#">스터디원 목록 </a></li>
          </ul>

        </div>



</body>
</html>