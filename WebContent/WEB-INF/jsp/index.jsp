<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

    <title>网上购物系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sub-menu.css">
    <script src="${pageContext.request.contextPath}/js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        .container {
            background: cornsilk;
        }
        .carousel {
            position: relative;
            width: auto;
            display: inline-block;
        }
        .carousel-inner>.item>img{
            width: 100%;
        }
        .row.row-goods{
            margin: 30px 0;
        }
        .row.row-goods img {
            width: 100%;
        }
        .col-md-12.title{
            height: 60px;
            text-align: center;
            line-height: 60px;
            font-size: 28px;
            font-family:"微软雅黑" ;
        }
        .border{
            background: url("images/border.png") no-repeat;
            height: 12px;
        }
        .bor-l{
            padding: 0 0 0 12px;
            background-position: 0 0;
        }
        .bor-r{
            padding: 0 12px 0 0;
            background-position:right -24px;
        }
        .bor-m {
            background: url("images/border.png");
            height: 12px;
            background-position: -12px -12px;
        }
        .k-border{
            padding-top: 24px;
        }
        ul.list-group.list-group-2 {
            width: 83%;
            text-align: right;
        }
        ul.list-group.list-group-2 li {
            background: none;
        }
        ul.list-group.list-group-2 li img{
            width: 100%;
        }

    </style>
</head>
<body>
    <!--顶部导航-->
    <%@include file="top.jsp"%>
    <%@include file="search.jsp"%>
    
    <!--主体内容-->
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="height: 43px;background: #f66060">
            </div>
        </div>
        <!--二级菜单、图片轮播-->
        <div class="row">
            <div class="col-md-3">
                <div class="toptitle">
                    <a style="padding-left:30px ;color:#fff;">全部商品分类</a>
                </div>
                <ul class="topmenu" id="topmenu">
                	<c:forEach var="h" items="${clist}">
			           <li>
			           	<a href="${pageContext.request.contextPath}/categroyPage.html?name=${h.name}">
			           		<p>${h.name}</p>
			           	</a>
			            </li>  		
			        </c:forEach>
                </ul>
            </div>
            <div class="col-md-6">
                <div id="carousel-explorer" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-explorer" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-explorer" data-slide-to="1"></li>
                        <li data-target="#carousel-explorer" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                        	<a href="${pageContext.request.contextPath }/goodsinfo.html?id=18">
                        		<img src="${pageContext.request.contextPath}/images/格兰菲迪.png" alt="..." style="width: 715px;height: 425px">
                        	</a>        
                            <div class="carousel-caption">
                            </div>
                        </div>
                        <div class="item">
                        	<a href="${pageContext.request.contextPath }/goodsinfo.html?id=19">
                        		 <img src="${pageContext.request.contextPath}/images/华龙冰酒.png" alt="..." style="width: 715px;height: 425px">
                        	</a>
                            <div class="carousel-caption">
                            </div>
                        </div>
                        <div class="item">
                        	<a href="${pageContext.request.contextPath }/goodsinfo.html?id=20">
                        		<img src="${pageContext.request.contextPath}/images/苏格兰威士忌.jpg" alt="..." style="width: 715px;height: 425px">
                        	</a>
                            <div class="carousel-caption">
                            </div>
                        </div>
                    </div>
                    <a class="left carousel-control" href="#carousel-explorer" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-explorer" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-md-3">
                <ul class="list-group list-group-2">
                    <li class="list-group-item"><a href="${pageContext.request.contextPath }/goodsinfo.html?id=22"><img src="${pageContext.request.contextPath}/images/马天尼.png" alt=""></a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath }/goodsinfo.html?id=21"><img src="${pageContext.request.contextPath}/images/罗莎.png" alt=""></a></li>
                </ul>
            </div>
        </div>
        <!--第三块，热卖商品-->
        <div class="row row-goods">
            <div class="col-md-12 title">
                <div class="col-md-5 ">
                    <div class="k-border">
                        <div class="border bor-l">
                            <div class="border bor-r">
                                <div class="bor-m"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 ">热卖商品</div>
                <div class="col-md-5 ">
                    <div class="k-border">
                        <div class="border bor-l">
                            <div class="border bor-r">
                                <div class="bor-m"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           	<c:forEach var="p1" items="${product1}">
           	<div class="col-md-3">
           		<a href="${pageContext.request.contextPath }/goodsinfo.html?id=${p1.id}">
           			<img src="${pageContext.request.contextPath}/${p1.img}" alt="">
           			<p>${p1.pdesc}</p>
           			<p>${p1.price}</p>
           		</a>
           	</div>
           	</c:forEach>   
        </div>
        <!--第四块，特价商品-->
        <div class="row row-goods">
            <div class="col-md-12 title">
                <div class="col-md-5 ">
                    <div class="k-border">
                        <div class="border bor-l">
                            <div class="border bor-r">
                                <div class="bor-m"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 ">特价商品</div>
                <div class="col-md-5 ">
                    <div class="k-border">
                        <div class="border bor-l">
                            <div class="border bor-r">
                                <div class="bor-m"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:forEach var="p2" items="${product2}">
            	<div class="col-md-3">
            	<a href="${pageContext.request.contextPath }/goodsinfo.html?id=${p2.id}">
        			<img src="${pageContext.request.contextPath}/${p2.img}" alt="">
         		<p>${p2.pdesc}</p>
         		<p>${p2.price}</p>
        		</a>  		
        		</div>
        	</c:forEach> 
        </div>
        <!--第五块，最新商品-->
        <div class="row row-goods">
            <div class="col-md-12 title">
                <div class="col-md-5 ">
                    <div class="k-border">
                        <div class="border bor-l">
                            <div class="border bor-r">
                                <div class="bor-m"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 ">最新商品</div>
                <div class="col-md-5 ">
                    <div class="k-border">
                        <div class="border bor-l">
                            <div class="border bor-r">
                                <div class="bor-m"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:forEach var="p3" items="${product3}">
            <div class="col-md-3">
            	<a href="${pageContext.request.contextPath }/goodsinfo.html?id=${p3.id}">
        			<img src="${pageContext.request.contextPath}/${p3.img}" alt="">
        		<p>${p3.pdesc}</p>
        		<p>${p3.price}</p>
        		</a> 
        	</div>
        	</c:forEach>  
        </div>
    </div>
</body>
    <script type="text/javascript">
        window.onload = function () {
            var Lis = document.getElementById("topmenu").getElementsByTagName("li");
            for (i = 0; i<Lis.length; i++) {
                Lis[i].onmouseover = function () {
                    this.className = "lihover";
                }
                Lis[i].onmouseout = function () {
                    this.className = "";
                }
            }
        }
    </script>
</html>