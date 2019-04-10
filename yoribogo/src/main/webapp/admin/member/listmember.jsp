<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>[admin] 회원현황-회원검색</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/memberlist.css" />
</head>
<body>
<!-- 전체 내용 wrapper -->
<div id="wrapper">
  <!-- Begin Header -->
  <div id="header">
      <img id="logo" src="../images/logo-vertical-1000px.png">
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
        <div class="content2"><div class="top">no</div> <div class="buttom"> 
          <c:forEach var="list" items="${member}">
          <p>${list.memNo}</p>
          </c:forEach>
        </div></div>
        <div class="content2"><div class="top">아이디</div><div class="buttom"> 
          <c:forEach var="list" items="${member}">
          <p>${list.memId}</p>
          </c:forEach>
        </div></div>
        <div class="content2"><div class="top">가입 날짜</div><div class="buttom">
          <c:forEach var="list" items="${member}">
               <p> <fmt:formatDate value="${list.memJoinDate}" pattern="yy.MM.dd" /></p>
          </c:forEach>
        </div></div>
        <div class="content2"><div class="top">신고 횟수</div><div class="buttom"> 
          <c:forEach var="list" items="${member}">
          <p>${list.memReportCount}</p>
          </c:forEach>
        </div></div>
        <div class="content2"><div class="top">경고 상태</div><div class="buttom"> 
          <c:forEach var="list" items="${member}">
           <c:choose> 
            <c:when test="${list.memReportCount<10}"><p>양호</p></c:when>
            <c:when test="${list.memReportCount<20}"><p>경고</p></c:when>
            <c:when test="${list.memReportCount<30}"><p>위험</p></c:when>
            <c:when test="${list.memReportCount>31}"><p>정지</p></c:when>
          </c:choose>
          </c:forEach>
        </div></div>        
        <!-- 글 검색-->
        
     <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
      </div>  
   </div>


   <div class="search_input">
      <div class="container-4">
        <input type="search" id="search" placeholder="제목으로 검색!" />
        <button class="icon"><i class="fa fa-search"></i></button>
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

    <!-- 하단  로고 -->
    <div id="footeradmin"> 
      <img id="bt_logo" src="../images/logo-vertical-1000px.png"> 
    </div>
    
    <!-- End Wrapper div -->
 </div>


 <footer style="position: relative; width: 100%; background: gray; height: 300px; color:white;">
  <div id="footer">
      <img src = "../images/logo-vertical-300px.png" style="width: 80px;"/>
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
  	$("#search").on("click", function() {
     	 location.href="";
  	});
  	 	
  </script>
  
</body>
</html>
