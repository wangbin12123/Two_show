<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            background: cornsilk;
            padding: 20px 20px 50px;
        }
        img {
            width: 100%;
        }
        .btn-info{
            width: 120px;
            margin-left: 30px;
        }
        table.table-info tr td{
            font-size: 16px;
            height: 35px;
            line-height: 35px;
        }
        table.table tr td:first-child {
            text-align: right;
        }
        table.table tr td:last-child {
            text-indent: 30px;
        }
        .radio-row{
            display: inline-block;
            width: 50px;
            height: 30px;
            margin-right: 20px;
            position: relative;
        }
        .radio-row input,.radio-row input+a{
            display: inline-block;
            width: 50px;
            height: 30px;
            position: absolute;
            top: 0;
            left: 0;
            text-indent: 0;
            font-size: 14px;
            text-align: center;
            line-height: 30px;
            color: #0e0e0e;
        }
        .radio-row input{
            z-index: 10000;
            opacity: 0;
        }
        .radio-row input+a {
            border: 1px solid #ddd;
        }
        .radio-row input:checked+a {
            border: 1px solid #c63205;
            color: #c63205;
        }
        .panel-body img{
            width: 70px;
            height: 70px;
            margin-right: 20px;
        }
    </style>
</head>
<body>
<!--顶部导航-->
<%@ include file="top.jsp" %>
<%@ include file="search.jsp" %>
<!--主体内容-->
<div class="container">
    <div class="row">
        <div class="col-md-4" >
            <img src="${pageContext.request.contextPath}/${product.img}" alt="">
        </div>
        <div class="col-md-8" >
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">商品详情</a></li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                    <table class="table table-info">
                        <tbody>
                            <tr>
                                <td class="col-xs-2">商品名称</td>
                                <td class="col-xs-10">${product.name}</td>
                            </tr>
                            <tr>
                                <td class="col-xs-2">商品价格</td>
                                <td class="col-xs-10">${product.price}</td>
                            </tr>
                            <tr>
                                <td class="col-xs-2">商品简介</td>
                                <td class="col-xs-10">${product.pdesc}</td>
                            </tr>
                            <tr>
                            <tr>
                            	<td class="col-xs-2">数量</td>
                            	<td class="col-xs-10"><input type="number" id="num"  value="1" min="1" max="1000" step="1"/></td>
                            </tr>
                            <tr>
                                <td colspan="2"  style="text-align: left;text-indent: 40px">
                                    <button type="button" class="btn btn-info" onclick="javascript:window.location.href='${pageContext.request.contextPath}/product/jiesuan.html?id='+${product.id}+'&countId='+document.getElementById('num').value">购买</button>
                                    <button type="button" class="btn btn-info" onclick="javascript:window.location.href='${pageContext.request.contextPath}/product/gouwu.html?id='+${product.id}+'&countId='+document.getElementById('num').value">加入购物车</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</html>