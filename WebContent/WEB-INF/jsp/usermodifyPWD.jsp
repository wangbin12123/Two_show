<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container" style="padding-top: 200px;padding-bottom: 250px;padding-right: 80px">
        <form style="padding-left: 300px" role="form" class="form-horizontal" id="userForm" name="userForm" action="${pageContext.request.contextPath}/user/modifyPWDS.html">
			 <input type="hidden" name="id" value="${user.id}">
			 <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
  			  <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
           		 <div class="form-group form-group-lg">
                	<label class="col-sm-2 control-label" for="userPassword">旧密码:</label>
                <div class="col-sm-5">
                    <input type="text" name="userPassword" id="userPassword" class="form-control input-lg" value="" placeholder="旧密码">
                      <font color="#b22222"></font>
                </div>
              
            </div>

            <div class="form-group form-group-lg">
                <label class="col-sm-2 control-label" for="newPassword">新密码:</label>
                <div class="col-sm-5">
                    <input type="password" name="newPassword" id="newPassword" class="form-control" placeholder="新密码">
             		<font color="#b22222"></font>
                </div>
            </div>



            <div class="form-group form-group-lg">
                <label class="col-sm-2 control-label" for="rePassword">确认密码:</label>
                <div class="col-sm-5">
                    <input type="password" name="rePassword" id="rePassword" value="" placeholder="再输一次" class="form-control">
               		<font color="#b22222"></font>
                </div>
            </div>


            <div class="form-group">
                <div class="col-md-offset-2 col-sm-10">
                    <input type="button" name="back" id="save" value="保存" class="btn btn-success btn-lg">
                </div>
            </div>
			
        </form>
    </div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/usermodifyPassword.js"></script>
</html>