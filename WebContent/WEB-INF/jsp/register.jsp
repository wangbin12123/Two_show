<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <style>
        .container {
            /*background: cornsilk;*/
        }

        form{
            margin:80px auto 0;
            padding-bottom:50px;
        }
        form .input-row{
            padding-left: 80px;
            position: relative;
            line-height: 40px;

        }
        form .input-row label{
            display:inline-block;
            width: 68px;
            text-align: right;
            margin-left:300px;

        }
        form .input-row input{
            height: 35px;
            border-radius: 4px;
            width:300px;
            overflow: hidden;
            border: 1px solid #ddd;
            text-indent: 10px;
        }
        #hhh{
            width:370px;
            background-color: #c61012;
            color: #fff;
            height: 40px;
            line-height: 40px;
            border-radius: 5px;
            margin: 20px 0 0 380px;
            font-size: 18px;
            text-align:center;
            display: block;
            text-decoration: none;
        }
        #hhh:active{
            background-color: #0c8dbc;
        }
        .mmqd{
            width: 290px;
            height: 30px;
            background-color:rgba(255, 120, 14, 0.58);
            line-height: 30px;
            margin-bottom: 10px;
            font-size: 16px;
        }
        .active{
            background-color: #ff780e;
        }
        .mmqd em{
            display: inline-block;
            width: 33.333%;
            text-align: center;
            color: #fff;

        }

    </style>
</head>
<body>
<div id="top-part"></div>
<div class="container">
    <form action="${pageContext.request.contextPath}/registersave.html"  method="post" id="form" role="form">
        <div class="input-row">
            <label>
            	    用户名
            </label>
            <input type="text" name="username" id="username" class="require">
            <span style="color: red;font-size: 20px"> *</span>
            <span id="usernameRequierdSpan" class="requierdSpan" style="color: red;font-size: 20px"></span>
        </div>
        <div class="input-row">
            <label>
            	    登录密码
            </label>
            <input type="password" name="password" id="password" class="require">
            <span style="color: red;font-size: 20px"> *</span>
            <span id="passwordRequierdSpan" class="requierdSpan" style="color: red;font-size: 20px"></span>
        </div>
        <div class="mmqd" style="margin-left: 455px">
            <em class="active">弱</em><em>中</em><em>强</em>
        </div>
        <div class="input-row">
            <label>
           		     密码确认
            </label>
            <input type="password" id="passwordAgain" class="require">
            <span style="color: red;font-size: 20px"> *</span>
            <span id="passwordAgainRequierdSpan" class="requierdSpan" style="color: red;font-size: 20px"></span>
        </div>
        <div class="input-row">
     		<label>
              	  角色名
            </label>
            <input type="text" name="role_name" id="role_name" class="require">
            <span style="color: red;font-size: 20px"> *</span>
            <span id="roleRequierdSpan" class="requierdSpan" style="color: red;font-size: 20px"></span>
        </div>

        <div class="input-row">
            <label>
              	  联系方式
            </label>
            <input type="text" name="tel" id="tel" class="require">
            <span style="color: red;font-size: 20px"> *</span>
            <span id="telRequierdSpan" class="requierdSpan" style="color: red;font-size: 20px"></span>
        </div>
        <div class="input-row">
            <label>
                E-mail
            </label>
            <input type="text" name="email" id="email" class="require">
            <span style="color: red;font-size: 20px"> *</span>
            <span id="emailRequierdSpan" class="requierdSpan" style="color: red;font-size: 20px"></span>
        </div>
        <div class="input-row">
            <label>
              	  生日
            </label>
            <input type="text" name="birthday" id="birthday" class="require">
            <span style="color: red;font-size: 20px"> *</span>
            <span id="birthdayRequierdSpan" class="requierdSpan" style="color: red;font-size: 20px"></span>
        </div>
        <div class="input-row">
            <label>
            	    账号状态
            </label>
            <input type="text" name="state" id="state" class="require">
            <span style="color: red;font-size: 20px"> *</span>
            <span id="stateRequierdSpan" class="requierdSpan" style="color: red;font-size: 20px"></span>
        </div>
        <div class="input-row">
        	<label>
        		性别
        	</label>
        	<div class="radio">
		           <label>
		               <input type="radio" id="sex" name="sex" value="1" checked>男
		           </label>
		            <label>
		               <input type="radio" id="sex" name="sex" value="2">女
		           </label>
       		</div>
        </div>
        
        
        
        <!--  <div>
                    <label >用户性别：</label>
					<select name="gender" id="gender">
					    <option value="1" selected="selected">男</option>
					    <option value="2">女</option>
					 </select>
                </div> -->
        
        
        
        <button id="hhh" type="button">立即注册</button>
    </form>
</div>


</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function(){
        $("#username").blur(function() {
            var username = this.value;
            username = $.trim(username);
            if (username == "") {
                $("#usernameRequierdSpan").text("用户名不能为空");
            } else {
                if(username.length<2 || username.length>10){
                    $("#usernameRequierdSpan").text("用户名要在2到10位之间");
                }else{
                    
                }
            }
        });
        var aEm=document.getElementsByTagName('em');
        var pwd=document.getElementById("password");
        pwd.onkeyup=function(){
            if(this.value.length>6){
                aEm[1].className="active";
            }else {
                aEm[1].className="";
            }
            if(this.value.length>15){
                aEm[2].className="active";
            }else {
                aEm[2].className="";
            }
        }
        $("#password").blur(function() {
            var password=this.value;
            password=$.trim(password);
            if(password==""){
                $("#passwordRequierdSpan").text("密码不能为空");
            }else{
                if(password.length<6 || password.length>26){
                    $("#passwordRequierdSpan").text("密码要在6到26位之间");
                }else{
                    var regExp = /^[A-Za-z0-9]+$/;
                    var ok = regExp.test(password);
                    if(!ok){
                        $("#passwordRequierdSpan").text("密码不能含有特殊字符");
                    }else{
                        $("#passwordRequierdSpan").text("");
                    }
                }
            }
        });


        $("#passwordAgain").blur(function(){
            var passwordAgain=this.value;
            var password=$("#password").val();
            if(passwordAgain==password){
                $("#passwordAgainRequierdSpan").text("");
            }else{
                $("#passwordAgainRequierdSpan").text("确认密码与密码不符");
            }
        });




        $("#role_name").blur(function() {
            var role_name = this.value;
            role_name = $.trim(role_name);
            if (role_name == "") {
                $("#roleRequierdSpan").text("角色名不能为空");
            } else {
                if(role_name.length<2 || role_name.length>10){
                    $("#roleRequierdSpan").text("角色名要在2到10位之间");
                }else {
                    $("#roleRequierdSpan").text("");
                }
            }
        });



        $("#tel").blur(function() {
            var tel=this.value;
            tel=$.trim(tel);
            if(tel==""){
                $("#telRequierdSpan").text("电话号码不能为空");
            }else{
                var regExp = /^(13[0-9]|15[0|1|3|6|7|8|9]|18[8|9])\d{8}$/;
                var ok = regExp.test(tel);
                if(!ok){
                    $("#telRequierdSpan").text("电话号码格式不正确");
                }else{
                    $("#telRequierdSpan").text("");
                }
            }
        });
        $("#email").blur(function() {
            var email=this.value;
            email=$.trim(email);
            if(email==""){
                $("#emailRequierdSpan").text("邮箱不能为空");
            }else{
                var regExp = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
                var ok = regExp.test(email);
                if(!ok){
                    $("#emailRequierdSpan").text("邮格式不正确");
                }else{
                    $("#emailRequierdSpan").text("");
                }
            }
        });
        $("#hhh").click(function(){
        	console.log(1)
            $(".require").blur();
            var flag=true;
            $.each($(".requierdSpan"),function(i,n){
                if(this.innerHTML!=""){
                    flag=false;
                    return false;
                }
            });
            if(!flag){
                $("#message").text("数据非法请检查!");
            }else{
            	console.log($("#form"))
                $("#form").submit();
            }
        });
    });
</script>
</html>