<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品分类</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/sub-menu.css">
    <style>
        .container {
            background: cornsilk;
            padding:10px 20px 50px;
        }
        a {
            text-decoration: none;
            color: #4d4d4d;
        }
        img {
            width: 100%;
        }
        section {
            width: 100%;
            margin-top: 10px;
            overflow-y: auto;
        }
        section ul {
            border: 1px solid #dbdbdb;
            padding: 0;
            overflow-y: auto;
        }
        /*分类部分*/
        .screen ul li {
            padding: 10px;
            border-bottom: 1px dashed #dbdbdb;
            position: relative;
            line-height: 27px;
            list-style: none;
        }
        .screen ul li:last-child {
            border-bottom: 0;
        }
        .screen li .firstterm{
            position: absolute;
            color: #797979;
            font-size: 16px;
            width: 80px;
            text-align: right;
        }
        .screen li .otherterm {
            display: inline-block;
            padding-left: 100px;
        }
        .ra-brand,.ra-type,.ra-sleeve,.ra-thickness,.ra-style {
            position: relative;
            display: inline-block;
            height: 30px;
            margin: 0 20px;
        }
        input[type=radio]+a {
            display: inline-block;
            padding: 0 15px;
            height: 30px;
            line-height: 30px;
            text-align: center;
        }
        input[type=radio] {
            margin: 0;
            position: absolute;
            width: 100%;
            height: 30px;
            z-index: 10000;
            opacity: 0;
        }
        input[type=radio]:checked+a {
            background-color: #f66060;
            color: #fff;
        }
        .screen1{
            min-height: 40px;
            border: 1px solid #ddd;
            line-height: 40px;
        }
        .screen1 div span{
            display: inline-block;
            padding: 5px 10px;
            margin-left:15px ;
            color: #797979;
        }
        .goodslist ul{
            padding: 10px 0;
        }
        .goodslist ul li{
            list-style: none;
        }
        .goodslist ul li img{
            width: 100%;
        }
        .goodslist ul li p{
            text-align: center;
            margin: 5px 0 ;
            color: #4d4d4d;
        }
      
     
    </style>
</head>
<body>
<!--顶部导航-->
<%@ include file="top.jsp" %>
<%@ include file="search.jsp" %>
<!--主体内容-->
<div class="container">
   	<section class="goodslist" >
        <ul id="goodShow">
        <c:forEach var="h" items="${testt}">
           <c:forEach var="t" items="${h.product}" >
           <li class="col-sm-3">
           		<a  href="${pageContext.request.contextPath }/goodsinfo.html?id=${t.id}" >
               		<img alt="" src="${pageContext.request.contextPath }/${t.img}"/>
               		<p>${t.name}</p>
               		<p>${t.pdesc}</p>
               		<p>${t.id}</p>
               </a>
            </li>  		
           </c:forEach>
        </c:forEach>
        </ul>
   </section>
</div>

</body>
<script src="${pageContext.request.contextPath }/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

</html>