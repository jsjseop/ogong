 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="node_modules/slidebars/dist/slidebars.css">
<link href="node_modules/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">
<script src="node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="node_modules/slidebars/dist/slidebars.js"></script>
<style>
.container {
	max-width: 1200px;
}

.title {
	margin-top: 1em;
	margin-bottom: 1em;
	font-weight: bold;
}

.btn {
	background-color: #ef6c00;
	color: white;
	font-weight: bold;
}

.btn:hover {
	background-color: rgb(240, 130, 0);
	color: white;
	font-weight: bold;
}

/* dropdown shadow */
.form-control:focus {
	border-color: #ef6c00;
	box-shadow: 0 0 0 0.2rem rgba(255, 165, 0, 0.25);
}
</style>
	<!-- ToolBar Start /////////////////////////////////////-->
	
	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
	
   	<!-- ToolBar End /////////////////////////////////////-->

<!-- pagination start -->
<style>
.page-link {
	color: #ef6c00 !important;
}
</style>
<!-- pagination end -->



<title>나의 게시글</title>
</head>
		  <input type="hidden" name="email"	value="${email}"/>  <!--  히든값 -->

<body>
</div>
	<!-- free board start  -->
	<div class="container" style="height: 100px">
		<div class="title">
			<h5 class="font-weight-bold">나의 게시글</h5>
		</div>
	</div>
	<div class="container">
		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th align="left">번호</th>
					<th align="left">제목</th>
					<th align="left">내용</th>
				</tr>
				
				<c:forEach items="${list}" var = "board">
							<tr>
								<td align="left" >"${board.boardNo}"</td>
								<td align="left" >"${board.boardTitle}"</td>
								<td align="left" >"${board.viewCount}"</td>
							</tr>   
						</c:forEach>
				
			</thead>
			<tbody id="tableBody"></tbody>
		</table>


		<script>
	
		</script>
	</div>


	<!-- pagination start -->
	<div class="container">

		<nav aria-label="Page navigation example">
			<ul class="pagination pagination-sm justify-content-center">
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1">이전</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">다음</a></li>
			</ul>
		</nav>
	</div>
	<!-- pagination end -->

	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>



			<div class="col-sm-3"></div>
		</div>
	</div>
	<!-- free board end  -->

	
</body>
</html>

