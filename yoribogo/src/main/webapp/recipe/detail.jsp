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
    <jsp:include page="../include/menu.jsp"/>
    
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
                        <img src="${pageContext.request.contextPath}${user.memProfile}" name="recIdImg"/>
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
            <button id="like" <c:if test='${likeCnt == 1}'>style='background:white; border : 1px solid #ed1c24;'</c:if> >
                <i class="fas fa-heart fa-2x" id="likeIcon" <c:if test='${likeCnt == 1}'>style='color:red;'</c:if>></i>
            </button>
        </div>

        <!-- ===========================�߰�======================== -->
        <div id="ingrd-wrapper">
            <div class="cookinfo">
                <div>
                    <div class="ingrd-title">���</div>
                    <div name="country">${recipe.country}</div>
                </div>
                <div>
                    <div class="ingrd-title">����</div>
                    <div name="type">${recipe.type}</div>
                </div>
                <div>
                    <div class="ingrd-title">���̵�</div>
                    <div name="level">${recipe.level}</div>
                </div>
                <div>
                    <div class="ingrd-title">����</div>
                    <div name="kcal">${recipe.kcal}kcal</div>
                </div>
                <div>
                    <div class="ingrd-title">�����ð�</div>
                    <div name="time">${recipe.time}��</div>
                </div>
                <div>
                    <div class="ingrd-title">��õ����</div>
                    <div name="weather">${recipe.weather}</div>
                </div>
            </div>
            <div>
                <div class="ingrd-title">�ʿ��� ���</div>
                <div name="ingredient">
                	<c:forEach var="ingre" items="${ingredient}" >
                		${ingre}
                	</c:forEach>
                </div>
            </div>
        </div>

        <!-- =========================== ���� ============================ -->
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
        <!-- ===========================��� ��� ============================ -->
        <form name="commentForm" id="commentForm" method="post">
        <div id="inputComm-wrapper">
            <div class="inputId">
                <div><img src="${pageContext.request.contextPath}${user.memProfile}" name="idImg"/></div>
                <div name="id">${user.memId}��</div>
            </div>
            <div class="inputbox">
	        	<input type="hidden" id="recNo" name="recNo" value="${recipe.no}">
	        	<input type="hidden" id="commId" name="commId" value="${user.memNo}">
                <textarea rows="5" cols="100" placeholder="������ ����� �޾ƺ�����" name="commContent" id="commContent"></textarea>
                <!-- <div class="font">0/3000</div> -->
            </div>
            <div class="inputButton">
                <button id="inputButton">���</button>
            </div>
        </div>
   	    </form>


        <!-- ===========================�ϴ�======================== -->
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

        <!-- ========================= ���� ������ ============================ -->
        <div id="line"></div>
        <h4>�̷� �����Ǵ� �����?</h4>
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
            <img src="${pageContext.request.contextPath}/images/logo-vertical-300px.png" style="width: 80px;" />
            <p>
                YORIBOGO Receipes
                <br>������������å����: �����
                <br>������: 010-4955-6029(����:13:30 ~ 14:30 �����:12:00 ~ 12:01) FAX: 02-000-000 Email:xxxxx@yoribogo.com
                <br>
                <br>
                copyright @ YORIBOGO Corp. All Right Reserved.
            </p>
        </div>
    </footer>
    
<script>
	$(function() {
		// null �� ó��
		function nvl(str, defaultStr){
	        if(typeof str == "undefined" || str == null || str == "") str = defaultStr;
	        return str;
	    };
		
		function getCommentList(){
			//alert("��� ȣ��");
			var no = ${recipe.no};
			
			$.ajax({
				url:"listcomment.do",
				/* type: "post", */
				data:"no="+ no,
				dataType:"json",
				success: function(list){
					console.log("list", list);
					console.dir(list);
					let html = "";
					let path = "${pageContext.request.contextPath}";
					for(let i=0 ; i < list.length; i++){
 						html += '<div class="comment" id ="'+ list[i].commentNo + '">'
 							 + '<input type="hidden" id="commentNo" name="commentNo" value="'+ list[i].commentNo + '">'
		                     + 		'<div class="commid">'
		                     +      	"<div><img src='" 
		                     + 				path + list[i].profile + ".png"
		                     + 			"'></div>"
		                     +      	'<div name="commId1">' + list[i].memId + '</div>'
		                     +      	'<input type="hidden" id="commWriterId" name="commWriterId" value="'+list[i].memNo+'">' 
		                     +		'</div>'
		                     + 		'<div>' + list[i].commentContent + '</div>'
		                     + 		'<div class="likecnt">'
		                     +     		'<div><button id="commlikeBtn"><i class="far fa-thumbs-up fa-2x" <c:if test='${commentLikeCnt == 1}'>style='color:red;'</c:if>'
		                     +			'></i></button></div>'
		                     +     		'<div class="yes">' + list[i].commentLikeCnt + '</div>'
		                     +     		'<input type="hidden" name="commlikeCnt" value="' + list[i].commentLikeCnt + '" />'
		                     +     		'<div><button id="commreportBtn"><i class="far fa-thumbs-down fa-2x"></i></i></button></div>'
		                     +     		'<div class="no">'+ list[i].commentReportCount + '</div>'
		                     +     		'<input type="hidden" name="commreportCnt" value="' + list[i].commentLikeCnt + '" />'
		                     + 		'</div>'
		                     +		'<div>'
		                     +			'<div id="commBtn">'
		                     +				'<div><button id="editCom" value="' + list[i].commentNo + '">����</button></div>'
		                     +				'<div><button id="delCom" value="' + list[i].commentNo + '">����</button></div>'
		                     +			'</div>'
		                     +		'</div>'
		                	 + '</div>';
					}
					$("#addComm").html(html);
				}
			});
		};
		// ȣ��
		getCommentList();
		
		// ��� ���
		$("form").submit(function () {
			$.ajax({
				url: "insertcomment.do",
				type : "post",
				data : $(this).serialize(),
				success: function(){
					getCommentList();
					alert("��ϵǾ����ϴ�.");
				}
			})
		});
		
		// ��� ���� ===================================================
		$(document).on("click","#delCom",function(){ 
			
			// �α��� ȸ����ȣ == ����ۼ��� ȸ����ȣ
			let memNo = nvl(("${user.memNo}"), 99999);
			let commWriter = $("#commWriterId").val();
			let commNo = $("#delCom").val();
			
			console.log("��� ��ȣ(��ȸ�� 99999): ", memNo);
			console.log("��� �ۼ��� : ", commWriter);
			console.log("������ ��� ��ȣ: ", commNo);
			
			if(memNo != 99999){
					console.log("ajax ȣ��");
					$.ajax({
						url: "deletecomment.do",
						data : {memNo:memNo, commWriter:commWriter, commNo:commNo},
						success: function(check){
							if(check == 1){
								$("#"+commentNo).remove();
								alert("�����Ǿ����ϴ�.");
								return;
							} else{
								alert("��� �ۼ��ڸ� ������ �� �־��!");
								return;
							}
						}
					})
			} else{
				alert("�α��� ���ּ���");
			}
			
			
			
			
			
			
			
			
			
			
			$.ajax({
				url : "deletecomment.do",
				data : "commentNo=" + commentNo,
				success: function() {
					$("#"+commentNo).remove();
					alert("�����Ǿ����ϴ�.");
				}
			})
		});
		
		// ��� ����   ??????????????????????????????????????????????????????
		$(document).on("click", "#editCom", function() {
			$("#commId1").html(`<textarea rows="5" cols="100" value="$(this).val()" name="editContent" id="editContent"></textarea>`);
			
			let commentNo = $(this).val();
			$.ajax({
				url : "updatecomment.do",
				data : "commentNo=" + commentNo,
				success: function() {
					
				}
			})
		});
		
		/* ==== ��� ���ƿ� ==== */
		$(document).on("click", "#commlikeBtn", function() {
			// �α��� �����ȣ, ��۹�ȣ �Ѱ��ֱ�
			let commentNo = $("#commentNo").val();
			let memNo = nvl(("${user.memNo}"), 99999);
			
			console.log("��۹�ȣ : ", commentNo);
			console.log("��� ��ȣ(��ȸ�� 99999): ", memNo);
			
			if(memNo != 99999){
					console.log("ajax ȣ��")
					$.ajax({
						url: "likecomment.do",
						data : {memNo:memNo, commentNo:commentNo},
						success: function(check){
							if(check == 1){
								alert("�� ����� �̹� ���ƿ� �߾��!");
								return;
							} else{
								alert("���ƿ�!");
								$("#commlikeBtn > i").css('color','red');
								return;
							}
						}
					})
			} else{
				alert("�α��� ���ּ���");
			}
		});

		/* ====== ���ƿ� ====== */
		$("#like").click(function (){
			let memNo = nvl(("${user.memNo}"), 99999);	// 99999 : ��ȸ��
			let recipeNo = ${recipe.no};
			
			console.log("��� ��ȣ(��ȸ�� 99999): ", memNo);
			
			if(memNo != 99999){
				console.log("ajax ȣ��")
				$.ajax({
					url : "like.do",
					data: {
						memNo : memNo,
						recipeNo : recipeNo
					},
					success: function(check){
						if(check == 1){
							alert("�̹� �� �����Ǹ� ���ƿ� �ϼ̳׿�!");
							return;
						} else{
							alert("���ƿ�!");
							$("#like").css('background','white');
							$("#like").css('border', '1px solid #ed1c24');
							$("#likeIcon").css('color', "red");
							$("#likeIcon").css('animation',"transform .2s linear");
							return;
						}
					}
				});
			} else{
				alert("�α��� ���ּ���");
			}
		});
	});
	
	
	
	
	
</script>
    
    
</body>

</html>