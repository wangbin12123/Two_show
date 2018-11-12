<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>商品管理页面</span>
            </div>
            <div class="search">
           		<form method="post" action="${pageContext.request.contextPath }/productList1.html">
					<input name="method" value="query" class="input-text" type="hidden">
					 <span>商品名称：</span>
					  <input name="name" class="input-text"	type="text" value="${name}">
					 <input type="hidden" name="pageIndex" value="1"/>
					 <input	value="查 询" type="submit" id="searchbutton">
					 <a href="${pageContext.request.contextPath}/productadd.html" >添加商品</a>
				</form>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="20%">商品名称</th>
                    <th width="10%">价格</th>
                    <th width="10%">类别</th>
                    <th width="10%">图片</th>
                    <th width="10%">创建时间</th>
                    <th width="30%">操作</th>
                </tr>
                   <c:forEach var="p" items="${productList}" varStatus="status">
					<tr>
						<td>
						<span>${p.name}</span>
						</td>
						<td>
						<span>${p.price}</span>
						</td>
						<td>
							<c:if test="${p.cid==1}">
								<span>手机</span>
							</c:if>
							<c:if test="${p.cid==2}">
								<span>奶粉</span>
							</c:if>
							<c:if test="${p.cid==3}">
								<span>短袖</span>
							</c:if>
							<c:if test="${p.cid==4}">
								<span>酒类</span>
							</c:if>
							<c:if test="${p.cid==5}">
								<span>酸奶</span>
							</c:if>
							<c:if test="${p.cid==6}">
								<span>生鲜</span>
							</c:if>
						</td>
						<td>
						<span><img src="${pageContext.request.contextPath}/${p.img}" width="80px" height="80px"/></span>
						</td>
						<td>
							<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${p.gmt_create}"/></span>
						</td>
						<td>
						<span><a class="viewProduct" href="javascript:;" productid=${p.id } productName=${p.name }><img src="${pageContext.request.contextPath }/images/bg/read.png" alt="查看" title="查看"/></a></span>
						<span><a class="modifyProduct" href="javascript:;" productid=${p.id } productName=${p.name }><img src="${pageContext.request.contextPath }/images/bg/xiugai.png" alt="修改" title="修改"/></a></span>
						<span><a class="deleteProduct" href="javascript:;" productid=${p.id } productName=${p.name }><img src="${pageContext.request.contextPath }/images/bg/schu.png" alt="删除" title="删除"/></a></span>
						</td>
					</tr>
				</c:forEach>
				
			</table>
			<a href="${pageContext.request.contextPath}/productList1.html?currentPage=1">首页</a>
	                  <c:if test="${currentPage!=1&&allPage!=1}"><a href="${pageContext.request.contextPath}/productList1.html?currentPage=${currentPage-1}">上一页</a></c:if>
	                  <c:forEach items="${yeMeiList}" var="ck"><a href="${pageContext.request.contextPath}/productList1.html?currentPage=${ck}">
	                  <c:choose>
	                  <c:when test="${ck==currentPage}"><span style="color:red">${ck}</span></c:when><c:otherwise>${ck}</c:otherwise></c:choose></a>&nbsp;</c:forEach> 
	                  <c:if test="${currentPage!=allPage&&allPage!=1}">
	                  	<a href="${pageContext.request.contextPath}/productList1.html?currentPage=${currentPage+1}">下一页</a>
	                  </c:if>  
	                 <a href="${pageContext.request.contextPath}/productList1.html?currentPage=${allPage}">尾页</a>
        </div>
    </section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bg/product/productlist.js"></script>
