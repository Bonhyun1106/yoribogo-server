<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <script>
         $("#login-button").click(function(event){
		 event.preventDefault();
	 
	         $('form').fadeOut(500);
	         $('.wrapper').addClass('form-success');
        });
    </script>
    <script src="../script/jquery-3.3.1.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
   <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
   <link rel="stylesheet" href="../css/signup.css">

   <title>Document</title>
</head>
<body>
  <jsp:include page="../include/logoutmenubar.jsp" />
    <div class="wrapper">
            <div class="container">
                <h1>Welcome</h1>
                
                <form class="form">
                    <h5>프로필 사진</h5>
                    <a id="profilePhoto" href="#" >+</a>
                    
                    <script>
                    	$("#profilePhoto").onclick(
                    				
                    	);
                    </script>
                    
                    <input id="email" type="text" placeholder="이메일" name="email">
                    <h5 id="emailChecked"></h5>
                    <script>
            		$("input[name='email']").on("keyup",function(){
            			$.ajax({
            				url : "redundancycheck.do",
            				data: "email=" + $("input[name='email']").val(),
            				success : function(result){
            					if(result == 0){
            					$("#emailChecked").html("사용가능한 아이디입니다.");									
            						
            					}else if($("input").val() == ""){
            						$("#emailChecked").html("사용할 수 없는 아이디입니다.");									
            							
            					}else{
            						$("#emailChecked").html("사용할 수 없는 아이디입니다.");									
            					}
            				}
            			});	
            		}
            		
            		);
                    </script>
                    
                    
                    <input type="text" placeholder="회원 아이디" name="id">
                    <!-- <a id="checkRedundancy" href="" >중복 체크</a> -->
                    <input type="password" placeholder="비밀번호" name="pass">
                    <input type="password" placeholder="비밀번호 확인" name="passCheck">
                    
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
                    <button type="submit" id="login-button">회원가입</button>
                    <a id="back" href="../login/loginform.jsp" >이전</a>
                </form>
                
                
               
            </div>
            
           
		<jsp:include page="../include/bubble.jsp" />
    </div>
</body>
</html>