<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title> [admin] 회원현황-경고상태 회원관리</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/memberreportlist.css" />
</head>
<body>
<!-- 전체 내용 wrapper -->
<div id="wrapper">
  <!-- Begin Header -->
  <div id="header">
      <img id="logo" src="${pageContext.request.contextPath}/images/logo-vertical-1000px.png">
    <h1><a href="#">ADMINISTRATOR</a></h1></div>
  <!-- End Header -->
  <!-- Begin Navigation -->
  <div id="navigation">  
  <div class="admin">
      <ul>
          <li><a href="../1_admin-Member/membersearch.html" id="member">회원현황</a> 
           <ul>
              <li><a href="/yoribogo/admin/member/listmember.do">회원검색</a></li>
              <li><a href="/yoribogo/admin/member/listmemberreport.do">경고상태 회원관리</a></li>
          </ul>
        </li>

         <li><a href="../2_admin-Board/boardlist.html" id="board">게시글관리</a>
            <ul>
            <li><a href="/yoribogo/admin/recipe/listrecipe.do">게시글 관리</a></li>
            <li><a href="/yoribogo/admin/notice/noticeform.do">공지사항 작성</a></li>
            <li><a href="/yoribogo/admin/notice/bannerform.do">배너 업로드</a></li>
            </ul>
         </li>

         <li><a href="../3_admin-Comment/comment.html" id="comment">댓글관리</a>
             <ul>
          <li><a href="/yoribogo/admin/recipe/listcomment.do">댓글 관리</a></li>
          <li><a href="/yoribogo/admin/recipe/listbestcomment.do">베스트 댓글 관리</a></li>
        </ul>
      </ul>
   </div>
  </div>
  <!-- End Navigation -->



    <!-- 가운데 내용 컬럼 -->
   <div id="content">
      <div id="contentWrapper">
        <div class="content2"><div class="top">no</div> <div class="bottom">
      	 <c:forEach var="list" items="${member}">
           <p>${list.memNo}</p>
          </c:forEach>
         </div></div>
        <div class="content2"><div class="top">아이디</div><div class="bottom"> 
         <c:forEach var="list" items="${member}">
           <p>${list.memId}</p>
          </c:forEach>
        </div></div>
        <div class="content2"><div class="top">정지 날짜</div><div class="bottom"> 
          <c:forEach var="list" items="${member}">
           <p id="${list.memNo}"> ${list.memIsOut} </p>
   
          </c:forEach>
        </div></div>
        <div class="content2"><div class="top">정지 사유</div><div class="bottom">
         <c:forEach var="list" items="${member}">
           <c:choose> 
            <c:when test="${list.memReportCount<10}"><p class=stopUsing> 1 </p></c:when>
            <c:when test="${list.memReportCount<20}"><p class=stopUsing> 2 </p></c:when>
            <c:when test="${list.memReportCount<30}"><p class=stopUsing> 3 </p></c:when>
            <c:when test="${list.memReportCount>31}"><p class=stopUsing> 4 </p></c:when>
          </c:choose>
          </c:forEach> 
          </div></div>
        <div class="content2"><div class="top">경고 상태</div>
            <div class="bottom">
              <div class="highlight"> 
               <c:forEach var="list" items="${member}">
                  <div><a class="button" id="${list.memNo}" href="#" >정지</a></div> 
               </c:forEach>
              </div>
            </div>
       </div>
   
   		<div id="page">
			<c:if test="${pageResult.count != 0}">
   	 			<div class="before"> 
    				<c:if test="${pageResult.prev eq true}"> 
    	 				<a href="${param.link}?pageNo=${pageResult.begin - 1}"> 이전 </a> 
     				</c:if>
    			</div>
   				<c:forEach var="i" begin="${pageResult.begin}" end="${pageResult.end}">
           			<div> <a href="${param.link}?pageNo=${i}">[${i}]</a> </div>
    			</c:forEach>
        		<div class="after"> 
              		<c:if test="${pageResult.next eq true}"> 
              			<a href="${param.link}?pageNo=${pageResult.end + 1}"> 다음 </a> 
              		</c:if>
        		</div>
			</c:if>
	   </div> 
   		
<!-- 
       <div id="page">
        
          <div class="before"> <a href="#"> 이전 </a> </div>
          
          <div> <a href="#"> 1 </a> </div>
          <div> <a href="#"> 2 </a> </div>
          <div> <a href="#"> 3 </a> </div>
          <div> <a href="#"> 4 </a> </div>
          <div> <a href="#"> 5 </a></div>
          <div> <a href="#"> 6 </a> </div>
          <div> <a href="#"> 7 </a> </div>
          <div> <a href="#"> 8 </a></div>
          <div> <a href="#"> 9 </a> </div>
          <div> <a href="#"> 10 </a> </div> 
          <div class="after"> <a href="#"> 다음 </a> </div>
        
        </div>
-->       
        
        
         
     </div>
    </div> 

     <!-- 하단  로고 -->
     <div id="footeradmin"> 
       <img id="logo" src="${pageContext.request.contextPath}/images/logo-vertical-1000px.png">
      </div>

  <!-- End Wrapper div -->
 </div>

 
 <footer style="position: relative; width: 100%; background: gray; height: 300px; color:white;">
  <div id="footer">
      <img src = "${pageContext.request.contextPath}/images/logo-vertical-300px.png" style="width: 80px;"/>
      <p>
          YORIBOGO Receipes
          <br>개인정보관리책임자: 김우중
          <br>고객센터: 010-4955-6029(평일:13:30 ~ 14:30 토요일:12:00 ~ 12:01) FAX: 02-000-000 Email:xxxxx@yoribogo.com
          <br>
          <br>
          copyright @ YORIBOGO Corp. All Right Reserved.
        </p>
  </div>  
  </footer>  


  <script>	
	 	$(".button").on("click", function () {
			$("#" + $(this).attr("id")).text("정지"); 
		  var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();

			if(dd<10) {
			    dd='0'+dd
			} 
			if(mm<10) {
			    mm='0'+mm
			} 
			today = mm+'/'+dd+'/'+yyyy;
			$("#" + $(this).attr("id")).text(today);
		}); 
		
		
  </script>
  
</body>
</html>
