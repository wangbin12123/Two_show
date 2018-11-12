<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>类别管理页面 >> 类别修改页面</span>
        </div>
        <div class="providerAdd">
            <form id="providerForm" name="providerForm" method="post" enctype="multipart/form-data" 
            action="${pageContext.request.contextPath }/categoryUpdate">
            	<input type="hidden" name="id" id="id" value="${c.id }"/>
    
                <!--div的class 为error是验证错误，ok是验证成功-->
                 <div>
	                <label for="name">类别名：</label>
	                <input type="text" name="name" id="name" value="${c.name}"> 
					<font color="red"></font>
           		 </div>
             	<div class="providerAddBtn">
                   <input type="submit" name="add" id="add" value="保存" >
					<input type="button" id="back" name="back" value="返回" >
             	</div>
            </form>
        </div>
</div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bg/category/categoryAdd.js"></script>
