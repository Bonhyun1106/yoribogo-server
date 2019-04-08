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
    <script src="../script/jquery-3.3.1.min.js" type="text/javascript"></script>
   <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
   <link rel="stylesheet" href="../css/signup.css">
   <title>sign up</title>

</head>
<body>
  <jsp:include page="../include/logoutmenubar.jsp" />
    <div class="wrapper">
            <div class="container">
                <h1>Welcome</h1>
                
                <form class="form">
                    <h5>프로필 사진</h5>
                    <a id="profilePhoto" href="#" >+</a>

                    <input type="text" placeholder="이메일" name="email"><span id="emailChecked"></span>
                                       
                    <input type="text" placeholder="회원 아이디" name="id"><span id="idChecked"></span>
                    <input type="password" placeholder="비밀번호" name="pass"><span id="passChecked"></span>
                    <input type="password" placeholder="비밀번호 확인" name="pass2"><span id="pass2Checked"></span>
                    
                    <div id = "favorite">
                    <div>키워드</div>
                    <input id="favoriteSearch" type="text" placeholder="검색">
                    <div>    
                        
                        <button id="favorites">
                        <i class="fas fa-plus-square fa-2x"></i>
                        <span>채식주의</span>
                        </button>
                        
                    </div>
                    </div>
                    <a id="login-button" href="">회원가입</a>
                    <a id="back" href="../login/loginform.jsp" >이전</a>
                
                <script>
            	
      			let emailFlag = false;
       			let idFlag = false;
                let passFlag = false;
       			let pass2Flag = false;
       			

				$("#idChecked").html("");	
       			$("#emailChecked").html("");		
				$("#passChecked").html("");	
       			$("#pass2Checked").html("");		
				 	
       			let email = " ";
       			let id = " ";
       			let pass = " ";
       			
           		let regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
           		let idReg = /^[A-za-z0-9]{5,15}/g;
           		
           		$("input[name='email']").on("keyup",function(){			
           			
	           		//console.log($("input[name='email']").val());
           			$.ajax({
           				url :"checkemail.do",
           				data: "email=" + $("input[name='email']").val(),
           				success : function(result){
	           			  // 정규식 변수 regExp
	           			 	//console.log("result: " + result);
           			  	  if($("input[name='email']").val() == ""){
           						$("#emailChecked").html("이메일을 입력해주세요.");	
           						$("#emailChecked").css({"color" : "red"});	
           			  		  
           			  	  }else if ($("input[name='email']").val().match(regExp) != null && result == 0) {
           						$("#emailChecked").html("사용가능한 이메일입니다.");	
           						$("#emailChecked").css({"color" : "springgreen"});	
           						emailFlag = true;
           						email = $("input[name='email']").val();
               					console.log("finally email is " + email);
           			  		}else if(result == 1){
           						$("#emailChecked").html("이미 사용 중인 이메일입니다.");									
            					$("#emailChecked").css({"color" : "red"});	           						
           					}else {
           						$("#emailChecked").html("사용할 수 없는 이메일입니다.");									
           						$("#emailChecked").css({"color" : "red"});	
           			  		}
           				}
           			});	
           			}            		
           		);
           		
           		
           		
           		$("input[name='id']").on("keyup",function(){			
           			
           			$.ajax({
           				url : "checkid.do",
           				data: "id=" + $("input[name='id']").val(),
           				success : function(result){
           					
           					if($("input[name='id']").val() == ""){
           						$("#idChecked").html("아이디를 입력해주세요.");					
           						$("#idChecked").css({"color" : "red"});	
           					}else if($("input[name='id']").val().match(idReg) != null && result == 0){
           					$("#idChecked").html("사용가능한 아이디입니다.");	
           				
           					$("#idChecked").css({"color" : "springgreen"});	
           					idFlag = true;
           					id = $("input[name='id']").val();
           					//console.log("finally id is " + id);
           					}else if(result == 1){
           						$("#idChecked").html("이미 사용 중인 아이디입니다.");									
            					$("#idChecked").css({"color" : "red"});	           						
           					}else{
           						$("#idChecked").html("아이디는 영문 대문자 또는 소문자 또는 숫자로 시작하며 길이는 5~15자여야합니다.");									
            					$("#idChecked").css({"color" : "red"});	
           							
           					}
           				}
           			});	
           		}            		
           		);
           		
           		
           		$("input[name='pass']").on("keyup",function(){			
           			if(this == ""){
           				return;            				
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
           			
           			}            		
           		);

           		$("#login-button").click(
           			function(){


                   	  
                   	    
              	        $('form').fadeOut(500);
                   	    
           				if(idFlag && emailFlag && passFlag && pass2Flag){
               	        $('.wrapper').addClass('form-success');
                   	 	console.log(email);

                 		let atTmp = [];
                  	    atTmp = email.split("@");
                   	    let dotTmp = atTmp[1].split(".");
                   	    
                   	    address = atTmp[0];
                   	    at = dotTmp[0];
                   	    dot = dotTmp[1];
   	        			console.log("추출 결과 : "+address + at + dot);
   	        				alert("회원가입 중...");
           					$.ajax({
       	    					url:"signupsuccess.do",
           						data: 
               						"id=" + id +
               						"&email=" + email +
//                						"&emailaddress=" + address+
//                						"&emailat=" + at+
//                						"&emaildot=" + dot+
               						"&pass=" + pass2,
           						success:function(result){
           							alert(result);
           							window.location.href = "../login/loginform.jsp";	
           						}
           					});
           					
          					}else{
          						alert("입력된 정보를 확인해주세요.");
          					}
           			}
           		);
           		
                    </script>
                    
                
                
                </form>
                
                
               
            </div>
            
           
		<jsp:include page="../include/bubble.jsp" />
    </div>
</body>
</html>