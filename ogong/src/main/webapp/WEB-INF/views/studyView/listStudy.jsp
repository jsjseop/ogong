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
</style>
<script type="text/javascript">
   function fncGetList(currentPage) {
      $('#currentPage').val(currentPage);
      $('form').attr('action','/study/listStudy/').attr('method','POST').submit();
   }
/*    function fncWrite(user) {
      console.log("확인용 : " + user);
      if (user == null || user == "") {
         alert("로그인 후 이용 가능합니다.");
         return;
      }
      location.href = "/board/addBoard";
   } */
   $(function() {
      $('tbody td:nth-child(2)').on('click', function() {
         let studyNo = $(this).children('input').val();
         alert(studyNo);
         location.href = "/study/getStudy?studyNo="+studyNo;
      })
      
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
      });
</script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
	
   <div class="container">

      <div class="page-header text-default">
         <h3>그룹 스터디 목록</h3>
      </div>

      <!-- table 위쪽 검색 Start /////////////////////////////////////-->
      <div class="row">

         <div class="col-md-6 text-left">
            <p class="text-default">전체 ${totalCount} 건수, 현재
               ${currentPage} 페이지</p>
         </div>

         <div class="col-md-6 text-right">
            <form class="form-inline" name="detailForm">

               <div class="form-group">
                  <select name="searchCondition" class="form-control"
                     style="width: 110px">
                     <option value="0"
                        ${! empty search.searchCondition && search.searchCondition== 0 ? "selected" : ""  }>제목+내용</option>
                     <option value="1"
                        ${! empty search.searchCondition && search.searchCondition== 1 ? "selected" : ""  }>제목</option>
                     <option value="2"
                        ${! empty search.searchCondition && search.searchCondition== 2 ? "selected" : ""  }>작성자</option>
                  </select>
               </div>

               <div class="form-group">
                  <label class="sr-only" for="searchKeyword">검색어</label> <input
                     type="text" class="form-control" id="searchKeyword"
                     name="searchKeyword" placeholder="검색어"
                     value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
               </div>

               <button type="button" class="btn btn-default">검색</button>

               <input type="hidden" id="currentPage" name="currentPage" value="" />
            </form>
         </div>
      </div>

      <table class="table table-hover table-striped">
         <thead>
            <tr>
               <th align="center">관 심 사</th>
               <th align="center">제목</th>
               <th align="center">썸네일</th>
               <th align="center">모집 기간</th>
               <th align="center">인 원</th>
            </tr>
         </thead>
         <tbody>

            <c:forEach var="study" items="${list}">
               <tr>
               	  <td align="left">${study.studyInterest}</td>
                  <td align="left">${study.studyName}<input type="hidden"
                     value="${study.studyNo}" /></td>
                  <td align="left">${study.studyThumbnail}</td>
                  <td align="left">${study.recruitmentStartDate} ~ ${study.recruitmentEndDate} </td>
                  <td align="left">${study.currentMember}/${study.maxMember}</td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
      </div>
      <!--  table End /////////////////////////////////////-->
</body>
</html>