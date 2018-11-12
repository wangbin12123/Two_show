var userPassword = null;
var newPassword = null;
var rePassword = null;
var saveBtn = null;
var backBtn = null;
$(function(){
	userPassword = $("#userPassword");
	console.log(userPassword)
	newPassword = $("#newPassword");
	rePassword = $("#rePassword");
	saveBtn = $("#save");
	backBtn = $("#back");
	userPassword.next().html("*");
	newPassword.next().html("*");
	rePassword.next().html("*");

	
	
	userPassword.bind("blur",function() {
		
		$.ajax({
			type:"GET",//请求类型
			url:path+"/user/pdexist",//请求的url
			data:{userPassword:userPassword.val()},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
				let delResultObj = JSON.parse(data);
				
				if(delResultObj.userPassword == "yesexist"){//账号已存在，错误提示
					validateTip(userPassword.next(),{"color":"green"},imgYes+ " 旧密码输入正确",true);
				}
				else{//账号可用，正确提示
					validateTip(userPassword.next(),{"color":"red"},imgNo+" 旧密码输入错误",false);
				}
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				validateTip(userPassword.next(),{"color":"red"}+" 您访问的页面不存在",false);
			}
		});
		
		
	}).bind("focus",function(){
		//显示友情提示
		validateTip(userPassword.next(),{"color":"#666666"},"* 旧密码是您登录系统的账号的密码",false);
	}).focus();
	
	
	
	
	newPassword.bind("focus",function(){
		validateTip(newPassword.next(),{"color":"#666666"},"* 密码长度必须是大于6小于20",false);
	}).bind("blur",function(){
		
		if(newPassword.val()==userPassword.val()){
			validateTip(newPassword.next(),{"color":"red"},imgNo + "新密码不能和旧密码一致",false);
		}
		else if(newPassword.val() != null && newPassword.val().length > 6
				&& newPassword.val().length < 20 ){
			validateTip(newPassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(newPassword.next(),{"color":"red"},imgNo + " 密码输入不符合规范，请重新输入",false);
		}
	});
	
	rePassword.bind("focus",function(){
		validateTip(rePassword.next(),{"color":"#666666"},"* 请输入与上面一致的密码",false);
	}).bind("blur",function(){
		if(rePassword.val() != null && rePassword.val().length > 6
				&& rePassword.val().length < 20 && newPassword.val() == rePassword.val()){
			validateTip(rePassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(rePassword.next(),{"color":"red"},imgNo + " 两次密码输入不一致，请重新输入",false);
		}
	});
	
	
	
	
	saveBtn.on("click",function(){
		if(userPassword.attr("validateStatus") != "true"){
			userPassword.blur();
		}else if(newPassword.attr("validateStatus") != "true"){
			newPassword.blur();
		}else if(rePassword.attr("validateStatus") != "true"){
			rePassword.blur();
		}else{
			if(confirm("是否确认提交数据")){
				$("#userForm").submit();
			}
		}
	});
	backBtn.on("click",function(){
		//alert("modify: "+referer);
		if(referer != undefined 
			&& null != referer 
			&& "" != referer
			&& "null" != referer
			&& referer.length > 4){
		 window.location.href = referer;
		}else{
			history.back(-1);
		}
	});
});