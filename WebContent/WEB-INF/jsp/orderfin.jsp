<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>网上购物系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <style>
        .container {

        }
        img{
            width: 100%;
        }
        ul{
            border: 0;
        }
        .tick{
            text-align: center;
        }
        .tickimg{
            width: 60px;
            border-radius: 50%;
            height: 57px;
            background-color: #0BB20C;
            margin: 20px auto 10px ;
            position: relative;
        }
        .tickimg:after{
            position: absolute;
            content: '7';
            font-size: 48px;
            font-weight: bold;
            color: #fff;
            top: -6px;
            left: 22px;
            transform: rotateZ(-300deg) rotateX(-180deg) ;
            -webkit-transform:rotateZ(-300deg) rotateX(-180deg);
        }
        p{
            margin: 10px 0;
        }
        .mark{
            font-size: 16px;
            color: #808080;
            padding: .2em 0;
        }
        .des-label{
            width: 100px;
            text-align: right;
            font-size: 16px;
            font-weight: bolder;
            color: #808080;
            display: inline-block;
        }
        .list-group-item{
            border: 0;
        }

    </style>
</head>
<body>
<!--顶部导航-->
<div id="top"></div>
<!--主体内容-->
<div class="container">
    <div class="row">
        <div class="col-md-offset-2 col-sm-7">
            <div class="tick">
                <div class="tickimg"></div>
                <p>购买成功</p>
            </div>
            <ul  style="margin-top: 10px" class="list-group">
                <li class="list-group-item">
                    <p  class="mark">
                        <span  class="des-label">订单号：</span>
                        <span>${order.id}</span>
                    </p>
                    <p>
                        <span class="des-label">商品名称：</span>
                        <span>${productSession.name}</span>
                    </p>
                    <p>
                        <span class="des-label">下单时间：</span>
                        <span><fmt:formatDate value="${order.gmt_create}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                    </p>
                </li>
            </ul>
            <button type="button" class="btn btn-default col-sm-offset-2 col-sm-3" onclick="window.location.href='${pageContext.request.contextPath}/order/orderdetail.html'">查看订单</button>
            <button type="button" class="btn btn-success col-sm-offset-1 col-sm-3" onclick="window.location.href='${pageContext.request.contextPath}/login.html'">继续购物</button>
        </div>
    </div>
</div>

</body>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $("#top").load("top.html");
</script>
</html>