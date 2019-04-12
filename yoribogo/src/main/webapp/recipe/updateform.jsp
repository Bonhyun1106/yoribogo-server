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
// �ε� �� DB���� �Ѿ�� ���� option�� �������� ���� ��� selected = true ���·� ����.. 
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
        <a id="loginButton" href="login.html">�α������ּ���<i class="fas fa-user-circle fa-2x"></i></a>
    </span>
    <span id="up"><a href="#"><i class="fas fa-angle-double-up fa-4x"></i></a></span>
    <div style="height: 70px;"></div>

    <div id="all" class="all">
        <div id="insert">${user.memId}���� �����Ǹ� �Ұ����ּ���</div>
        
        
        
        
        
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
                <input type="file" name="mainImg" id="mainImg" placeholder="������ ÷���ϼ���" />
                <div id="main_img"></div>
            </div>
        </div>

        <div id="line">�丮�� ���� �˷��ּ���</div>

        <div id="ingrd-wrapper">
            <div class="cookinfo">
                <div class="select-ingrds">
                    <div class="ingrd-title">���</div>
                    <div>
                        <select name="country" id="country">
                            <option value="">�����ϼ���</option>
                            <option value="4908" <c:if test="${recipe.country == 4908}">selected</c:if> >�ѽ�</option>
                            <option value="4909" <c:if test="${recipe.country == 4909}">selected</c:if> >���</option>
                            <option value="4910" <c:if test="${recipe.country == 4910}">selected</c:if> >�߽�</option>
                            <option value="4911" <c:if test="${recipe.country == 4911}">selected</c:if> >�Ͻ�</option>
                            <option value="4912" <c:if test="${recipe.country == 4912}">selected</c:if> >�����ƽþ�</option>
                            <option value="4913" <c:if test="${recipe.country == 4913}">selected</c:if> >��Ÿ�ƽþ�</option>
                            <option value="4914" <c:if test="${recipe.country == 4914}">selected</c:if> >��Ÿ</option>
                        </select>
                    </div>
                </div>
                <div class="select-ingrds">
                    <div class="ingrd-title">����</div>
                    <div>
                        <select name="type" id="type">
                            <option value="">�����ϼ���</option>
                            <option value="4915" <c:if test="${recipe.type == 4915}">selected</c:if> >��/��</option>
                            <option value="4916" <c:if test="${recipe.type == 4916}">selected</c:if> >�</option>
                            <option value="4917" <c:if test="${recipe.type == 4917}">selected</c:if> >����</option>
                            <option value="4918" <c:if test="${recipe.type == 4918}">selected</c:if> >��</option>
                            <option value="4919" <c:if test="${recipe.type == 4919}">selected</c:if> >����</option>
                            <option value="4920" <c:if test="${recipe.type == 4920}">selected</c:if> >��</option>
                            <option value="4921" <c:if test="${recipe.type == 4921}">selected</c:if> >������</option>
                            <option value="4922" <c:if test="${recipe.type == 4922}">selected</c:if> >����</option>
                            <option value="4923" <c:if test="${recipe.type == 4923}">selected</c:if> >����</option>
                            <option value="4924" <c:if test="${recipe.type == 4924}">selected</c:if> >��/����Ʈ</option>
                            <option value="4925" <c:if test="${recipe.type == 4925}">selected</c:if> >��Ÿ</option>
                        </select>
                    </div>
                </div>
                <div class="select-ingrds">
                    <div class="ingrd-title">����(Kcal)</div>
                    <div>
                        <input type="text" name="kcal" value="${recipe.kcal}" />
                    </div>
                </div>
            </div>
            <div class="cookinfo">
                <div class="select-ingrds">
                    <div class="ingrd-title">����</div>
                    <div>
                        <select name="weather">
                            <option value="">�����ϼ���</option>
                            <option value="4941" <c:if test="${recipe.weather == 4941}">selected</c:if> >����</option>
                            <option value="4942" <c:if test="${recipe.weather == 4942}">selected</c:if> >��/�帲</option>
                            <option value="4943" <c:if test="${recipe.weather == 4943}">selected</c:if> >��</option>
                            <option value="4944" <c:if test="${recipe.weather == 4944}">selected</c:if> >���</option>
                            <option value="4945" <c:if test="${recipe.weather == 4945}">selected</c:if> >�߿</option>
                        </select>
                    </div>
                </div>
                <div class="select-ingrds">
                    <div class="ingrd-title">���̵�</div>
                    <div>
                        <select name="level">
                            <option value="">�����ϼ���</option>
                            <option value="4936" <c:if test="${recipe.level == 4936}">selected</c:if> >�ſ콬��</option>
                            <option value="4937" <c:if test="${recipe.level == 4937}">selected</c:if> >����</option>
                            <option value="4938" <c:if test="${recipe.level == 4938}">selected</c:if> >����</option>
                            <option value="4939" <c:if test="${recipe.level == 4939}">selected</c:if> >�����</option>
                            <option value="4940" <c:if test="${recipe.level == 4940}">selected</c:if> >�ſ�����</option>
                        </select>
                    </div>
                </div>
                <div class="select-ingrds">
                    <div class="ingrd-title">�����ð�(��)</div>
                    <div>
                        <input type="text" name="time" value="${recipe.time}"/>
                    </div>
                </div>
            </div>
        </div>


        <div id="wrapper-grocery">
            <div class="grocery">
                <div style="margin: 0 auto; line-height: 50px;">���</div>
                <div><input type="text" name="ingredient" placeholder="��Ḧ �Է��ϼ���" /></div>
                <div><i class="fas fa-plus-square fa-2x"></i></div>
            </div>
            <div class="groceryList" name="ingrdList">
            	<c:forEach var="ingre" items="${ingredient}">
            		${ingre}
            	</c:forEach>
            </div>
        </div>


        <div id="content-wrapper">
            <div>������ ������ �Է��ϼ���</div>
            <div></div>
            <div></div>
            <div></div>
        </div>

        <div id="refer-wrapper">
            <div style="margin : 0 auto;">������ �����ǰ� �ֳ���?</div>
            <div>
                <input id="search" type="text" placeholder="�ٸ� ����� �����Ǹ� �˻��� ������" />
            </div>
            <div><i class="fas fa-search fa-2x"></i></div>
        </div>

        <div id="submit">
            <button>����ϱ�</button>
        </div>
        
</form>
</div>

    <footer style="position: relative; width: 100%; background: gray; height: 300px; color:white;">
        <div id="footer">
            <img src="${pageContext.request.contextPath}/images/logo-vertical-300px.png" style="width: 80px;" />
            <p>
                YORIBOGO Receipes
                <br>������������å����: �����
                <br>������: 010-4955-6029(����:13:30 ~ 14:30 �����:12:00 ~ 12:01) FAX: 02-0000-0000 Email:xxxxx@yoribogo.com
                <br>
                <br>
                copyright @ YORIBOGO Corp. All Right Reserved.
            </p>
        </div>
    </footer>


</body>

</html>