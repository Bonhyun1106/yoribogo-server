<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>insert recipe</title>
    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/insertrecipeform.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/insertform.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css"
        integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y" crossorigin="anonymous">
</head>

<body>
<script>
// 로딩 시 DB에서 넘어온 값과 option의 벨류값이 같을 경우 selected = true 상태로 변경.. 
	/*
	$(window).load(function () {
 		let ele = ["select[name='country']", "select[name='type']", 
 					"select[name='weather']", "name='select[level']"];
		let param = ['${recipe.country}', '${recipe.type}','${recipe.weather}','${recipe.level}'];
		
		for (var i = 0 ; i < ele.length ; i++) {
			var opt = $('#'+ ele[i] + ' option').length
			for(let j=0 ; j < opt ; j++){
				if (opt[i].val() == param[i]) {
					$(ele[i]).attr("selected","selected");	
					break;
				}
			};
		}
	}); */
</script>


    <span id="menubar">
        <a id="logo" href="main.html"><img src="images/logo-horizontal-300px.png" /></a>
        <a id="loginButton" href="login.html">로그인해주세요<i class="fas fa-user-circle fa-2x"></i></a>
    </span>
    <span id="up"><a href="#"><i class="fas fa-angle-double-up fa-4x"></i></a></span>
    <div style="height: 70px;"></div>

    <div id="all" class="all">
        <div id="insert">${user.memId}님의 레시피를 소개해주세요</div>
        
        
        
        
        
		<form method='post' action="insertrecipe.do" enctype="multipart/form-data">
        <div id="top-wrapper">
            <div class="top-left">
			
                <div class="title">
                    <input name="title" id="titleinput" type=text value="${recipe.title}" />
                </div>
                <div>
                    <textarea name="summary" id="textareatitle" cols="55" rows="14">${recipe.summary}</textarea>
                </div>
            </div>
            <div class="top-right">
                <input type="file" name="mainImg" id="mainImg" placeholder="파일을 첨부하세요" />
                <div id="main_img"></div>
            </div>
        </div>

        <div id="line">요리에 대해 알려주세요</div>

        <div id="ingrd-wrapper">
            <div class="cookinfo">
                <div class="select-ingrds">
                    <div class="ingrd-title">양식</div>
                    <div>
                        <select name="country" id="country">
                            <option value="">선택하세요</option>
                            <option value="4908" <c:if test="${recipe.country == 4908}">selected</c:if> >한식</option>
                            <option value="4909" <c:if test="${recipe.country == 4909}">selected</c:if> >양식</option>
                            <option value="4910" <c:if test="${recipe.country == 4910}">selected</c:if> >중식</option>
                            <option value="4911" <c:if test="${recipe.country == 4911}">selected</c:if> >일식</option>
                            <option value="4912" <c:if test="${recipe.country == 4912}">selected</c:if> >동남아시아</option>
                            <option value="4913" <c:if test="${recipe.country == 4913}">selected</c:if> >기타아시아</option>
                            <option value="4914" <c:if test="${recipe.country == 4914}">selected</c:if> >기타</option>
                        </select>
                    </div>
                </div>
                <div class="select-ingrds">
                    <div class="ingrd-title">종류</div>
                    <div>
                        <select name="type" id="type">
                            <option value="">선택하세요</option>
                            <option value="4915" <c:if test="${recipe.type == 4915}">selected</c:if> >국/탕</option>
                            <option value="4916" <c:if test="${recipe.type == 4916}">selected</c:if> >찌개</option>
                            <option value="4917" <c:if test="${recipe.type == 4917}">selected</c:if> >반찬</option>
                            <option value="4918" <c:if test="${recipe.type == 4918}">selected</c:if> >면</option>
                            <option value="4919" <c:if test="${recipe.type == 4919}">selected</c:if> >만두</option>
                            <option value="4920" <c:if test="${recipe.type == 4920}">selected</c:if> >밥</option>
                            <option value="4921" <c:if test="${recipe.type == 4921}">selected</c:if> >샐러드</option>
                            <option value="4922" <c:if test="${recipe.type == 4922}">selected</c:if> >스프</option>
                            <option value="4923" <c:if test="${recipe.type == 4923}">selected</c:if> >음료</option>
                            <option value="4924" <c:if test="${recipe.type == 4924}">selected</c:if> >빵/디저트</option>
                            <option value="4925" <c:if test="${recipe.type == 4925}">selected</c:if> >기타</option>
                        </select>
                    </div>
                </div>
                <div class="select-ingrds">
                    <div class="ingrd-title">열량(Kcal)</div>
                    <div>
                        <input type="text" name="kcal" value="${recipe.kcal}" />
                    </div>
                </div>
            </div>
            <div class="cookinfo">
                <div class="select-ingrds">
                    <div class="ingrd-title">날씨</div>
                    <div>
                        <select name="weather">
                            <option value="">선택하세요</option>
                            <option value="4941" <c:if test="${recipe.weather == 4941}">selected</c:if> >맑음</option>
                            <option value="4942" <c:if test="${recipe.weather == 4942}">selected</c:if> >비/흐림</option>
                            <option value="4943" <c:if test="${recipe.weather == 4943}">selected</c:if> >눈</option>
                            <option value="4944" <c:if test="${recipe.weather == 4944}">selected</c:if> >더운날</option>
                            <option value="4945" <c:if test="${recipe.weather == 4945}">selected</c:if> >추운날</option>
                        </select>
                    </div>
                </div>
                <div class="select-ingrds">
                    <div class="ingrd-title">난이도</div>
                    <div>
                        <select name="level">
                            <option value="">선택하세요</option>
                            <option value="4936" <c:if test="${recipe.level == 4936}">selected</c:if> >매우쉬움</option>
                            <option value="4937" <c:if test="${recipe.level == 4937}">selected</c:if> >쉬움</option>
                            <option value="4938" <c:if test="${recipe.level == 4938}">selected</c:if> >보통</option>
                            <option value="4939" <c:if test="${recipe.level == 4939}">selected</c:if> >어려움</option>
                            <option value="4940" <c:if test="${recipe.level == 4940}">selected</c:if> >매우어려움</option>
                        </select>
                    </div>
                </div>
                <div class="select-ingrds">
                    <div class="ingrd-title">조리시간(분)</div>
                    <div>
                        <input type="text" name="time" value="${recipe.time}"/>
                    </div>
                </div>
            </div>
        </div>


        <div id="wrapper-grocery">
            <div class="grocery">
                <div style="margin: 0 auto; line-height: 50px;">재료</div>
                <div><input type="text" name="ingredient" placeholder="재료를 입력하세요" /></div>
                <div><i class="fas fa-plus-square fa-2x"></i></div>
            </div>
            <div class="groceryList" name="ingrdList">
            	<c:forEach var="ingre" items="${ingredient}">
            		${ingre}
            	</c:forEach>
            </div>
        </div>


        <div id="content-wrapper">
            <div>레시피 내용을 입력하세요</div>
            <div></div>
            <div></div>
            <div></div>
        </div>

        <div id="refer-wrapper">
            <div style="margin : 0 auto;">참고한 레시피가 있나요?</div>
            <div>
                <input id="search" type="text" placeholder="다른 사람의 레시피를 검색해 보세요" />
            </div>
            <div><i class="fas fa-search fa-2x"></i></div>
        </div>

        <div id="submit">
            <button>등록하기</button>
        </div>
        
</form>
</div>

    <footer style="position: relative; width: 100%; background: gray; height: 300px; color:white;">
        <div id="footer">
            <img src="${pageContext.request.contextPath}/images/logo-vertical-300px.png" style="width: 80px;" />
            <p>
                YORIBOGO Receipes
                <br>개인정보관리책임자: 김우중
                <br>고객센터: 010-4955-6029(평일:13:30 ~ 14:30 토요일:12:00 ~ 12:01) FAX: 02-0000-0000 Email:xxxxx@yoribogo.com
                <br>
                <br>
                copyright @ YORIBOGO Corp. All Right Reserved.
            </p>
        </div>
    </footer>


</body>

</html>