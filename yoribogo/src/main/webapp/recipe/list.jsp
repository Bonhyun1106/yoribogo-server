<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%
	int i = 6;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="../css/list.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<title>Document</title>
</head>

<body>
	<span id="menubar"> <a id="logo" href="main.html"><img
			src="../images/logo-horizontal-300px.png" /></a> <a id="loginButton"
		href="login.html">로그인해주세요<i class="fas fa-user-circle fa-2x"></i></a>
	</span>

	<span id="up"><a href="#"><i
			class="fas fa-angle-double-up fa-4x"></i></a></span>

	<div class="container">
		<div class="top"></div>

		<div class="sort">

			<table>
				<thead>
					<tr>
						<th>
							<div class="inputSort">
								<label>평점순</label> <input id="sort_gradeDESC" value="gradeDESC"
									type="radio" name="sort" /> <label class="sort_desc"
									for="sort_gradeDESC"></label> <input id="sort_gradeASC"
									value="gradeASC" type="radio" name="sort" /> <label
									class="sort_asc" for="sort_gradeASC"></label>
							</div>
						</th>
						<th>
							<div class="inputSort">
								<label>좋아요순</label> <input id="sort_likeDESC" value="likeDESC"
									type="radio" name="sort" /> <label class="sort_desc"
									for="sort_likeDESC"></label> <input id="sort_likeASC"
									value="likeASC" type="radio" name="sort" /> <label
									class="sort_asc" for="sort_likeASC"></label>
							</div>
						</th>
						<th>
							<div class="inputSort">
								<label>난이도순</label> <input id="sort_levelDESC" value="levelDESC"
									type="radio" name="sort" /> <label class="sort_desc"
									for="sort_levelDESC"></label> <input id="sort_levelASC"
									value="levelASC" type="radio" name="sort" /> <label
									class="sort_asc" for="sort_levelASC"></label>
							</div>
						</th>
						<th>
							<div class="inputSort">
								<label>최신순</label> <input id="sort_latestDESC"
									value="latestDESC" type="radio" name="sort" checked="checked" />
								<label class="sort_desc" for="sort_latestDESC"></label> <input
									id="sort_latestASC" value="latestASC" type="radio" name="sort" />
								<label class="sort_asc" for="sort_latestASC"></label>
							</div>
						</th>
					</tr>
				</thead>
			</table>
		</div>

		<div class="wrapper">
		
		
			<c:forEach var='list' items='${recipe}'>
		
				<div class="recipe">
					<a href="#.">
						<div class="image">
							<div class="quality">
								<i class="fas fa-eye fa-2x"></i>${list.viewCnt} <i
									class="fas fa-heart fa-2x"></i>${list.likeCnt} <i
									class="fas fa-level-up-alt fa-2x"></i>${list.level}단계</div>
							<img src="../images/f<%=i%>.jpg" />
							<%
								i--;
							%>
						</div>

						<div class="body">
							<div class="mid">

								<div class="date">
									<c:forEach var='member' items='${member}'>
										<c:choose>
											<c:when test="${list.no eq member.memNo}">
												<div class="dateWriter">By <span id="writer_id">${member.memId}</span></div>
											</c:when>
										</c:choose>
									</c:forEach>
									<div>
										<i class="fas fa-star"></i>3.5/5
									</div>
									<time>
										<fmt:formatDate value="${list.regDate}"
											pattern="yyyy년 MM월 dd일" />
									</time>
								</div>
							</div>

							<div class="title">
								<h3>${list.title}</h3>
							</div>
							<div class="content">
								<div class="content_inner">${list.summary}</div>
							</div>

						</div>
					</a>
				</div>
			</c:forEach>
		</div>

		<div class="btn">
			<form action="insert.html">
				<br> <br>
				<button>등록</button>
			</form>

		</div>

		<div class="page">
			<ul>
				<c:if test="${pageResult.count != 0}">
					<jsp:include page="../include/pageType1.jsp">
						<jsp:param name="link" value="list.do" />
					</jsp:include>
				</c:if>
			</ul>
		</div>

	</div>

	<footer
		style="position: relative; width: 100%; background: gray; height: 300px; color: white;">
		<div id="footer">
			<img src="images/logo-vertical-300px.png" style="width: 80px;" />
			<p>
				YORIBOGO Receipes <br>개인정보관리책임자: 김우중 <br>고객센터:
				010-4955-6029(평일:13:30 ~ 14:30 토요일:12:00 ~ 12:01) FAX: 02-000-000
				Email:xxxxx@yoribogo.com <br> <br> copyright @ YORIBOGO
				Corp. All Right Reserved.
			</p>
		</div>

	</footer>

	<script>
	$("input").on("click", function () {
		console.log($("#sort_latestASC").is(":checked"));
		if ($("#sort_latestASC").is(":checked")) {
			
			
			$.ajax({
				type: "POST",
				url: "listajax.do",
				data: "sort=latestASC",
				dataType: "json",
				success: function (result) {
					console.log(result);
					for (let i=0; i<result.length; i++) {
						let list = result[i];
						console.log(`${list.viewCnt}`);
						
						 let html = '<div class="recipe">';
							html += '<a href="#.">';
							html +=	'<div class="image">';
							html +=	'<div class="quality">';
							html +=	'<i class="fas fa-eye fa-2x"></i>';
							html +=	`${list.viewCnt}`;
							html +=	'<i class="fas fa-heart fa-2x"></i>';
							html +=	`${list.likeCnt}`;
							html +=	'<i class="fas fa-level-up-alt fa-2x"></i>';
							html +=	`${list.level}'단계'`;
							html +=	'</div>';
							html +=	'<img src="../images/f1.jpg" />';
							html +=	'</div>';
							html +=	'<div class="body">';
							html +=	'<div class="mid">';
							html +=	'<div class="date">';
							html +=	'<div class="dateWriter">By <span id="writer_id"></span></div>';
							html +=	'<div>';
							html +=	'<i class="fas fa-star"></i>3.5/5';
							html +=	'</div>';
							html +=	'<time>';
							html +=	`${list.regDate}`;
							html +=	'</time>';
							html +=	'</div>';
							html +=	'</div>';
							html +=	'<div class="title">';
							html +=	`'<h3>'${list.title}'</h3>'`;
							html +=	'</div>';
							html +=	'<div class="content">';
							html +=	`'<div class="content_inner">'${list.summary}'</div>'`;
							html +=	'</div>';
							html += '</div>';
							html += '</a>';
							html += '</div>';
							console.log(html);
							$(".wrapper").html(html);
						
					} 
				}
			});
		}
	});
	
</script>

</body>

</html>