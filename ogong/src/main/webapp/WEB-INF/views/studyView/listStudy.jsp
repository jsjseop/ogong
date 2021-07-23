<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>그룹 스터디 목록</title>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
body {
    padding-top : 50px;
}
.page-header{
	text-align: center;
}
* {
    margin: 0;
    padding: 0;
}
ul, li {
    list-style: none;
}
a {
    text-decoration: none;
    color: inherit;
}
.list_wrap {
    width: 1000px;
    margin: 0 auto;
    padding: 100px;
}

.list_wrap ul {
    font-size: 0;
}
.list_wrap .item {
    display: inline-block;
    width: 30%;
    margin-top: 40px;
    margin-left: 5%;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
}
.list_wrap .item:nth-child(-n+3) {
    margin-top: 0;
}
.list_wrap .item:nth-child(3n-2) {
    margin-left: 0;
}
.list_wrap .item .image {
    width: 100%;
    height: 160px;
    background-color: #ddd;
    background-repeat: no-repeat;
    background-position: 50% 50%;
    background-size: cover;
}

.list_wrap .item1 .image { background-image: url(/resources/images/1.jpg); }
.list_wrap .item2 .image { background-image: url(/resources/images/1.jpg); }
.list_wrap .item3 .image { background-image: url(/resources/images/1.jpg); }
.list_wrap .item4 .image { background-image: url(/resources/images/1.jpg); }
.list_wrap .item5 .image { background-image: url(/resources/images/1.jpg); }
.list_wrap .item6 .image { background-image: url(/resources/images/1.jpg); }
.list_wrap .item7 .image { background-image: url(/resources/images/1.jpg); }
.list_wrap .item8 .image { background-image: url(/resources/images/1.jpg); }
.list_wrap .item9 .image { background-image: url(/resources/images/1.jpg); }


.list_wrap .item .cont {
    padding: 20px;
}
.list_wrap .item strong {
    display: block;
    margin: 0 0 10px 0;
    font-size: 16px;
    letter-spacing: -1px;
}
.list_wrap .item p {
    font-size: 13px;
    letter-spacing: -1px;
}
.list_wrap .item a {
    display: inline-block;
    margin-top: 10px;
    padding: 5px 10px;
    background: #eee;
    font-size: 13px;
    letter-spacing: -1px;
}
.list_wrap .item a:hover {
    background: #325cb2;
    color: #fff;
}

</style>

<script type="text/javascript">
		/*--------------시작------------------*/
	
   /* function fncGetList(currentPage) {
      $('#currentPage').val(currentPage);
      $('form').attr('action','/study/listStudy/').attr('method','POST').submit();
   }

      $('button:contains("검색")').on('click', function(){
         
         fncGetList('1');
      })
      
   })
   
   $(function(){
         
          $("#searchKeyword").keydown(function (key) {
          
              if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
                 fncGetList('1');
              }
          });
      }); */
  
   /*  --------------------- 끝 ------------------------*/
$(function() {
	$('ul li div a:last-child').on('click', function() {
      	let studyNo = $(this).find('input').val();
      	alert(studyNo);
        location.href = "/study/getStudy?studyNo="+studyNo;
    });
	
});
      

</script>
</head>

<body>
	<%-- <jsp:include page="/WEB-INF/views/common/toolbar.jsp" /> --%>
	
	
	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
   <div class="container">
	 <!-- <input type="hidden" name="startNum" id="startNum" value="0"> -->
	 
      <div class="page-header text-default">
         <h3>그룹 스터디 목록</h3>
      </div>
	 <div class="list_wrap">
            <ul>
             <c:forEach var="study" items="${list}">
                <li class="item item1">
                    <div class="image">ㅇㅇ</div>
                    <div class="cont">
                        <strong>${study.studyName}</strong>
                        <p> 모집 일자 ${study.recruitmentStartDate} ~ ${study.recruitmentEndDate} </p>
                        <p>인 원 ${study.currentMember}/${study.maxMember}</p>
                        <a href="#">상세보기
                        	<input type="hidden" value="${study.studyNo}" />
                        </a>
                    </div>
                </li>
             </c:forEach>
            </ul> 
        </div>

</div>
<script>
var page = 1;

$(window).scroll(function() {
	  if(((window.innerHeight + window.scrollY) >= document.body.offsetHeight)){
      console.log(++page);
      /* $("body").append('<div class="big-box"><h1>Page ' + page + '</h1></div>'); */
		
      $.ajax({
			type : 'post',
			url : "/study/json/listStudy",
			data : JSON.stringify({currentPage: page}),
			dataType: "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(result) {				
				var list = result.list;
				if(list.length < 3) {
				} else {
					var addListHtml ="";
					if(list.length > 0) {
						$.each(list, function(index, list){
							
							addListHtml += "<li class='item item1'>";
							addListHtml += "<div class='image'></div";
							addListHtml += "<div class='cont'>";
							addListHtml += "<strong>"+list.studyName+"</strong>";
							addListHtml += "<p> 모집 일자"+list.recruitmentStartDate+" ~ " +list.recruitmentEndDate+"</p>";
							addListHtml += "<a href='#'> 상세보기 ";
							addListHtml += "<input type='hidden' value='"+list.studyNo+"'/>";
							addListHtml += "</a>";
							addListHtml += "</li>";
								
						});
						$("ul").append(addListHtml);
		
					}
				
				}
			},
			error:function(request, status, error){
				
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
      
    }
});


</script>
</body>
</html>