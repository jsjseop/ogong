<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

		<!--   jQuery , Bootstrap CDN  -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>		

	<style>
        body {
            padding-top : 25px;
        }
		.navbar {
		    position: relative;
		    min-height: 50px;
		    /* margin-bottom: 20px; */
		    border: 1px solid transparent;
		    border-top-color: transparent;
		    border-top-style: solid;
		    border-top-width: 1px;
		    border-right-color: transparent;
		    border-right-style: solid;
		    border-right-width: 1px;
		    border-bottom-color: transparent;
		    border-bottom-style: solid;
		    border-bottom-width: 1px;
		    border-left-color: transparent;
		    border-left-style: solid;
		    border-left-width: 1px;
		    border-image-source: initial;
		    border-image-slice: initial;
		    border-image-width: initial;
		    border-image-outset: initial;
		    border-image-repeat: initial;
		}
   	</style>		

	<script type="text/javascript">
	function fncGetList(currentPage) {
		/* alert($("#searchCondition").val()); */
		$("#currentPage").val(currentPage)
		$("form[name='detailForm']").attr("method" , "POST").attr("action" , "/admin/listUserReport").submit();
	}
	
	
	function fncupdateUserSuspend(email){
		
		
		$("form[name='updateSuspendUser']").attr("method", "POST").attr("action", "/admin/updateSuspendUser").submit();
		}
		
		$('.radio-value').on('click', function() {
		    var suspendType = $('.radio-value:checked').val(); // 체크된 Radio 버튼의 값을 가져옵니다.
		    
		    if ( suspendType == '1' ) {
		        $('.radio-value-detail').attr('suspendType', 1);
		        $('.radio-value-detail').focus(); 
		    } else if ( suspendType == '2' ) {
		        $('.radio-value-detail').attr('suspendType', 2); 
		        $('.radio-value-detail').focus();
		    } else if ( suspendType == '3' ) {
		        $('.radio-value-detail').attr('suspendType', 3);
		        $('.radio-value-detail').focus(); 
		    }
		});	

	
	$(function(){
	
		// 정지 
 		$( "#btn1" ).on("click" , function() {
			var email = $('#email2').val()
			/* alert(email);	 */		
			fncupdateUserSuspend(email)
		}); 
		
		// 기억해_
	    $('tr td:nth-child(5)').on("click", function(){
	    	$('#email').val($(this).find('input').val());	    	
	    })
		
		
 		$('#modal').modal("hide"); //닫기 
		 
		$('#modal').modal("show"); //열기 
		
		
		$("button[name='search']").on("click", function(){
			fncGetList(1);
		});	
		
	/*$("td:contains('정지')").on("click", function(){
			 fncupdateUserSuspend() 
			var email = $(this).find('input').val()
			alert(email);
			location.href = "/admin/updateSuspendUser?receiveReporter="+$(this).attr('email');
		});*/ 
		
	})
	
	</script>        
        
    </head>
    
<body class="contatiner">

      
<!--             Navbar Brand
            <a class="navbar-brand" href="#">OGong</a>
            Sidebar Toggle -->
            
			<jsp:include page="../common/toolbar.jsp" />
         
        
          	
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">관리자</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                신고조회
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" name="reportUser"    href="/admin/listUserReport">신고된 사용자</a>
                                    <a class="nav-link" name="reportBoard"   href="/admin/listReport?reportType=1">신고된 게시글</a>
                                    <a class="nav-link" name="reportAnswer"  href="/admin/listReport?reportType=2">신고된 답변</a>
                                    <a class="nav-link" name="reportComment" href="/admin/listReport?reportType=3">신고된 댓글</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="false" aria-controls="collapseLayouts1">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                회원조회
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" name=totalUser 	 href="/admin/listTotalUser?listType=1">모든 회원</a>
                                    <a class="nav-link" name=User 		 href="/admin/listTotalUser?listType=2">탈퇴 회원</a>
                                    <a class="nav-link" name=restoreUser href="/admin/listTotalUser?listType=3">복구 회원</a>
                                    <a class="nav-link" name=suspendUser href="/admin/listTotalUser?listType=4">정지 회원</a>
                                </nav>
                            </div>                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">관리자 아이디:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            
            
            <div id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">신고된 사용자</h1>
<%--                         <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지</li>
                        </ol> --%>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                신고된 사용자의 목록을 출력합니다.
                            </div>
                            
                         
                            
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th style="font-size:11pt;">No</th>
                                            <th style="font-size:11pt;">신고사유</th>
                                            <th style="font-size:11pt;">닉네임</th>
                                            <th style="font-size:11pt;">신고일자</th>
                                            <th style="font-size:11pt;">정지</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th style="font-size:11pt;">No</th>
                                            <th style="font-size:11pt;">신고사유</th>
                                            <th style="font-size:11pt;">닉네임</th>
                                            <th style="font-size:11pt;">신고일자</th>
                                            <th style="font-size:11pt;">정지</th>
                                        </tr>
                                    </tfoot>
                                    <tbody class="ct_list_pop">
                                    	<c:set var="i" value="0" />
                                    		<c:forEach var="report" items="${list}">
                                    			<c:set var="i" value="${ i+1 }" />
			                                        <tr>
			                                            <td style="font-size:11pt;">${ i }</td>
			                                            <td style="font-size:9pt;">${report.reportReason}</td>
			                                            <td style="font-size:10pt;">${report.receiveReporter.nickname}</td>
			                                            <td style="font-size:10pt;">${report.reportDate}</td>
			                                            <td email="${report.receiveReporter.email}">
												  			<c:if test="${report.receiveReporter.condition eq '1'}">
																<button class="btn btn-primary" data-toggle="modal" style="WIDTH: 40pt; font-size:0.5pt; HEIGHT: 20pt"  data-target="#myModal">
																  <input type="hidden" name="email2" id="email2" value="${report.receiveReporter.email}"/>
																   정지
																</button>
												  			</c:if>
												  			<c:if test="${report.receiveReporter.condition eq '2'}">
												  				정지완료
												  			</c:if>			                                            	
			                                            </td>
			                                        </tr>
		                               		</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer> 
            </div>
            
	    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">사용자 정지</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-horizontal" method="post" name="updateSuspendUser">
		        	<input type="hidden" id="email" name="email" value="${report.receiveReporter.email}"/>   
		        	<div class = "form-group">
					  <fieldset>
			   				 <legend>정지 일자 선택 </legend>
			   				 <label for="radio-1 ">7일</label>
			    			 <input type="radio" class="radio-value" name="suspendType" id="suspendType" value="1">
			   				 <label for="radio-2">30일</label>
			   				 <input type="radio" class="radio-value" name="suspendType" id="suspendType" value="2">
			   				 <label for="radio-3">영구정지</label>
			    			 <input type="radio" class="radio-value" name="suspendType" id="suspendType" value="3">
			  			</fieldset>
		        	</div>
		        </form>
		      </div>
		      <div class="modal-footer">
		      	<button id="btn1" class="btn btn-default" >정 지</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫 기</button>
		      </div>
		    </div>
		  </div>
		 </div>     .
		        
        </div>
        
	        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/javascript/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/javascript/datatables-simple-demo.js"></script>
    </body>
</html>