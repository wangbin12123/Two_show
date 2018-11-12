<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理登录</title>

<link href="${pageContext.request.contextPath }/css/login.css" rel="stylesheet" type="text/css" />

</head>
<body>


<div class="login">
	<form action="http://localhost:8080/Two_show/bg/islogin" method="post">
    <div class="box png">
		<div class="logo png"></div>
		<div class="input">
			<div class="log">
				<span style="color:red">${errors}</span>
				<div class="name">
					<label>用户名</label>
					<input type="text" class="text" id="username" placeholder="用户名" name="username" tabindex="1">
				</div>
				<div class="pwd">
					<label>密码</label><input type="password" class="text" id="password" placeholder="密码" name="password" tabindex="2">
					<input type="submit" class="submit" tabindex="3" value="登录">
					<div class="check"></div>
				</div>
				<div class="tip"></div>
			</div>
		</div>
	</div>
	</form>
    <div class="air-balloon ab-1 png" style="top: 130.999px; left: 1194.79px;"></div>
	<div class="air-balloon ab-2 png" style="top: 139.825px; left: 1095.69px;"></div>
    <div class="footer"></div>
</div>
	</form>
    <div class="air-balloon ab-1 png"></div>
	<div class="air-balloon ab-2 png"></div>
    <div class="footer"></div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jQuery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/fun.base.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/script.js"></script>


<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
</div>
</body>
</html>