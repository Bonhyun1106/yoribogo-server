<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
      <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
   <script src="../script/jquery-3.3.1.min.js" type="text/javascript"></script>
  <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/updateform.css">
   <title>Document</title>

</head>
<body>
    <span id = "menubar">
                <a id = "logo" href = "main.html"><img src="images/logo-horizontal-300px.png"/></a>
    </span>
    
  <span id = "up"><a href= "#"><i class="fas fa-angle-double-up fa-4x"></i></a></span>
  
  <span id="header">
         <div>
          <div id="settingProfile" style="cursor: pointer;" onclick="location.href='setUserInfo.html';"><i class="fas fa-cog fa-3x"></i></div>
          <img id="profile" src="${user.memProfile}"></img>
          <h2 id="id"> ${user.memId}</h2>
          <c:if test="${userRecipe.size() > 0}">
	          <p id="countRecipe">${userRecipe.size()}개의 레시피를 만듬</p>		
		  </c:if>
		  <c:if test="${userRecipe.size() == 0}">
		  	  <p id="countRecipe">아직 레시피를 등록하지 않으셨습니다!</p>		
		  </c:if>
      </div>
</span>
<div id="body">
        <div class="wrapper">
                <div class="container">
                    <h4>회원 정보 수정</h4>
                    <br>
                    <h5>프로필 사진</h5>
                    <a id="profilePhoto" href="#" >+</a>
                    
                    <form class="form" action="">
                        <p>${user.memId}</p>
                        <p>${user.memEmail}</p>
                        <input type="password" placeholder="새 비밀번호" name="pass"><span id="passChecked"></span>
                   		<input type="password" placeholder="새 비밀번호 확인" name="pass2"><span id="pass2Checked"></span>
                        
                        <div id = "favorite">
                            <div>키워드</div>
                            <input id="favoriteSearch" type="text" placeholder="검색">
                            <div>    
                                <button id="favoriteThing">
                                <i class="fas fa-plus-square fa-2x"></i>
                                <span>채식주의</span>
                            </button>
                              
                        </div>
                    </div>

                    
            
                        <a href="mypage.html" id="login-button">회원정보수정</a>
                        <a href="deleteUserInfo.html" id="delete-button">회원탈퇴를 원하시나요?</a>

                       
                    </form>
                    <script>
                    $("input[name='pass']").on("keyup",function(){			
               			if(this == ""){
               				return;            				
               			}
               			if($(this).val().length >= 13) {

               	            $(this).val($(this).val().substring(0, 13));

               	        }
               			if($("input[name='pass']").val().length < 8){
               						$("#passChecked").html("비밀번호는 8자 이상입니다.");									
                					$("#passChecked").css({"color" : "red"});	
               				
               			}else if($("input[name='pass']").val().length > 13){
               						$("#passChecked").html("비밀번호는 13자 이하입니다.");									
                					$("#passChecked").css({"color" : "red"});	
               			}else{
               						$("#passChecked").html("사용가능한 비밀번호입니다.");									            				
                					$("#passChecked").css({"color" : "springgreen"});	
               			}
               			
               			});
               		
               		$("input[name='pass2']").on("keyup",function(){			
               			if($("input[name='pass']").val().length == 0 || $("input[name='pass2']").val().length == 0){
               				return;            				
               			}
               			if($(this).val().length >= 13) {

               	            $(this).val($(this).val().substring(0, 13));

               	        }
               			if($("input[name='pass']").val() != $("input[name='pass2']").val()){
               						$("#pass2Checked").html("비밀번호를 확인해주세요.");									
                					$("#pass2Checked").css({"color" : "red"});	
               			}else{
               						$("#pass2Checked").html("확인했습니다.");									            				
                					$("#pass2Checked").css({"color" : "springgreen"});	
                					pass2 = $("input[name='pass2']").val();

               			}
               			
               			}         
                    </script>
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