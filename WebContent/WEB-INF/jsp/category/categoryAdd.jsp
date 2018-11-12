<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>商品类别页面 >> 商品类别添加页面</span>
        </div>
        <div class="providerAdd">
            <form id="providerForm" name="providerForm" method="post" enctype="multipart/form-data" 
            action="${pageContext.request.contextPath }/categoryAddSave.html">
                <!--div的class 为error是验证错误，ok是验证成功-->
                 <div>
	                <label for="name">类别名称：</label>
	                <input type="text" name="name" id="name" value=""> 
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
