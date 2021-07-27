<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>



	<div class="col-md-8">
     <c:set var="i" value="0" />
	<c:forEach var="banana" items="${list}">
      <div class="card row col-md-10 " style="margin:20px; height:170px;" id="divRemove">
        <div class="card-body row" style="text-align: center;">
          <div class="col-4   justify-content-center" >
          	<c:if test="${banana.bananaCategory == '1'}">
               <div class="text-center">                	
               	  <img  src="/resources/images/add.png" alt="User profile picture">
               </div>
            </c:if>
          	<c:if test="${banana.bananaCategory == '2'}">
               <div class="text-center">                	
               	  <img  src="/resources/images/use.png" alt="User profile picture">
               </div>
            </c:if>            
          </div>
          <div class="col-8" style="">
            <div class="form-group" id="deleteBanana" style="text-align: right; margin-bottom: 0.5rem; ">
            	
             <a>삭제<input type="hidden" value="${banana.bananaNo}" name="bananaNo"/></a>
            </div>          
            <div class="form-group" style="text-align: left; ">
              ${banana.bananaHistory}
            </div>
            <div class="form-group" style="text-align: left; ">
              ${banana.bananaHistoryDate}
            </div>
          </div>
        </div>
      </div>
    </c:forEach>  
	</div>

</body>
</html>