<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Q&A 게시판</title>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script type="text/javascript">
	function fncGetList(currentPage) {

		$('#currentPage').val(currentPage);
		$('form').attr('action','/board/listQaBoard/').attr('method','POST').submit();
	}
	
	function fncWrite(user) {
		
		location.href = "/board/addBoard?boardCategory="+`${boardCategory}`;
	}

	$(function() {

		$('tbody td:nth-child(2)').on('click', function() {
			let boardNo = $(this).children('input').val();
			location.href = "/board/getBoard?boardNo=" + boardNo;
		})
		
		$('button:contains("검색")').on('click', function(){
			
			fncGetList('1');
		})
		
	})
	
	$(function(){
			
			 $("#searchKeyword").keydown(function (key) {
			 
		        if(key.keyCode == 13){
		        	fncGetList('1');
		        }
		    });
		});
	
</script>


<style>
@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap')
	;

body, table, div, p, th, td {
	font-family: 'Do Hyeon', sans-serif;
}


h1 {
	text-align: center;
	font-family: 'Do Hyeon', sans-serif;
}

table.one {
	margin-bottom: 3em;
	border-collapse: collapse;
}

td { /* removed the border from the table data rows  */
	text-align: center;
	width: 10em;
	padding: 1em;
}

th { /* removed the border from the table heading row  */
	text-align: center;
	padding: 1em;
	background-color: #FFDC3C;
	/* added a red background color to the heading cells  */
	color: white;
} /* added a white font color to the heading text */
tr {
	height: 1em;
}

table tr:nth-child(even) { /* added all even rows a #eee color  */
	background-color: #FFF8D7;
}

table tr:nth-child(odd) { /* added all odd rows a #fff color  */
	background-color: #fff; 
}
#searchForm{
	display: flex;
	justify-content: flex-end;
}

</style>
</head>

<body>
	<jsp:include page="../common/toolbar.jsp" />

	<div class="container">

		<div class="page-header text-default">
			<c:if test="${boardCategory == '1'}">
				<h3>정보공유 게시판</h3>
			</c:if>
			<c:if test="${boardCategory == '2'}">
			</c:if>
			<h3>Q&A 게시판</h3>

			<c:if test="${boardCategory == '3'}">
				<h3>합격후기 게시판</h3>
			</c:if>
			<c:if test="${boardCategory == '4'}">
				<h3>자유 게시판</h3>
			</c:if>
			<c:if test="${boardCategory == '5'}">
				<h3>자율스터디 모집 게시판</h3>
			</c:if>
			<c:if test="${boardCategory == '6'}">
				<h3>파일공유 게시판</h3>
			</c:if>
		</div>

		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		<div class="row">
			<div class="col-md-6 text-left">
				<p class="text-default">전체 ${resultPage.totalCount} 건수, 현재
					${resultPage.currentPage} 페이지</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm" id="searchForm">

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

					<button type="button" class="btn btn-warning">검색</button>

					<input type="hidden" id="currentPage" name="currentPage" value="" />
				</form>
			</div>
		</div>

		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">제목</th>
					<th align="left">작성자</th>
					<th align="left">조회수</th>
					<th align="left">등록일</th>
				</tr>
			</thead>
			<!-- ---------------------------- -->
			<tbody>
				<c:forEach var="board" items="${list}">
					<tr>
						<td align="center">${board.boardNo}</td>
						<td align="left">${board.boardTitle}<input type="hidden"
							value="${board.boardNo}" /></td>
						<td align="left">${board.writer.nickname}</td>
						<td align="left">${board.viewCount}</td>
						<td align="left">${board.boardRegDate}</td>
					</tr>
				</c:forEach>
			</tbody>
			<!-- ----------------------------- -->
		</table>
		<div align="right">
			<button type="button" class="btn btn-warning" style="width: 80px;"
				onclick="javascript:fncWrite('${writer.email}')">글쓰기</button>
		</div>
	</div>
	<jsp:include page="../common/pageNavigator.jsp" />
	</div>
</body>
</html>
