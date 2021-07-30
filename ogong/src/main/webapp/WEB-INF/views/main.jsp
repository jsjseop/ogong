<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/e3409dba93.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap')
	;

body, table, div, p, th, td {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}
div h5 {
	color: black;
	display: flex;
	justify-content: center;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />


	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">

		<!-- Main content -->
		<div class="content" style="padding-top:7px">
			<div class="container">
			
				<div class="row">
				
					<div class="col-lg-4">
						<div class="card">
							<div class="card-header border-0">
								<div class="d-flex justify-content-between">
									<h3 class="card-title">내스터디</h3>

								</div>
							</div>
							<div class="card-body">
								<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">

								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      <img src="/resources/upload_files/study/ogong2.jpg" height="260px" class="w-100" alt="...">
								      <div class="carousel-caption d-none d-md-block"></div>
								      <h5>First slide label</h5>
								    </div>
								    <div class="carousel-item">
								      <img src="/resources/upload_files/study/ogong2.jpg" height="260px" class="w-100" alt="...">
								      <div class="carousel-caption d-none d-md-block"></div>
								      <h5>Second slide label</h5>
								    </div>
								    <div class="carousel-item">
								      <img src="/resources/upload_files/study/ogong2.jpg" height="260px" class="w-100" alt="...">
								      <div class="carousel-caption d-none d-md-block"></div>
								      <h5>Third slide label</h5>
								    </div>
								  </div>
								  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="sr-only">Previous</span>
								  </a>
								  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="sr-only">Next</span>
								  </a>
								</div>
							</div>
						</div>
						<!-- /.card -->
					</div>
					
					<div class="col-lg-8">
							<div class="card">
								<div class="card-header border-0">
									<div class="d-flex justify-content-between">
										<h3 class="card-title">목표시간</h3>
										</hr>
										<a href="/">공부기록 > </a>
									</div>
								</div>
								<div class="card-body">
									<div class="d-flex">
										<p class="d-flex flex-column">
											<span class="text-bold text-lg">오늘 공부한 시간 / 목표시간&nbsp
											<i class="fa fa-clock-o" aria-hidden="true"></i></span>
											
										</p>
									</div>
									<!-- /.d-flex -->
	
									<div class="position-relative mb-4">
										<div class="progress" style="height: 30px;">
										  <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</div>
	
									<div class="d-flex flex-row justify-content-end">
										<span class="mr-2"> <i
											class="fas fa-square text-primary"></i> 달성
										</span>
									</div>
								</div>
							</div>
							
						</div>
				</div> <!-- row -->
				
			</div> <!-- container-fluid -->
				
			<div class="container">
					<div class="row">
							<div class="card col-lg-4">
								<div class="card-header border-0">
									<h3 class="card-title" align="center">바나나 랭킹</h3>
								</div>
								<div class="card-body table-responsive p-0">
									<table class="table table-striped table-valign-middle">
										<thead align="center">
											<tr>
												<th>순 위</th>
												<th>닉네임</th>
												<th>바나나 수</th>
											</tr>
										</thead>
										<tbody align="center">
											<c:set var="i" value="0" />
											<c:forEach var="user" items="${list2}">
												<c:set var="i" value="${i+1}" />
												<tr>
													<td>${i}위</td>
													<td>${user.nickname}</td>
													<td>${user.bananaCount} 바나나</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="card col-lg-4">
								<div class="card-header border-0">
									<h3 class="card-title" align="center">채택수 랭킹</h3>
								</div>
								<div class="card-body table-responsive p-0">
									<table class="table table-striped table-valign-middle">
										<thead align="center">
											<tr>
												<th>순 위</th>
												<th>닉네임</th>
												<th>채택수</th>
											</tr>
										</thead>
										<tbody align="center">
											<c:set var="i" value="0" />
											<c:forEach var="answer" items="${list}">
												<c:set var="i" value="${i+1}" />
												<tr>
													<td>${i}위</td>
													<td>${answer.answerWriter.nickname}</td>
													<td>${answer.adoptionCount}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							
							<div class="card col-lg-4">
								<div class="card-header border-0">
									<h3 class="card-title" align="center">채택수 랭킹</h3>
								</div>
								<div class="card-body table-responsive p-0">
									<table class="table table-striped table-valign-middle">
										<thead align="center">
											<tr>
												<th>순 위</th>
												<th>닉네임</th>
												<th>채택수</th>
											</tr>
										</thead>
										<tbody align="center">
											<c:set var="i" value="0" />
											<c:forEach var="answer" items="${list}">
												<c:set var="i" value="${i+1}" />
												<tr>
													<td>${i}위</td>
													<td>${answer.answerWriter.email}</td>
													<td>${answer.adoptionCount}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
					</div> <!-- row -->
			</div> <!-- container-fluid -->
				
		</div>
	</div>

</body>

