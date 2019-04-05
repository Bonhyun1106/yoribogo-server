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
    <script>
         $("#login-button").click(function(event){
		 event.preventDefault();
	 
	         $('form').fadeOut(500);
	         $('.wrapper').addClass('form-success');
        });
    </script>
    <script src="../script/jquery-3.3.1.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
   <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
   <link rel="stylesheet" href="../css/login.css">
   <title>Document</title>
</head>
<body>
	<jsp:include page="../include/logoutmenubar.jsp" />
    <div class="wrapper">
        <div class="container">
            <h1>Welcome</h1>
            
            <form class="form" action="<c:url value="/login/login.do"/>" method="post">
                <input type="text" placeholder="회원 아이디" name="id">
                <input type="password" placeholder="비밀번호" name="pass">
                <button type="submit" id="login-button">로그인</button>
            </form>
            
            <form class="signupForm" action="../signup/signupform.jsp">
                <a id="forget"  href="forgetform.jsp">비밀번호를 잊어버리셨나요?</a>
                <h5>아직 회원이 아니신가요?</h5>
                    <button type="submit" id="signup-button">회원가입</button>
                </form>
            </div>
            
	<jsp:include page="../include/bubble.jsp" />
    </div>
</body>
</html>