<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>商品管理页面 >> 商品查看页面</span>
        </div>
        <div class="providerView">
        	<p>
        		<strong>商品名称:</strong><span>${product.name}</span>
        	</p>
        	<p>
        		<strong>商品价格:</strong><span>${product.price}</span>
        	</p>
        	<p>
        		<strong>图片:</strong><span><img src="${pageContext.request.contextPath}/${product.img}" width="80px" height="80px"/></span>
        	</p>
        	<p>
        		<strong>类别:</strong>
        		<c:if test="${product.cid==1}">
				  	<span>手机</span>
				</c:if>
				<c:if test="${product.cid==2}">
					<span>奶粉</span>
				</c:if>
				<c:if test="${product.cid==3}">
					<span>短袖</span>
				</c:if>
				<c:if test="${product.cid==4}">
					<span>酒类</span>
				</c:if>
				<c:if test="${product.cid==5}">
					<span>酸奶</span>
				</c:if>
				<c:if test="${product.cid==6}">
					<span>生鲜</span>
				</c:if>
        	</p>
        	<p>
        		<strong>描述:</strong><span>${product.pdesc}</span>
        	</p>
        	
        	  <div class="providerAddBtn">
					<input type="button" id="back" name="back" value="返回" >
                </div>
        </div>
        
</div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bg/product/productview.js"></script>
