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
            background: cornsilk;
        }
        img{
            width: 100%;
        }
        ul{
            border: 0;
        }
        .list-group-item{
            margin-bottom: 0;
            border: 0;
            border-bottom: 1px dashed #ddd;
            background-color: inherit;
        }
        .list2{
            border-bottom: 0;
        }
        .panel-default>.panel-heading {
            color: #e4393c;
            background-color: #f7f7f7;
            border-color: #fff;
        }
        .panel-default {
             border-color: #fff;
        }
        .panel-group .panel-heading+.panel-collapse>.panel-body {
             border-top: 1px solid #fff;
        }
        .save {
            padding: 6px 30px;
        }
    </style>
</head>
<body>
<!--顶部导航-->
<%@ include file="top.jsp" %>

<!--主体内容-->
<div class="container">
    <div class="row">
        <div class="col-md-3" style="background: #f7f7f7">
            <ul class="list-group">
                <li class="list-group-item">账号设置
                    <ul class="list-group">
                        <li class="list-group-item list2">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">基本信息</a>
                        </li>
                        <li class="list-group-item list2">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">修改信息</a>
                        </li>
                    </ul>
                </li>
                <li class="list-group-item">
                    <a href="${pageContext.request.contextPath}/order/orderdetail.html">我的订单</a>
                    <ul class="list-group">
                        <li class="list-group-item list2">
                        	    全部订单
                        </li>
                        <li class="list-group-item list2">
                            <span class="badge">14</span>
                    		        待付款
                        </li>
                        <li class="list-group-item list2">
                            <span class="badge">14</span>
                    		        待收货
                        </li>
                    </ul>
                </li>
                <li class="list-group-item">地址管理</li>
            </ul>
        </div>
        <div class="col-md-8">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                              		  基本信息
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <div class="col-md-offset-1 col-md-7">
                                <p>
                                <strong>用户id昵称：</strong><span>${user.username}</span>
                            	</p>
                                <p>
                                    <strong>真实名称：</strong><span>${user.name}</span>
                                </p>
                                <p>
                                    <strong>电子邮箱：</strong><span>${user.email}</span>
                                </p>
                                <p>
                                    <strong>电话号码：</strong><span>${user.tel}</span>
                                </p>
                                <p>
                                    <strong>生日：</strong><span><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                </p>
                                <p>
                                    <strong>性别：</strong>
                              
                                    <span>
                                    	<c:if test="${user.sex == 1}">男</c:if>
                                    	<c:if test="${user.sex == 2}">女</c:if>
                                  	</span>
                                </p>
                                <p>
                                    <strong>状态：</strong>
                                    <span>
                        
                                    	<c:if test="${user.state ==1}">未激活</c:if>
                                    	<c:if test="${user.state ==2}">激活</c:if>
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                   <div class="panel-heading" role="tab" id="headingTwo">
                       <h4 class="panel-title">
                           <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                           		    修改信息
                           </a>
                       </h4>
                   </div>
                   <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <div class="col-md-offset-1 col-md-7">
                                <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user/usermodifys.html" class="form-horizontal" style="margin-top: 40px">
                                	<input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
  			  						<input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
                                	<input type="hidden" name="id" value="${user.id}">
                                	<input type="hidden" name="state" value="${user.state}"/>
                                	 
                                    <div class="form-group">
                                        <label for="username" class="col-sm-4 control-label">用户id昵称：</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" name="username" value="${user.username}" readonly>
                                            <font color="red"></font>
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                        <label for="name" class="col-sm-4 control-label">真实名称：</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" id="name12" name="name" value="${user.name}">
                                            <font color="red"></font>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="email" class="col-sm-4 control-label">电子邮箱：</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" id="email" name="email" value="${user.email}">
                                            <font color="red"></font>
                                        </div>
                                      
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="tel" class="col-sm-4 control-label">电话号码：</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" id="tel" name="tel" value="${user.tel}">
                                            <font color="red"></font>
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="form-group">
					                    <label for="birthday" class="col-sm-4 control-label">出生日期：</label>
					                   <div class="col-sm-7">
					                   		 <input type="text" Class="Wdate" id="birthday" name="birthday" 
												readonly="readonly" onclick="WdatePicker();" 
												value='<fmt:formatDate  value="${user.birthday}" pattern="yyyy-MM-dd"/>'>
												<font color="red"></font>
					                   </div>
										
					                </div>
                                 
                                   
                                   <div class="form-group">
                                        <label class="col-sm-4 control-label">性别：</label>
                                        <div class="col-sm-7">
                                            <select name="sex" id="sex">
											    <c:choose>
											    	<c:when test="${user.sex == 1}">
											    		<option value="1" selected = "selected">男</option>
											    		<option value="2">女</option>
											    	</c:when>
											    	<c:otherwise>
											    		<option value="1" >男</option>
											    		<option value="2" selected = "selected">女</option>
											    	</c:otherwise>
											    </c:choose>
											 </select>
                                        </div>
                                    </div>
                                  
                                    
                                    <div class="form-group">
                                        <div class="col-sm-offset-3 col-sm-8">
                                            <button type="reset" class="btn btn-success">重置</button>
                                             <input type="button" name="save" id="save" value="保存" class="btn btn-success">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
       
            </div>
        </div>
    </div>
</div>
</body>
<script>
	console.log(document.getElementById('birthday').value)
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/usermodify.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/calendar/WdatePicker.js"></script>
</html>