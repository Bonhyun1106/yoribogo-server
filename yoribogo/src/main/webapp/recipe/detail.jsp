<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>detail</title>
    <script src="<c:url value="/script/jquery-3.3.1.min.js"/>"></script>
    <link rel="stylesheet" type="text/css" href="../css/detail.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>

<body>
    <span id="menubar">
        <a id="logo" href="main.html"><img src="../images/logo-horizontal-300px.png" /></a>
        <a id="loginButton" href="login.html">로그인해주세요<i class="fas fa-user-circle fa-2x"></i></a>
    </span>
    <span id="up"><a href="#"><i class="fas fa-angle-double-up fa-4x"></i></a></span>

    <div id="all" class="all">
        <div class="top"></div>

        <div id="top-wrapper">
            <div class="top-left">
                <div class="top-title" name="title">${recipe.title}</div>
                <div>
                    <p name="summary">
                        ${recipe.summary}
                    </p>
                </div>
                <div class="idimg">
                    <div>
                        <img src="${pageContext.request.contextPath}${user.profile}" name="recIdImg"/>
                    </div>
                    <div>
                        <a href="#" name="recId">${recipe.memId}</a>
                    </div>
                </div>
            </div>
            <div class="top-right">
                <img src="${pageContext.request.contextPath}${recipe.photo}">
            </div>
        </div>
        <div id="likebar">
            <button>
                <i class="fas fa-heart fa-2x"></i>
            </button>
        </div>

        <!-- ===========================중간======================== -->
        <div id="ingrd-wrapper">
            <div class="cookinfo">
                <div>
                    <div class="ingrd-title">양식</div>
                    <div name="country">${recipe.country}</div>
                </div>
                <div>
                    <div class="ingrd-title">종류</div>
                    <div name="type">${recipe.type}</div>
                </div>
                <div>
                    <div class="ingrd-title">난이도</div>
                    <div name="level">${recipe.level}</div>
                </div>
                <div>
                    <div class="ingrd-title">열량</div>
                    <div name="kcal">${recipe.kcal}kcal</div>
                </div>
                <div>
                    <div class="ingrd-title">조리시간</div>
                    <div name="time">${recipe.time}분</div>
                </div>
                <div>
                    <div class="ingrd-title">추천날씨</div>
                    <div name="weather">${recipe.weather}</div>
                </div>
            </div>
            <div>
                <div class="ingrd-title">필요한 재료</div>
                <div name="ingredient">
                	<c:forEach var="ingre" items="${ingredient}" >
                		${ingre}
                	</c:forEach>
                </div>
            </div>
        </div>

        <!-- =========================== 내용 ============================ -->
        <div id="content-wrapper">
            <div id="add">
	            <c:forEach var="image" items="${image}">
	                <div class="content-grid">
	                    <div id="con-img1">
	                        <img name="con-img1" src="${pageContext.request.contextPath}${image.blockImg}">
	                    </div>
	                    <div id="con-txt1">
	                        <h3 name="con-txt1">${image.blockCon}</h3>
	                    </div>
	                </div>
	            </c:forEach>
            </div>
        </div>


        <div id="line"></div>
        <!-- ===========================댓글 등록 ============================ -->
        <div id="inputComm-wrapper">
            <div class="inputId">
                <div><img src="${user.profile}" name="idImg"/></div>
                <div name="id">${user.memId}님</div>
            </div>
	        <form name="commentForm" id="commentForm" method="post">
	            <div class="inputbox">
		        	<input type="hidden" id="recNo" name="recNo" value="${recipe.no}">
		        	<input type="hidden" id="commId" name="commId" value="${user.memId}">
	                <textarea rows="5" cols="100" placeholder="응원의 댓글을 달아보세요" name="commContent" id="commContent"></textarea>
	                <!-- <div class="font">0/3000</div> -->
	            </div>
	            <div class="inputButton">
	                <button id="inputButton">등록</button>
	            </div>
    	    </form>
        </div>


        <!-- ===========================하단======================== -->
        <div id="commemt-wrapper">
            <div id="addComm"></div>
        </div>

        <div id="pageNo">
            <div><a href="#1">
                    <</a> </div> <div><a href="#1">1</a></div>
            <div><a href="#1">2</a></div>
            <div><a href="#1">3</a></div>
            <div><a href="#1">4</a></div>
            <div><a href="#1">5</a></div>
            <div><a href="#1">6</a></div>
            <div><a href="#1">7</a></div>
            <div><a href="#1">8</a></div>
            <div><a href="#1">9</a></div>
            <div><a href="#1">10</a></div>
            <div><a href="#1"> > </a></div>
        </div>

        <!-- ========================= 참고 레시피 ============================ -->
        <div id="line"></div>
        <h4>이런 레시피는 어떠세요?</h4>
        <div id="referImg-wrpper">
            <div class="recipe">
                <a href="#.">
                    <div class="image">
                        <div class="quality">Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis
                            molestias dolorem nisi recusandae ipsam incidunt.</div>
                        <img src="images/img1.jpg" />
                    </div>
                </a>
            </div>
            <div class="recipe">
                <a href="#.">
                    <div class="image">
                        <div class="quality">Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis
                            molestias dolorem nisi recusandae ipsam incidunt.</div>
                        <img src="images/img2.jpg" />
                    </div>
                </a>
            </div>
            <div class="recipe">
                <a href="#.">
                    <div class="image">
                        <div class="quality">Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis
                            molestias dolorem nisi recusandae ipsam incidunt.</div>
                        <img src="images/img1.jpg" />
                    </div>
                </a>
            </div>
            <div class="recipe">
                <a href="#.">
                    <div class="image">
                        <div class="quality">Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis
                            molestias dolorem nisi recusandae ipsam incidunt.</div>
                        <img src="images/img2.jpg" />
                    </div>
                </a>
            </div>
        </div>


    </div>

    <footer style="position: relative; width: 100%; background: gray; height: 300px; color:white;">
        <div id="footer">
            <img src="images/logo-vertical-300px.png" style="width: 80px;" />
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
	$(function() {
		function getCommentList(){
			var no = ${recipe.no};
			$.ajax({
				url:"list-comment.do",
				/* type: "post", */
				data:"no="+ no,
				dataType:"json",
				success: function(list){
					console.log("list", list);
					console.dir(list);
					let html = "";
					for(let i=0 ; i < list.length; i++){
 						html += '<div class="comment">'
		                     + 		'<div class="commid">'
		                     +      	"<div><img src='" 
		                     + 				list[i].profile 
		                     + 			"'></div>"
		                     +      	'<div name="commId1">' + list[i].memId + '</div>'
		                     +		'</div>'
		                     + 		'<div>' + list[i].commentContent + '</div>'
		                     + 		'<div class="likecnt">'
		                     +     		'<div><button><i class="far fa-thumbs-up fa-2x"></i></button></div>'
		                     +     		'<div class="yes">' + list[i].commentLikeCnt + '</div>'
		                     + 		'</div>'
		                     + 		'<div class="likecnt">'
		                     +     		'<div><button><i class="far fa-thumbs-down fa-2x"></i></i></button></div>'
		                     +     		'<div class="no">'+ list[i].commentReportCount + '</div>'
		                     + 		'</div>'
		                	 + '</div>';
					}
					$("#addComm").html(html);
				}
			});
		};
		// 호출
		getCommentList();
		
		// 댓글 등록
		$("form").submit(function () {
			/* let no = 42;	//${recipe.no}
			let memNo = 1; //${user.memNo}
			let commentContent = $("#commContent").innerText; */
			$.ajax({
				url: "insertcomment.do",
				type : "post",
				data : $(this).serialize(),
				success: function(no){
					getCommentList();
					alert("등록되었습니다.");
				}
			})
		});
		
		
	});
	
	
	
	
	
</script>
    
    
</body>

</html>