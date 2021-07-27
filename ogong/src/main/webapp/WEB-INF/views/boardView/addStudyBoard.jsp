<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<title>스터디 모집등록</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="/resources/css/addBoardStudy.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<link href="/css/animate.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js"></script>
</head>

<div class="toolbar">
	<jsp:include page="../common/toolbar.jsp" />
</div>

<body>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5"></div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-10">
					<div class="wrap d-md-flex">
						<div
							class="text-wrap p-4 p-lg-5 d-flex img d-flex align-items-end"
							style="background-image: url(/resources/images/add.png);">
							<div class="text w-100" style="text-align:center">
								<p>모방해서 실패하는 것 보다 독창적응로 실패하는게 낫다 <br/>
								- 허먼 멜빌</p>
							</div>
						</div>
						<div class="login-wrap p-4 p-md-5">
							<h3 class="mb-3">스터디 모집등록</h3>
							<form action="/board/addBoard" method="post" class="signup-form">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group d-flex align-items-center">
											<label class="label" for="name">제목</label> <input type="text"
											name="boardTitle" class="form-control">
												<input type="hidden" name="boardCategory" value="${boardCategory}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group d-flex align-items-center">
											<label class="label" for="starDate">스터디 시작기간</label> <input
												type="date" name="studyStartDate">
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group d-flex align-items-center">
											<label class="label" for="endDate">스터디 종료기간</label> <input
												type="date" name="studyEndDate">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group d-flex align-items-center">
											<label class="label" for="contents">내용</label> <textarea
												name="boardContents" class="form-control" rows="3"></textarea>
										</div>
									</div>
									<div class="col-md-12 my-4"></div>
									<div class="col-md-12">
										<div class="form-group">
											<button type="submit" style="margin: 0 auto" align="center"
												class="btn btn-secondary submit p-3">등록하기</button>
										</div>
									</div>
								</div>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>

