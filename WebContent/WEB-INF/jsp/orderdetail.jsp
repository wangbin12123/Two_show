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
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/bootstrap.min.css">
    <style>
        hr{
            margin: 0;
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
        .table>tbody>tr>th{
            text-align: center;
            border-bottom: 0;
            border-top: 0;
            background: #fafafa url(http://s8.mogucdn.com/pic/140909/1blhwf_ieydemldmy4tombtmmytambqgiyde_5x40.gif) repeat-x;
        }
        .table>tbody>tr>td{
            position: relative;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        .table>tbody>tr>td:first-child{
            border-left: 1px solid #ddd;
        }
        .table>tbody>tr>td:last-child{
            border-right: 1px solid #ddd;
        }
        table tr td img{
            width: 80px;
            height: 80px;
        }
    </style>
</head>
<body>
<!--顶部导航-->
<%@include file="top.jsp" %>
<%@include file="search.jsp" %>


<!--主体内容-->
<hr>
<div class="container">
    <div class="row">
        <div class="col-md-3" style="background: #f7f7f7">
            <ul class="list-group">
                <li  class="list-group-item" id="userimg-part"></li>
                <li class="list-group-item">
                    <a href="${pageContext.request.contextPath}/user/view.html">账号设置</a>
                    <ul class="list-group">
                        <li class="list-group-item list2">
                  			        基本信息
                        </li>
                        <li class="list-group-item list2">
                    		        修改头像
                        </li>
                    </ul>
                </li>
                <li class="list-group-item">我的订单
                    <ul class="list-group">
                        <li class="list-group-item list2">
                            <a data-toggle="collapse" data-parent="#accordion" href="${pageContext.request.contextPath}/order/orderdetail.html" aria-expanded="true" aria-controls="collapseOne">全部订单</a>
                        </li>
                        <li class="list-group-item list2">
                       		 <span class="badge">${t1}</span>
                            <a data-toggle="collapse" data-parent="#accordion" href="${pageContext.request.contextPath}/order/orderdetail.html?state=1" aria-expanded="false" aria-controls="collapseTwo">待收货</a>
                        </li>
                        <li class="list-group-item list2">
                         	<span class="badge">${t2}</span>
                            <a data-toggle="collapse" data-parent="#accordion" href="${pageContext.request.contextPath}/order/orderdetail.html?state=2" aria-expanded="false" aria-controls="collapseThree">待付款</a>
                        </li>
                    </ul>
                </li>
                <li class="list-group-item">地址管理</li>
            </ul>
        </div>
        <div class="col-md-9">
        	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        		<div class="panel panel-default">
        			 <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="${pageContext.request.contextPath}/order/orderdetail.html" aria-expanded="true" aria-controls="collapseOne">
                          		      全部订单
                            </a>
                        </h4>
                    </div>
        			 <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
				            <table class="table">
				                <tbody>
				                    <tr>
				                        <th colspan="3">商品信息</th>
				                        <th>售后</th>
				                        <th>实付款（元）</th>
				                        <th>交易状态</th>
				                        <th>操作</th>
				                    </tr>
				                    <tr><td colspan="7" style="border: 0"></td></tr>
				                   
				                   <c:forEach var="o" items="${orderList}">
					                    <tr>
					                        <td colspan="7" style="text-align: left;background-color: cornsilk">订单编号：${o.id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下单时间：<fmt:formatDate value="${o.gmt_create}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					                    </tr>
					                     <%-- <c:forEach var="p" items="${o.product}"> --%>
					                    <tr>
					                    	
					                        <td class="col-sm-1"><img src="${pageContext.request.contextPath}/${o.product.img}" alt=""></td>
					                        <td><br>${o.product.name}</td>
					                        <td><br>均码<br></td>
					                        <td><br>退款</td>
					                        <td><br>${o.sum_price}<br>(包邮)</td>
					                    
					                        <td><br><c:if test="${o.state==1}">待收货</c:if><c:if test="${o.state ==2}">待支付</c:if></td>
					                        <td><br><a href="${pageContext.request.contextPath}/order/deleteOrder.html?id=${o.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
					                    </tr>
					                    
					                    <tr><td colspan="7" style="border: 0"></td></tr>
				                    </c:forEach> 
				                   
				                </tbody>
				            </table>
				          </div>
				        </div> 
				        </div>
				        
				         
				        
		          </div>
		         <%--  <div class="panel panel-default"> 
				        
				         <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="${pageContext.request.contextPath}/order/orderdetail.html?state=1" aria-expanded="false" aria-controls="collapseTwo">
                              		  待收货
                            </a>
                        </h4>
                    </div>
				       <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
				            <table class="table">
				                <tbody>
				                    <tr>
				                        <th colspan="3">商品信息</th>
				                        <th>售后</th>
				                        <th>实付款（元）</th>
				                        <th>交易状态</th>
				                        <th>操作</th>
				                    </tr>
				                    <tr><td colspan="7" style="border: 0"></td></tr>
				                   
				                   <c:forEach var="o" items="${orderList}">
					                    <tr>
					                        <td colspan="7" style="text-align: left;background-color: cornsilk">订单编号：${o.id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下单时间：<fmt:formatDate value="${o.gmt_create}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					                    </tr>
					                     <c:forEach var="p" items="${o.product}">
					                    <tr>
					                    	
					                        <td class="col-sm-1"><img src="${pageContext.request.contextPath}/${o.product.img}" alt=""></td>
					                        <td><br>${o.product.name}</td>
					                        <td><br>均码<br></td>
					                        <td><br>退款</td>
					                        <td><br>${o.product.price}<br>(包邮)</td>
					                    
					                        <td><br><c:if test="${o.state==1}">待收货</c:if><c:if test="${o.state ==2}">待支付</c:if></td>
					                        <td><br><span class="glyphicon glyphicon-trash"></span></td>
					                    </tr>
					                    
					                    <tr><td colspan="7" style="border: 0"></td></tr>
				                    </c:forEach> 
				                   
				                </tbody>
				            </table>
				          </div>
				        </div>  
				        </div>
				        
				        
				        <div class="panel panel-default">
				        <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="${pageContext.request.contextPath}/order/orderdetail.html?state=2 aria-expanded="false" aria-controls="collapseThree">
                                		待付款
                            </a>
                        </h4>
                    </div>
				         <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
				            <table class="table">
				                <tbody>
				                    <tr>
				                        <th colspan="3">商品信息</th>
				                        <th>售后</th>
				                        <th>实付款（元）</th>
				                        <th>交易状态</th>
				                        <th>操作</th>
				                    </tr>
				                    <tr><td colspan="7" style="border: 0"></td></tr>
				                   
				                   <c:forEach var="o" items="${orderList}">
					                    <tr>
					                        <td colspan="7" style="text-align: left;background-color: cornsilk">订单编号：${o.id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下单时间：<fmt:formatDate value="${o.gmt_create}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					                    </tr>
					                     <c:forEach var="p" items="${o.product}">
					                    <tr>
					                    	
					                        <td class="col-sm-1"><img src="${pageContext.request.contextPath}/${o.product.img}" alt=""></td>
					                        <td><br>${o.product.name}</td>
					                        <td><br>均码<br></td>
					                        <td><br>退款</td>
					                        <td><br>${o.product.price}<br>(包邮)</td>
					                    
					                        <td><br><c:if test="${o.state==1}">待收货</c:if><c:if test="${o.state ==2}">待支付</c:if></td>
					                        <td><br><span class="glyphicon glyphicon-trash"></span></td>
					                    </tr>
					                    
					                    <tr><td colspan="7" style="border: 0"></td></tr>
				                    </c:forEach> 
				                   
				                </tbody>
				            </table>
				          </div>
				        </div> 
				      </div>  --%>
		     
             <a href="${pageContext.request.contextPath}/order/orderdetail.html?currentPage=1">首页</a>
                  <c:if test="${currentPage!=1&&allPage!=1}"><a href="${pageContext.request.contextPath}/order/orderdetail.html?currentPage=${currentPage-1}">上一页</a></c:if>
                  <c:forEach items="${yeMeiList}" var="ck"><a href="${pageContext.request.contextPath}/order/orderdetail.html?currentPage=${ck}">
                  <c:choose>
                  <c:when test="${ck==currentPage}"><span style="color:red">${ck}</span></c:when><c:otherwise>${ck}</c:otherwise></c:choose></a>&nbsp;</c:forEach> 
                  <c:if test="${currentPage!=allPage&&allPage!=1}">
                  <a href="${pageContext.request.contextPath}/order/orderdetail.html?currentPage=${currentPage+1}">下一页</a>
                  </c:if>  
                  <a href="${pageContext.request.contextPath}/order/orderdetail.html?currentPage=${allPage}">尾页</a>
        </div>
    </div>
</div>

</body>
<script src="${pageContext.request.contextPath}js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}js/bootstrap.min.js"></script>
</html>