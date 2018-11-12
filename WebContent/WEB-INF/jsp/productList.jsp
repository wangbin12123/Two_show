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
    
    <!--主体内容-->
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="height: 43px;background: #f66060">
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
           	<c:forEach var="p" items="${productList}">
           	<div class="col-md-3">
           		<a href="${pageContext.request.contextPath }/goodsinfo.html?id=${p.id}">
           			<img src="${pageContext.request.contextPath}/${p.img}" alt="">
           			<p>${p.pdesc}</p>
           			<p>${p.price}</p>
           			<p>${p.id}</p>
           		</a>
           	</div>
           	</c:forEach>   
        </div>
      </div>
</body>
</html>