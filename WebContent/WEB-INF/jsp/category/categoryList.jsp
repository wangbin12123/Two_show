<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>商品类别管理页面</span>
            </div>
            <div class="search">
           		<form method="post" action="${pageContext.request.contextPath }/aaa">
					<input name="method" value="query" class="input-text" type="hidden">
					<!--  <span>商品类别名称：</span> -->
					  <!--<input name="name" class="input-text"	type="text" value="${name}">-->
					 <input type="hidden" name="pageIndex" value="1"/>
					<!--  <input	value="查 询" type="submit" id="searchbutton"> -->
					 <a href="${pageContext.request.contextPath}/categoryAdd.html" >添加商品类别</a>
				</form>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="20%">商品类别名称</th>
                </tr>
                   <c:forEach var="c" items="${clist}" varStatus="status">
					<tr>
						<td>
						<span>${c.name}</span>
						</td>
						<td>
						<span><a class="modifyCategory" href="javascript:;" categoryid=${c.id } categoryName=${c.name }><img src="${pageContext.request.contextPath }/images/bg/xiugai.png" alt="修改" title="修改"/></a></span>
						<span><a class="deleteCategory" href="javascript:;" categoryid=${c.id } categoryName=${c.name }><img src="${pageContext.request.contextPath }/images/bg/schu.png" alt="删除" title="删除"/></a></span>
						</td>
					</tr>
				</c:forEach>
				
			</table>
			<a href="${pageContext.request.contextPath}/productList.html?currentPage=1">首页</a>
	                  <c:if test="${currentPage!=1&&allPage!=1}"><a href="${pageContext.request.contextPath}/productList.html?currentPage=${currentPage-1}">上一页</a></c:if>
	                  <c:forEach items="${yeMeiList}" var="ck"><a href="${pageContext.request.contextPath}/productList.html?currentPage=${ck}">
	                  <c:choose>
	                  <c:when test="${ck==currentPage}"><span style="color:red">${ck}</span></c:when><c:otherwise>${ck}</c:otherwise></c:choose></a>&nbsp;</c:forEach> 
	                  <c:if test="${currentPage!=allPage&&allPage!=1}">
	                  	<a href="${pageContext.request.contextPath}/productList.html?currentPage=${currentPage+1}">下一页</a>
	                  </c:if>  
	                 <a href="${pageContext.request.contextPath}/productList.html?currentPage=${allPage}">尾页</a>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bg/category/categoryList.js"></script>
