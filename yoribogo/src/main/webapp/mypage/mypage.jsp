<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <script src="../script/jquery-3.3.1.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
   <link rel="stylesheet" href="../css/mypage.css">
   <title>my page</title>

</head>
<body>
    <span id = "menubar">
                <a id = "logo" href = "main.html"><img src="images/logo-horizontal-300px.png"/></a>
                <a id = "loginButton" href="login.html">로그인해주세요<i class="fas fa-user-circle fa-2x"></i></a>
    </span>
    
  <span id = "up"><a href= "#"><i class="fas fa-angle-double-up fa-4x"></i></a></span>
  
  <span id="header">
      <div>
      	  <form action="<c:url value="/mypage/reloginform.do"/>">
          	
      	  	<button><div id="settingProfile" style="cursor: pointer;"><i class="fas fa-cog fa-3x"></i></div></button>
      	  </form>
          <img id="profile" src="${pageContext.request.contextPath}${user.memProfile}.png"></img>
          <h2 id="id"> ${user.memId}</h2>
          <c:if test="${userRecipe.size() > 0}">
	          <p id="countRecipe">${userRecipe.size()}개의 레시피를 만듬</p>		
		  </c:if>
		  <c:if test="${userRecipe.size() == 0}">
		  	  <p id="countRecipe">아직 레시피를 등록하지 않으셨습니다!</p>		
		  </c:if>
      </div>
      
    </span>

    <div>
      <div id = "recent">
        
        <h3 id="recentTitle">작성 게시물</h3>

          <p>총 ${userRecipe.size()}개의 게시물</p>
          <hr>
          <div class="recentPost">
            <div class="recentPost_body">
			<c:if test="${userRecipe.size() > 0}">
            	<c:forEach var="recipe" items="${userRecipe}" begin="0" end="2">
                	<div class="profileBlock_body_inner" style="background-image: url(@!@backimage); background-size: cover;">
                  		<div  class="innerWrapper">  
                  		<img id = "profileBlock_body_inner_profile" src="${pageContext.request.contextPath}${user.memProfile}.png"/>  
		                   <div class="innerWrapper_inner">
        		             <div><fmt:formatDate value="${recipe.regDate}" pattern="MM.dd hh:mm" /></div>
                 		     <div>${user.memId}</div>
                     		 <div><i class="fas fa-star"></i>${recipe.grade}/5</div>
                    	   </div>
                    		 <div class="paragraph">${recipe.summary}</div>
                  		</div>
                	</div>
                </c:forEach>
             <div id="moreInfo" style="cursor: pointer;">
                 <i class="fas fa-chevron-right"></i>
             </div>
		  	</c:if>

  
            </div>
        </div>
      </div>

      <div id = "like"> 
        <h3 id= "likeTitle">좋아요 표시한 게시물</h3>
        <div class="whetherRecommendation">
          <div class="whetherRecommendation_body">
              <div class="profileBlock_body_inner"  onclick="location.href='detail.html';" style="background-image: url(images/foodthumbnail16.jpg); background-size: cover;">
                  <div  class="innerWrapper">  
                  <img id = "profileBlock_body_inner_profile" src="@!@list.profile"/>  
                   <div class="innerWrapper_inner">
                     <div>@!@list.regDate</div>
                     <div>@!@list.id</div>
                     <div><i class="fas fa-star"></i>@!@list.grade</div>
                    </div>
                    <div class="paragraph">@!@list.content</div>
                  </div>
                </div>
                
                
                  
                  
                </div>
              </div>
      </div>
        <script>
            function stretchLong(){
              let div = document.querySelector(".whetherRecommendation_body");
              for(let i = 0; i < 3;i++){

              }
            }
          </script>
      <div id="moreInfo2"style="cursor: pointer;" onclick="stretchLong();">
          <i class="fas fa-chevron-down fa-2x"></i>
      </div>

    </div>
</div>

<footer style="width: 100%; background: gray; height: 300px; color: white;">
    <div id="footer">
        <img src = "images/logo-vertical-300px.png" style="width: 80px;"/>
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

</body>
</html>