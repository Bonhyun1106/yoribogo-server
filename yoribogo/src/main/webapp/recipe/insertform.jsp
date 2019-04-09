<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>insert recipe</title>
    <script src="<c:url value="/script/jquery-3.3.1.min.js"/>"></script>
    <script src="../js/insertrecipeform.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/insertform.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css"
        integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y" crossorigin="anonymous">
</head>

<body>
    <span id="menubar">
        <a id="logo" href="main.html"><img src="images/logo-horizontal-300px.png" /></a>
        <a id="loginButton" href="login.html">로그인해주세요<i class="fas fa-user-circle fa-2x"></i></a>
    </span>
    <span id="up"><a href="#"><i class="fas fa-angle-double-up fa-4x"></i></a></span>
    <div style="height: 70px;"></div>

    <div id="all" class="all">
        <div id="insert">당신의 레시피를 소개해주세요</div>
        
        
        
		<form method='POST' action="insertrecipe.do" enctype="multipart/form-data">
        <div id="top-wrapper">
            <div class="top-left">
			
                <div class="title">
                    <input name="title" id="titleinput" type="text" placeholder="제목을 입력하세요" />
                </div>
                <div>
                    <textarea name="summary" id="textareatitle" cols="55" rows="14" placeholder="내용을 입력하세요"></textarea>
                </div>
            </div>
            <div class="top-right">
                <input type="file" name="mainImg" id="mainImg" placeholder="파일을 첨부하세요" />
                <div id="main_img"><img style="width: 450px; height: 250px;"></div>
            </div>
        </div>

        <div id="line">요리에 대해 알려주세요</div>

        <div id="ingrd-wrapper">
            <div class="cookinfo">
                <div class="select-ingrds">
                    <div class="ingrd-title">양식</div>
                    <div>
                        <select name="country">
                            <option value="">선택하세요</option>
                            <option value="4908">한식</option>
                            <option value="4909">양식</option>
                            <option value="4910">중식</option>
                            <option value="4911">일식</option>
                            <option value="4912">동남아시아</option>
                            <option value="4913">기타아시아</option>
                            <option value="4914">기타</option>
                        </select>
                    </div>
                </div>
                <div class="select-ingrds">
                    <div class="ingrd-title">종류</div>
                    <div>
                        <select name="type">
                            <option value="">선택하세요</option>
                            <option value="4915">국/탕</option>
                            <option value="4916">찌개</option>
                            <option value="4917">반찬</option>
                            <option value="4918">면</option>
                            <option value="4919">만두</option>
                            <option value="4920">밥</option>
                            <option value="4921">샐러드</option>
                            <option value="4922">스프</option>
                            <option value="4923">음료</option>
                            <option value="4924">빵/디저트</option>
                            <option value="4925">기타</option>
                        </select>
                    </div>
                </div>
                <div class="select-ingrds">
                    <div class="ingrd-title">열량(Kcal)</div>
                    <div>
                        <input type="text" name="kcal" placeholder="열량을 입력하세요" />
                    </div>
                </div>
            </div>
            <div class="cookinfo">
                <div class="select-ingrds">
                    <div class="ingrd-title">날씨</div>
                    <div>
                        <select name="weather">
                            <option value="">선택하세요</option>
                            <option value="4941">맑음</option>
                            <option value="4942">비/흐림</option>
                            <option value="4943">눈</option>
                            <option value="4944">더운날</option>
                            <option value="4945">추운날</option>
                        </select>
                    </div>
                </div>
                <div class="select-ingrds">
                    <div class="ingrd-title">난이도</div>
                    <div>
                        <select name="level">
                            <option value="">선택하세요</option>
                            <option value="4936">매우쉬움</option>
                            <option value="4937">쉬움</option>
                            <option value="4938">보통</option>
                            <option value="4939">어려움</option>
                            <option value="4940">매우어려움</option>
                        </select>
                    </div>
                </div>
                <div class="select-ingrds">
                    <div class="ingrd-title">조리시간(분)</div>
                    <div>
                        <input type="text" name="time" placeholder="조리시간을 입력하세요"/>
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
            <div class="groceryList" name="ingrdList">호밀빵 2장, 아보카도, 양상추, 토마토, 발사믹소스</div>
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
	$("#mainImg").change(function() {
		 if (this.files && this.files[0]) {
			  var reader = new FileReader();

			  reader.onload = function(e) {
			         $('#main_img > img').attr('src', e.target.result);
			  }
		      reader.readAsDataURL(this.files[0]);
		}	
	});


</script>
</body>

</html>