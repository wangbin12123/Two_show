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

        }
        img{
            width: 100%;
        }
        ul{
            border: 0;
        }
        .list-address li{
            border: 0;
            list-style: none;
            margin-right: 20px;
            background: url("${pageContext.request.contextPath}/images/address.png") no-repeat;
            height: 162px;
            width: 240px;
            background-position: -240px 0;
        }
        .list-address li:hover{
            background-position: -480px 0;
        }
        .list-address li.active,.list-address li.active:hover{
            background-position: 0 0;
        }
        .table>tbody>tr>td,.table>tbody>tr>th{
            position: relative;
            text-align: center;
            border-bottom: 1px solid #ddd;
            border-top: 0;
        }
        p {
            margin: 5px 0 5px 0;
        }
        h3{
            margin-top: 0;
        }
        .footer{
            height: 40px;
            line-height: 40px;
            text-align: right;
            margin-bottom: 80px;
        }
        select{
            -webkit-appearance: none;
            height: 32px;
            border-radius: 5px;
            border: 1px solid #ddd;
            text-align: center;
            padding: 0 10px;
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
        <div class="col-sm-12">
            <h3 class="title">确认收货地址</h3>
            <p class="text-right"><a href="javascript:void(0);" data-toggle="modal" data-target="#myModalAddress">添加地址</a></p>
            <p class="text-right"><a href="javascript:void(0);" data-toggle="modal" data-target="#updateModalAddress" class="#updateModalAddress">修改地址</a></p>
            <ul class="list-address " >
            	<c:forEach var="h" items="${usertt}">
	            		<li class="col-sm-3">
	            	  	<h4>${h.aname}</h4>
	            	  	<div style="padding-top: 5px" class="clk_info_addr">
		            	  	<span>${h.province}</span>
		            	  	<span>${h.city}</span>
		            	  	<span>${h.county}</span>
		            	  	<span>${h.detailed}</span>	                  	 
				           	<p>${h.atel }</p>
			            </div>
			            <input type="hidden" name="addressId"  value="${h.id}"/>
			           </li>
		          </c:forEach>
            </ul>
        </div>
        <div class="col-sm-12" style="margin-top: 30px">
            <h3 class="title">确认商品信息</h3>
            <table class="table " style="margin-top: 10px">
                <tbody>
                    <tr>
                        <th>商品信息</th>
                        <th>商品名称</th>
                        <th>金额（元）</th>
                 		<th>数量</th>
                        <th>小计（元）</th>
                    </tr>
                    <tr>
                        <td class="col-sm-1">
                            <img src="${pageContext.request.contextPath}/${product.img}" alt="">
                        </td>
                        <td><br>${product.name}</td>
                        <td><br>价格：${product.price}</td>
                        <td><br>${count}</td>
                        <td><br>${product.price*count}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="footer">
       	 共有<span style="color: #f71117 ">${count}</span>件商品，共计：<span style="color: #f71117;font-size: 24px">${product.price*count}</span>元
        <button class="btn btn-warning btn-lg">
        	<a  href="${pageContext.request.contextPath}/orderadd.html?productId=${product.id}&AllPrice=${product.price*count}">确认并付款</a>
        </button>
    </div>
</div>
<div class="modal fade" id="myModalAddress" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加收货地址</h4>
            </div>
            <div class="modal-body" style="overflow: auto">
                <form class="form-horizontal col-sm-10" action="${pageContext.request.contextPath}/addAddress.html" method="post">
                    <input type="hidden" name="pid" value="${product.id}">
                     <input type="hidden" name="cuu" value="${count}">
                    <div class="form-group">
                        <label for="aname" class="col-sm-3 control-label">姓名</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="aname" name="aname" placeholder="收货人姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="atel" class="col-sm-3 control-label">电话</label>
                        <div class="col-sm-9">
                            <input type="tel" class="form-control" id="atel" name="atel" placeholder="电话">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">收货地址</label>
                        <div class="col-sm-9">
                            <select id="province" name="province"></select>
                            <select id="city" name="city" ></select>
                            <select id="county" name="county" onchange="showArea()"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="detailed" class="col-sm-3 control-label">详细地址</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="detailed" name="detailed" placeholder="详细地址">
                        </div>
                    </div>
                    <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		                <button type="submit" class="btn btn-primary">确认添加</button>
		            </div>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="updateModalAddress" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="updateModalLabel">修改收货地址</h4>
            </div>
            <div class="modal-body" style="overflow: auto">
                <form class="form-horizontal col-sm-10" action="${pageContext.request.contextPath}/updateAddress.html" method="post">
                    <input type="hidden" name="id" id="id" />
                    <input type="hidden" name="cu" value="${count}">
                    <input type="hidden" name="pid" value="${product.id}">
                    <div class="form-group">
                        <label for="uname" class="col-sm-3 control-label">姓名</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="uname" name="aname" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="utel" class="col-sm-3 control-label">电话</label>
                        <div class="col-sm-9">
                            <input type="tel" class="form-control" id="utel" name="atel" value="">
                        </div>
                    </div>
                   <div class="form-group">
                        <label class="col-sm-3 control-label">收货地址</label>
                        <div class="col-sm-9">
                            <select id="uprovince" name="province"></select>
                            <select id="ucity" name="city" ></select>
                            <select id="ucounty" name="county" onchange="showArea()"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="udetailed" class="col-sm-3 control-label">详细地址</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="udetailed" name="detailed" placeholder="详细地址">
                        </div>
                    </div>
                    <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		                <button type="submit" class="btn btn-primary">确认修改</button>
		            </div>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/area.js"></script>
<script type="text/javascript">
	let href = $("button a").attr("href");
    $(document).ready(function () {
    	_init_area();
    	var aid=null;
    	var id=null;
        $('ul>li').click(function (e) {
            e.preventDefault();
            $('ul > li').removeClass('active');
            $(this).addClass('active');
        });
        $(".clk_info_addr").click(function(){
        	aid=$(this).prev().text();
        	id=$(this).next().val();
      		$("button a").attr("href", href + "&addressId=" + id)
        	$("#id").val(id);
        	let spans = $(this).children();
        	let vals = [];
        	for (let i = 0; i < spans.length; i++) {
        		vals.push(spans[i].innerText)
        	}
        	console.log(vals)
        	$('#uname').val(aid)
	       	$('#uprovince').val(""+vals[0]);
	       	$('#ucity').val(""+vals[1]);
	       	$('#ucounty').val(""+vals[2]);
	       	$('#udetailed').val(""+vals[3]);
	      	$('#utel').val(""+vals[4]); 
        });
    });
</script>
</html>