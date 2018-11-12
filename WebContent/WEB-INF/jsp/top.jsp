<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <style>
        ul.list-group.list-group-1 {
            text-align: right;
            padding: 5px 30px 0 0;
            background: #eee;
        }
        li.list-group-item.list1 {
            display: inline-block;
            border: 0;
            background: #eee;
        }

        ul.list-group.list-group-1 a{
            color: #0e0e0e;

        }
        /******login弹出层样式****/

        .form{
            width: 350px;
            background-color: #fff;
            height: 220px;
            margin: 10px auto;
        }
        .form>div{
            position: relative;
            line-height: 100%;
            margin-bottom: 8px;
        }
        .form>div input{
            width: 100%;
            height: 35px;
            border-radius: 3px;
            border: 1px solid #ddd;
            text-indent: 40px;
        }
        .form>div label{
            position: absolute;
            left: 0;
            top:10px;
            width: 30px;
            text-align: right;
            color: #808080;
        }
        .form .yanzhengma input{
            width: 50%;
            text-indent: 10px;
        }
        .form .yanzhengma img{
            height: 30px;
            width: 75px;
            font-size: 0;
            vertical-align: middle;
        }
        .form .yanzhengma a{
            font-size: small;
            text-decoration: none;
            color: #00a5e0;
        }
        .form>div.chk label{
            width: 100px;
            padding-left: 20px;
        }
        .form>div.chk input{
            width: 22px;
            height: 22px;
            margin-top: 8px;
        }
        .form>div.chk a{
            float: right;
            margin-top: 9px;
            text-decoration: none;
            color: #00a5e0;
        }
        .buts button{
            width: 48%;
            float: left;
        }
        .buts button:first-child{
            margin-right: 4%;
        }
        /************login弹出层样式结束********************/
    </style>
</head>
<body>
    <ul class="list-group list-group-1" id="top">
     
        <li class="list-group-item list1"><a href="${pageContext.request.contextPath}/login.html">首页</a></li>
        <c:if test="${userSession==null}">
        		<li class="list-group-item list1">登录【<a href="" data-toggle="modal" data-target="#myModalLogin" style="font-size: small;color:#36c6e4 ">请登录</a>】</li>
         </c:if>
        <li role="presentation" class="dropdown list-group-item list1">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
               ${userSession.username}
            </a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="${pageContext.request.contextPath}/user/view.html">个人设置</a></li>
                <li><a href="${pageContext.request.contextPath}/user/modifyPWD.html">密码修改</a></li>
                <li><a href="${pageContext.request.contextPath }/logout.do">退出</a></li>
            </ul>
        </li>
     
        <li class="list-group-item list1"><a href="${pageContext.request.contextPath}/register.html">注册</a></li>
        <li class="list-group-item list1"><a href="${pageContext.request.contextPath}/product/cart.html"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true" style="color: #5bc0de"></span>购物车</a></li>
        <li class="list-group-item list1"><a href="${pageContext.request.contextPath}/order/orderdetail.html"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>我的订单</a></li>
    </ul>
    <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
     <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
    <div class="modal" id="myModalLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Colse">
                        <span aria-hidden="true">x</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel"></h4>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/dologin.html" method="post" class="form">
                        <div class="name">
                            <label for="username"><span class="glyphicon glyphicon-user"></span></label>
                            <input type="text" placeholder="用户名" id="username" name="username">
                        </div>
                        <div class="password">
                            <label for="password"><span class="glyphicon glyphicon-lock"></span></label>
                            <input type="password" placeholder="请输入密码"  id="password" name="password">
                        </div>

                        <div class="buts">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="submit" class="btn btn-success">登录</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>