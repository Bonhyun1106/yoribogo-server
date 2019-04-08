<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>detail</title>
    <link rel="stylesheet" type="text/css" href="../css/detail.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>

<body>
    <span id="menubar">
        <a id="logo" href="main.html"><img src="images/logo-horizontal-300px.png" /></a>
        <a id="loginButton" href="login.html">�α������ּ���<i class="fas fa-user-circle fa-2x"></i></a>
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
                        <img src="images/img2.jpg" name="recIdImg"/>
                    </div>
                    <div>
                        <a href="#" name="recId">${recipe.memId}</a>
                    </div>
                </div>
            </div>
            <div class="top-right">
                <img src="images/img3.jpg" name="recMainImg"/>
            </div>
        </div>

        <div id="likebar">
            <button>
                <i class="fas fa-heart fa-2x"></i>
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
                <div name="ingredient">ȣ�л� 2��, �ƺ�ī��, �����, �丶��, �߻�ͼҽ�</div>
            </div>
        </div>

        <div id="content-wrapper">
            <div name="content1">�����Է�</div>
            <div></div>
            <div></div>
            <div></div>
        </div>

        <div id="line"></div>
        <!-- ===========================��� ��� ============================ -->
        <div id="inputComm-wrapper">
            <div class="inputId">
                <div><img src="images/img2.jpg" name="idImg"/></div>
                <div name="id">Bonhyun</div>
            </div>
            <div class="inputbox">
                <textarea placeholder="������ ����� �޾ƺ�����"></textarea>
                <!-- <div class="font">0/3000</div> -->
            </div>
            <div class="inputButton">
                <button>���</button>
            </div>
        </div>


        <!-- ===========================�ϴ�======================== -->
        <div id="commemt-wrapper">
            <div>
                <div class="comment">
                    <div class="commid">
                        <div><img src="images/img1.jpg" name="commImg1"/></div>
                        <div name="commId1">bonhyun</div>
                    </div>
                    <div>���ֳ׿�</div>
                    <div class="likecnt">
                        <div><button><i class="far fa-thumbs-up fa-2x"></i></button></div>
                        <div class="yes">3</div>
                    </div>
                    <div class="likecnt">
                        <div><button><i class="far fa-thumbs-down fa-2x"></i></i></button></div>
                        <div class="no">0</div>
                    </div>
                </div>
            </div>
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
        <h4>�̷� �����Ǹ� �����߾��!</h4>
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
                <br>������������å����: �����
                <br>������: 010-4955-6029(����:13:30 ~ 14:30 �����:12:00 ~ 12:01) FAX: 02-000-000 Email:xxxxx@yoribogo.com
                <br>
                <br>
                copyright @ YORIBOGO Corp. All Right Reserved.
            </p>
        </div>
    </footer>
    
<script>
	
</script>
    
    
</body>

</html>