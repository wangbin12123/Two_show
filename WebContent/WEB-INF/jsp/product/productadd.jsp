<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>商品管理页面 >> 商品添加页面</span>
        </div>
        <div class="providerAdd">
            <form id="providerForm" name="providerForm" method="post" enctype="multipart/form-data" 
            action="${pageContext.request.contextPath }/product/provideraddsave.html">
				<input type="hidden" name="method" value="add">
                <!--div的class 为error是验证错误，ok是验证成功-->
                 <div>
                <label for="name">商品名称：</label>
                <input type="text" name="name" id="name" value=""> 
				<font color="red"></font>
            </div>
            <div>
                <label for="price">价格：</label>
                <input type="text" name="price" id="price" value=""> 
				<font color="red"></font>
            </div>
            <div>
               <label for="pdesc">商品描述：</label>
               <input type="text" name="pdesc" id="pdesc" value=""> 
				<font color="red"></font>
            </div>
            <div>
                <label for="cid">商品类别 ：</label>
               	<select name="cid" id="cid"> 
               		<option value="0">--请选择--</option>
               	</select>
               	<font color="red"></font>
            </div>
          
            <div>
            	<input type="hidden" id="errorinfor" value="${uploadError}"/>
            	<label  for="a_img">商品图片：</label>
            	<input type="file" name="a_img" id="a_img" value="">
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bg/product/productadd.js"></script>
