<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Two_Shop管理系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/bg/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/bg/public.css" />
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>Two_Shop 后台管理</h1>
        <div class="publicHeaderR">
            <p><span style="color: #fff21b"> ${userSession.username}</span> , 欢迎你！</p>
            <a href="${pageContext.request.contextPath }/bg/logout.do">退出</a>
        </div>
    </header>
<!--时间-->
    <section class="publicTime">
        <span id="time"></span>
    </section>
 <!--主体内容-->
 <section class="publicMian ">
     <div class="left">
         <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
         <nav>
             <ul class="list">
              <li><a href="${pageContext.request.contextPath}/aaa">类别管理</a></li>
              <li><a href="${pageContext.request.contextPath}/productList1.html">商品管理</a></li>
             </ul>
         </nav>
     </div>
     <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath}"/>
     <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>