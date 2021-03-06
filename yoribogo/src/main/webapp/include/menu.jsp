<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
  
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
    integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
    crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/search.css">
<link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
    integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">



	<span id="menubar">
	    <div>
	    <a id="logo" href="/yoribogo/main/main.do"><img src="${pageContext.request.contextPath}/images/logo-horizontal-300px.png" /></a>
	    </div>
	
	    <div class="kby_wrapper">
	
	      <div id="kby_left_navbar" class="kby_navbar">
	        <span class="kby_open-slide">
	          <a href="#" class="detailbutton">
	            <div>상세검색</div>
	          </a>
	        </span>
	      </div>
	      
	      <form action="/yoribogo/search/searchdetail.do" id="doSubmit">
	        <div id="kby_left-menu" class="kby_side-nav">
	          <div class="kby_side">
	            <ul class="kby_v-tab_tab-head">
	              <li rel="kby_vtab1">종류</li>
	              <li rel="kby_vtab2">난이도</li>
	              <li rel="kby_vtab3">날씨</li>
	              <li rel="kby_vtab4">양식</li>
	              <li rel="kby_vtab5">열량</li>
	              <li rel="kby_vtab6">조리시간</li>
	              <li rel="kby_vtab7">주의사항</li>
	            </ul>
	          </div>
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
	          <div class="kby_v-tab_container">
	            <h2></h2>
	            <div id="confirm"><a href="#">선택완료</a></div>

	            <div id="kby_vtab0" class="kby_v-tab_content">
	
	            </div>
	
	            <div id="kby_vtab1" class="kby_v-tab_content">
	              <input type="radio" name="type" value="4915" id="type1" />
	              <label for="type1">국/탕류</label>
	              <input type="radio" name="type" value="4916" id="type2" />
	              <label for="type2">찌개</label>
	              <input type="radio" name="type" value="4917" id="type3" />
	              <label for="type3">반찬</label>
	              <input type="radio" name="type" value="4918" id="type4" />
	              <label for="type4">면</label>
	              <input type="radio" name="type" value="4919" id="type5" />
	              <label for="type5">만두</label>
	              <input type="radio" name="type" value="4920" id="type6" />
	              <label for="type6">밥</label>
	              <input type="radio" name="type" value="4921" id="type7" />
	              <label for="type7">샐러드</label>
	              <input type="radio" name="type" value="4922" id="type8" />
	              <label for="type8">스프</label>
	              <input type="radio" name="type" value="4923" id="type9" />
	              <label for="type9">음료</label>
	              <input type="radio" name="type" value="4924" id="type10" />
	              <label for="type10">빵/디저트</label>
	              <input type="radio" name="type" value="4925" id="type11" />
	              <label for="type11">기타</label>
	            </div>
	
	            <div id="kby_vtab2" class="kby_v-tab_content">
	              <input type="radio" name="level" id="level1" value="4936" />
	              <label for="level1">매우 쉬움</label>
	              <input type="radio" name="level" id="level2" value="4937" />
	              <label for="level2">쉬움</label>
	              <input type="radio" name="level" id="level3" value="4938" />
	              <label for="level3">보통</label>
	              <input type="radio" name="level" id="level4" value="4939" />
	              <label for="level4">어려움</label>
	              <input type="radio" name="level" id="level5" value="4940" />
	              <label for="level5">매우 어려움</label>
	            </div>
	            <!-- #tab3 -->
	
	
	            <div id="kby_vtab3" class="kby_v-tab_content">
	                <input type="radio" name="weather" id="weather1" value="4941" />
	                <label for="weather1">맑음</label>
	                <input type="radio" name="weather" id="weather2" value="4942" />
	                <label for="weather2">흐림/비</label>
	                <input type="radio" name="weather" id="weather3" value="4943" />
	                <label for="weather3">눈</label>
	                <input type="radio" name="weather" id="weather4" value="4944" />
	                <label for="weather4">더워요</label>
	                <input type="radio" name="weather" id="weather5" value="4945" />
	                <label for="weather5">추워요</label>
	            </div>
	
	            <div id="kby_vtab4" class="kby_v-tab_content">
	                <input type="radio" name="country" id="country1" value="4908" />
	                <label for="country1">한식</label>
	                <input type="radio" name="country" id="country2" value="4909" />
	                <label for="country2">일식</label>
	                <input type="radio" name="country" id="country3" value="4910" />
	                <label for="country3">중식</label>
	                <input type="radio" name="country" id="country4" value="4911" />
	                <label for="country4">양식</label>
	                <input type="radio" name="country" id="country5" value="4912" />
	                <label for="country5">동남아시아</label>
	                <input type="radio" name="country" id="country6" value="4913" />
	                <label for="country6">기타아시아</label>
	                <input type="radio" name="country" id="country7" value="4914" />
	                <label for="country7">기타</label>
	            </div>
	
	            <div id="kby_vtab5" class="kby_v-tab_content">
	                <div id="range-slider">
	                  <div id="slider-range2">
	                  </div>
	                  <input type="text" id="kcal" name="kcal" readonly style="border:0;">
	                </div> 
	            </div>
	
	            <div id="kby_vtab6" class="kby_v-tab_content">
	                <div id="range-slider">
	                  <div id="slider-range">
	                  </div>
	                    
	                  <input type="text" id="time" name="time" readonly style="border:0;" >
	                </div> 
	            </div>
	
	            <div id="kby_vtab7" class="kby_v-tab_content">
	                <input type="checkbox" name="caution" value="4946" id="cb0" />
	                <label for="cb0">고열량</label>
	                <input type="checkbox" name="caution" value="4947" id="cb1" />
	                <label for="cb1">당뇨병</label>
	                <input type="checkbox" name="caution" value="4948" id="cb2" />
	                <label for="cb2">채식</label>
	                <input type="checkbox" name="caution" value="4949" id="cb3" />
	                <label for="cb3">육식</label>
	                <input type="checkbox" name="caution" value="4950" id="cb4" />
	                <label for="cb4">할랄</label>
	                <input type="checkbox" name="caution" value="4951" id="cb5" />
	                <label for="cb5">임산부</label>
	                <input type="checkbox" name="caution" value="4952" id="cb6" />
	                <label for="cb6">고염</label>
	                <input type="checkbox" name="caution" value="4953" id="cb7" />
	                <label for="cb7">영유아</label>
	                <input type="checkbox" name="caution" value="4954" id="cb8" />
	                <label for="cb8">패스트푸드</label>
	                <input type="checkbox" name="caution" value="4955" id="cb9" />
	                <label for="cb9">견과류</label>
	                <input type="checkbox" name="caution" value="4956" id="cb10" />
	                <label for="cb10">알러지 유발 식품</label>
	                <input type="checkbox" name="caution" value="4957" id="cb11" />
	                <label for="cb11">고열량</label>
	                <input type="checkbox" name="caution" value="4958" id="cb12" />
	                <label for="cb12">많이 매움</label>
	                <input type="checkbox" name="caution" value="4959" id="cb13" />
	                <label for="cb13">무염</label>
	            </div>
	          </div>
	        </div>
	      </form>
	      <div id="kby_search">
	        <div class="kby_search">
	          <form action="#" method="">
	            	<input type="text" id="kby_search_box" placeholder="오늘 뭐 먹지?" />
	           		<button><i class="fas fa-search fa-3x"></i></button>
				<div id="kby_search_list">
					
				</div>
	          </form>
	        </div>
	      </div>
	
	      <div id="kby_right_navbar" class="kby_navbar">
	        <span class="kby_open-slide">
	          <a href="#" class="ingredientbutton">
	            <div>
	              재료검색
	            </div>
	          </a>
	        </span>
	      </div>
	      <form>
	        <div id="kby_right-menu" class="kby_right-nav">
	
	        </div>
	      </form>
	    </div>
	      
	    <div>
	      <c:choose>
	      	<c:when test="${user eq null}">
		      <a id ="k_noneloginButton" href="/yoribogo/login/loginform.do">로그인해주세요<i class="fas fa-user-circle fa-2x"></i></a> 
	      	</c:when>
	      	<c:otherwise>
	      	  
		      <a id ="k_noneloginButton" href="/yoribogo/login/loginform.do" style="right:70px;">로그아웃</a> 
	      	  <a id="loginButton" href="/yoribogo/mypage/mypage.do"><span>${sessionScope.user.memId}</span>
		      <img id="loginSuccess" src="${pageContext.request.contextPath}${sessionScope.user.memProfile}" /></a>
	      	</c:otherwise>
	      </c:choose>
	    </div>
	</span>
	

	<span id="up"><a href="#"><i
			class="fas fa-angle-double-up fa-4x"></i></a></span>
			
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rangeslider.js/2.3.0/rangeslider.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://codepen.io/MilanMilosev/pen/EoLBjo"></script>
	<script>
		let time1 = 0;
		let time2 = 60;
		let kcal1 = 0;
		let kcal2 = 1000;
		let path = "${pageContext.request.contextPath}";
		let level;
		let user = "${sessionScope.user.memId}";
		let userNo = "${user.memNo}";
		
		console.log("user : " + user);
		console.log(typeof user);
// 		let userProfile = "${pageContext.request.contextPath}${sessionScope.user.memProfile}";
		
		console.log(time1);
		$("#confirm").click(function () {
			$( "#time" ).val(time1+"*"+time2);
			$( "#kcal" ).val(kcal1+"*"+kcal2);
			$("#doSubmit").submit();
		});

	    $(document).ready(function () {
	      $('#kby_left_navbar').click(function () {
	        $('.kby_side-nav').fadeToggle(600);
	      })
	    });
	    $(document).ready(function () {
	      $('#kby_right_navbar').click(function () {
	        $('.kby_right-nav').fadeToggle(600);
	      })
	    });

	    $(".kby_v-tab_content").hide();
	    $(".kby_v-tab_content:first").show();

	    $(".kby_v-tab_tab-head li").click(function () {

	      $(".kby_v-tab_content").hide();
	      var activeTab = $(this).attr("rel");
	      $("#" + activeTab).fadeIn();
	      $(".kby_v-tab_tab-head li").removeClass("kby_active");
	      $(this).addClass("kby_active");
	    });

	    $(".kby_v-tab_tab-head > li").on("click", function () {
	      $(".kby_v-tab_container > h2").text($(this).text());
	    }) 

	    $( function() {
	    $( "#slider-range" ).slider({
	      range: true,
	      min: 0,
	      max: 60,
	      step: 1,
	      values: [ 0, 60 ],
	      slide: function( event, ui ) {
	      let start = ui.values[ 0 ] + "분";
	      let end = " ~ " + ui.values[ 1 ] + "분";
	      if (ui.values[ 1 ] == 60) {
	        end = start + " 이상";
	        start = "";
	      }
	      time1 = ui.values[ 0 ];
	      time2 = ui.values[ 1 ];
	      console.log(time1);
	        $( "#time" ).val(start + end);
	      }
	    });
	    $( "#time" ).val($( "#slider-range" ).slider( "values", 0 ) + "분" +
	      " ~ " + $( "#slider-range" ).slider( "values", 1 ) + "분");
	  } );

	    $( function() {
	    $( "#slider-range2" ).slider({
	      range: true,
	      min: 0,
	      max: 1000,
	      step: 10,
	      values: [ 0, 1000 ],
	      slide: function( event, ui ) {
	      let start = ui.values[ 0 ] + "kcal";
	      let end = " ~ " + ui.values[ 1 ] + "kcal";
	      if (ui.values[ 1 ] == 1000) {
	        end = start + " 이상";
	        start = "";
	      }
	      kcal1 = ui.values[ 0 ];
	      kcal2 = ui.values[ 1 ];
	        $( "#kcal" ).val(start + end);
	      }
	    });
	    $( "#kcal" ).val($( "#slider-range2" ).slider( "values", 0 ) + "kcal" +
	      " ~ " + $( "#slider-range2" ).slider( "values", 1 ) + "kcal");
	  } );
	    
		$("#kby_search_box").focus(function () {
			$("#kby_search_list").css("max-height", "500px");
		})
		$("#kby_search_box").blur(function () {
			$("#kby_search_list").css({"max-height":"0px","transition":".5s"});
		})
	    
	   	$("#kby_search_box").keyup(function () {
	   		let input = $("#kby_search_box").val();
	   		if (input == "") {
	   			return;
	   		}
	   		let result = "";
	   		console.log(input);
	   		$.ajax({
				type: "POST",
				url: "searchajax.do",
				data: "search=" + input,
				dataType: "json",
				success: function (search) {
// 					if (search.length < 3) {
// 						for (let i = 0; i < search.length; i++) {
// 							let list = search[i];
// 							let summary = list.summary;
// 							if (summary.length > 12) {
// 								summary = summary.substring(0, 10) + "..";
// 							}
// 							result += '<div class="search material-drop-shadow">';
// 							result += '<div class="search-img-wrap">';
// 							result += '<div class="search-img-frame">';
// 							result += '<img class="search-img" src="' + path + list.photo + '"/>';
// 							let str = '<img class="search-img" src="' + path + list.photo + '"/>';
// 							result += '</div>';
// 							result += '</div>';
// 							result += '<div class="search-info flex-container">';
// 							result += '<div class="search-info-name">';
// 							result += '<a href="detail.do?no=' + list.no + '&memNo=' + userNo + '"><h3>' + list.title + '</h3></a>';
// 							result += '</div>';
// 							result += '<div class="search-info-details">';
// 							result += '<p>' + summary + '</p>';
// 							result += '</div>';
// 							result += '</div>';
// 							result += '</div>';
// 						}
// 					} else {
						for (let i = 0; i < search.length; i++) {
							let list = search[i];
							let summary = list.summary;
							if (summary.length > 12) {
								summary = summary.substring(0, 10) + "..";
							}
							result += '<div class="search material-drop-shadow">';
							result += '<div class="search-img-wrap">';
							result += '<div class="search-img-frame">';
							result += '<img class="search-img" src="' + path + list.photo + '"/>';
							result += '</div>';
							result += '</div>';
							result += '<div class="search-info flex-container">';
							result += '<div class="search-info-name">';
							result += '<a href="detail.do?no=' + list.no + '&memNo=' + userNo + '"><h3>' + list.title + '</h3></a>';
							result += '</div>';
							result += '<div class="search-info-details">';
							result += '<p>' + summary + '</p>';
							result += '</div>';
							result += '</div>';
							result += '</div>';
						}
// 						result += '<div class="search-img-wrap">';
// 						result += '<a href="detail.do?no=' + list.no + '&memNo=' + userNo + '"><h3>더보기</h3></a>';
// 						result += '</div>';
// 						result += '<div>더보기</div>'
					
			 		$("#kby_search_list").html(result);
				}
	   		});
	   	});
	</script>
			