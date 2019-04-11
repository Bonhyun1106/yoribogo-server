<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="../css/list.css">


<title>Document</title>
</head>

<body>
	<jsp:include page="../include/menu.jsp"/>

	<div class="container">
		<div class="top"></div>

		<div class="sort">
			<table>
				<thead>
					<tr>
						<th>
							<div class="inputSort">
				                <label>평점순</label>
				                <input id="sort_gradeASC" value="gradeASC" type="radio" name="sort" />
				                <label class="sort_asc" for="sort_gradeASC"></label>
				                <input id="sort_gradeDESC" value="gradeDESC" type="radio" name="sort" />
				                <label class="sort_desc" for="sort_gradeDESC"></label>
			                </div>
						</th>
						<th>
							<div class="inputSort">
								<label>좋아요순</label> 
								<input id="sort_likeASC" value="likeASC" type="radio" name="sort" /> 
								<label class="sort_asc" for="sort_likeASC"></label>
								<input id="sort_likeDESC" value="likeDESC" type="radio" name="sort" /> 
								<label class="sort_desc" for="sort_likeDESC"></label> 
							</div>
						</th>
						<th>
							<div class="inputSort">
								<label>난이도순</label> 
								<input id="sort_levelASC" value="levelASC" type="radio" name="sort" /> 
								<label class="sort_asc" for="sort_levelASC"></label>
								<input id="sort_levelDESC" value="levelDESC" type="radio" name="sort" /> 
								<label class="sort_desc" for="sort_levelDESC"></label> 
							</div>
						</th>
						<th>
							<div class="inputSort">
								<label>최신순</label> 
								<input id="sort_latestASC" value="latestASC" type="radio" name="sort" />
								<label class="sort_asc" for="sort_latestASC"></label>
								<input id="sort_latestDESC" value="latestDESC" type="radio" name="sort" checked="checked" />
								<label class="sort_desc" for="sort_latestDESC"></label> 
							</div>
						</th>
					</tr>
				</thead>
			</table>
		</div>

		<div class="wrapper">
		
		
			<c:forEach var='list' items='${recipe}'>
				
				<div class="recipe">
					<a href="detail.do?no=${list.no}&memNo=${user.memNo}" >
						<div class="image">
							<div class="quality">
								<i class="fas fa-eye fa-2x"></i>${list.viewCnt} 
								<i class="fas fa-heart fa-2x"></i>${list.likeCnt} 
								<i class="fas fa-level-up-alt fa-2x"></i>
								<c:choose>
							        <c:when test = "${list.level eq 4936}">
							            매우 쉬움
							        </c:when>
							        
							        <c:when test = "${list.level eq 4937}">
							            쉬움
							        </c:when>
							        
							        <c:when test = "${list.level eq 4938}">
							            보통
							        </c:when>
							        
							        <c:when test = "${list.level eq 4939}">
							            어려움
							        </c:when>
							        
							        <c:when test = "${list.level eq 4940}">
							            매우 어려움
							        </c:when>
							        
					            </c:choose>
	           				</div>
							<img src="${pageContext.request.contextPath}${list.photo}" />
						</div>

						<div class="body">
							<div class="mid">

								<div class="date">
									<c:forEach var='member' items='${member}'>
										<c:choose>
											<c:when test="${list.memNo eq member.memNo}">
												<div class="dateWriter">By <span id="writer_id">${member.memId}</span></div>
											</c:when>
										</c:choose>
									</c:forEach>
									<div>
										<i class="fas fa-star"></i>${list.grade}/5
									</div>
									<time>
										<fmt:formatDate value="${list.regDate}"
											pattern="yy.MM.dd" />
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
			<form action="insertrecipeform.do">
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
		let sort = $('input[name="sort"]:checked').attr("value");
			$.ajax({
				type: "POST",
				url: "listajax.do",
				data: "sort=" + sort,
				dataType: "json",
				success: function (result) {
					let recipe = result[0];
					let member = result[1];
					let memId = "";
					let html = "";
					for (let i = 0; i < recipe.length; i++) {
						let list = recipe[i];
						for (let j = 0; j < member.length; j++) {
							let mList = member[j]; 
							if (list.memNo == mList.memNo) {
								memId = mList.memId;
								break;
							}
						}
						let date = moment(list.regDate).format("YY.MM.DD");
						 	html += '<div class="recipe">';
							html += '<a href="detail.do?no="' + list.no + '>';
							html +=	'<div class="image">';
							html +=	'<div class="quality">';
							html +=	'<i class="fas fa-eye fa-2x"></i>';
							html +=	list.viewCnt;
							html +=	'<i class="fas fa-heart fa-2x"></i>';
							html +=	list.likeCnt;
							html +=	'<i class="fas fa-level-up-alt fa-2x"></i>';
							switch (list.level) {
							case "4936":
								level = "매우 쉬움";
								break;
							case "4937":
								level = "쉬움";
								break;
							case "4938":
								level = "보통";
								break;
							case "4939":
								level = "어려움";
								break;
							case "4940":
								level = "매우 어려움";
								break;
							}
							html +=	level;
							html +=	'</div>';
							
							html +=	'<img src="' + path + list.photo + '"/>';
							html +=	'</div>';
							html +=	'<div class="body">';
							html +=	'<div class="mid">';
							html +=	'<div class="date">';
							html +=	'<div class="dateWriter">By <span id="writer_id">' + memId + '</span></div>';
							html +=	'<div>';
							html +=	'<i class="fas fa-star"></i>' + list.grade + '/5';
							html +=	'</div>';
							html +=	'<time>';
							html +=	date;
							html +=	'</time>';
							html +=	'</div>';
							html +=	'</div>';
							html +=	'<div class="title">';
							html +=	'<h3>' + list.title + '</h3>';
							html +=	'</div>';
							html +=	'<div class="content">';
							html +=	'<div class="content_inner">' + list.summary + '</div>';
							html +=	'</div>';
							html += '</div>';
							html += '</a>';
							html += '</div>';
							$(".wrapper").html(html);
						} 
					}
				});
			});
	
</script>


</body>

</html>