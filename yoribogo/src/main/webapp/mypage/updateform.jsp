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
<div id="body">
        <div class="wrapper">
                <div class="container">
                    <h4>회원 정보 수정</h4>
                    <br>
                    <h5>프로필 사진</h5>
                    <form class="form" method="post" action="javascript:success();">
                     <img id="profilePhoto" class = "upload-button" src="../images/profileDefault.png"/>
                    <input type="file" class="file-upload" name="profile">
                        <p>${user.memId}</p>
                        <input type="text" placeholder="이메일" name="email"><span id="emailChecked"></span>
                        <input type="hidden" value="${user.memNo}" name="memNo">
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

                    
            
                        <button id="login-button">회원정보수정</button>
                    	<a id="back" href="/yoribogo/mypage/mypage.do" >마이페이지로</a>
                        <a href="deleteUserInfo.html" id="delete-button">회원탈퇴를 원하시나요?</a>
	
                       
                    </form>
                    <script>
                    let emailFlag = false;
           			let idFlag = false;
                    let passFlag = false;
           			let pass2Flag = false;
           			$("#emailChecked").html("");		
    				$("#passChecked").html("");	
           			$("#pass2Checked").html("");		
           			
           			let email = " ";
           			let pass = " ";
           			
               		let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
               		let idReg = /^[A-za-z0-9]{5,10}/g;
               		
                  	$(document).ready(function() {
    						var readURL = function(input) {
    							if (input.files && input.files[0]) {
       							var reader = new FileReader();
       							reader.onload = function (e) {
           							$('#profilePhoto').attr('src', e.target.result);
           							profilePic = e.target.result;
       							}

      							reader.readAsDataURL(input.files[0]);
    							}
    						}
    						$(".file-upload").on('change', function(){
    							readURL(this);
    						});

    						$(".upload-button").on('click', function() {
    							$(".file-upload").click();
    						});
    					});
               		
               		$("input[name='email']").on("keyup",function(){			
               	        if($(this).val().length >= 30) {

               	            $(this).val($(this).val().substring(0, 30));

               	        }
               			$.ajax({
               				url : "/yoribogo/signup/checkemail.do",
               				data: "email=" + $("input[name='email']").val(),
               				success : function(result){
    	           			  // 정규식 변수 regExp
    	           			 	console.log("result: " + result);
               			  	  if($("input[name='email']").val() == ""){
               						$("#emailChecked").html("미입력시 변경되지 않습니다.");	
               						$("#emailChecked").css({"color" : "springgreen"});	
               			  		  
               			  	  }else if ($("input[name='email']").val().match(regExp) != null && result == 0) {
               						$("#emailChecked").html("사용가능한 이메일입니다.");	
               						$("#emailChecked").css({"color" : "springgreen"});	
               						emailFlag = true;
               						email = $("input[name='email']").val();
                   					console.log("finally email is " + email);
               			  		}
               			  		else {
               						$("#emailChecked").html("사용할 수 없는 이메일입니다.");									
               						$("#emailChecked").css({"color" : "red"});	
               			  		}
               				}
               			});	
               			}            		
               		);
               		
               		
               		$("input[name='pass']").on("keyup",function(){			
               			if(this == ""){
               				return;            				
               			}
               			if($(this).val().length >= 13) {

               	            $(this).val($(this).val().substring(0, 13));

               	        }
               			//console.log($("input[name='pass']").val().length);
               			if($("input[name='pass']").val().length < 8){
               						$("#passChecked").html("비밀번호는 8자 이상입니다.");									
                					$("#passChecked").css({"color" : "red"});	
               				
               			}else if($("input[name='pass']").val().length > 13){
               						$("#passChecked").html("비밀번호는 13자 이하입니다.");									
                					$("#passChecked").css({"color" : "red"});	
               			}else{
               						$("#passChecked").html("사용가능한 비밀번호입니다.");									            				
                					$("#passChecked").css({"color" : "springgreen"});	
                					passFlag = true;
               			}
               			
               			});
               		
               		$("input[name='pass2']").on("keyup",function(){			
               			if($("input[name='pass']").val().length == 0 || $("input[name='pass2']").val().length == 0){
               				return;            				
               			}
               			if($(this).val().length >= 13) {

               	            $(this).val($(this).val().substring(0, 13));

               	        }
               			//console.log($("input[name='pass']").val());
               			if($("input[name='pass']").val() != $("input[name='pass2']").val()){
               						$("#pass2Checked").html("비밀번호를 확인해주세요.");									
                					$("#pass2Checked").css({"color" : "red"});	
               			}else{
               						$("#pass2Checked").html("확인했습니다.");									            				
                					$("#pass2Checked").css({"color" : "springgreen"});	
                					pass2Flag = true;
                					pass2 = $("input[name='pass2']").val();

                   					//console.log("finally password is " + pass);
               			}
               			
               			});
               		function success(){
	            	    
                	    if(!passFlag || !pass2Flag){
                       	    	
                  	    	alert("입력 정보를 확인해주세요.");
    						window.location.href = "updateform.do";
                  	    }else{
                       	 	console.log(email);
							
                   	     	let form = $('.form')[0];
                          	let formData = new FormData(form);
							
                          	let atTmp = [];
                          	let dotTmp = "";
                          	let address = "";
                          	let at = "";
                          	let dot = "";
                          	if(!emailFlag){
                          		email = null;
                          	}else{
                          		atTmp = [];
                        	    atTmp = email.split("@");
                         	    dotTmp = atTmp[1].split(".");
                         	    
                         	    address = atTmp[0];
                         	    at = dotTmp[0];
                         	    dot = dotTmp[1];
                          	}
                          	formData.append("email", email);                      		
    						
                          	
                          	

          					console.log("추출 결과 : "+address + at + dot);
           					alert("회원 정보 수정 중...");
          					$.ajax({
          						
          						type: "post",
      	    					url:"update.do",
      	    					processData: false,
      	                       	contentType: false,
          						data: formData,
          						success:function(result){
          							alert(result);	
          							window.location.href="mypage.do";
          						}
          					});
            					
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