
$(function(){
	console.log($("#name12"))
	let name = $("#name12");
	birthday = $("#birthday");
	tel = $("#tel");
	email = $("#email")
	saveBtn = $("#save");
	console.log(name)
	name.next().html("*");
	birthday.next().html("*");
	tel.next().html("*");
	email.next().html("*");
	
	
	
	name.on("focus",function(){
		validateTip(name.next(),{"color":"#666666"},"* 真实名称长度必须是大于1小于10的字符",false);
	}).on("blur",function(){
		if(name.val() != null && name.val().length > 1 
				&& name.val().length < 10){
			validateTip(name.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(name.next(),{"color":"red"},imgNo+" 真实名称输入的不符合规范，请重新输入",false);
		}
		
	});
	
	birthday.on("focus",function(){
		validateTip(birthday.next(),{"color":"#666666"},"* 点击输入框，选择日期",false);
	}).on("blur",function(){
		if(birthday.val() != null && birthday.val() != ""){
			validateTip(birthday.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(birthday.next(),{"color":"red"},imgNo + " 选择的日期不正确,请重新输入",false);
		}
	});
	
	tel.on("focus",function(){
		validateTip(tel.next(),{"color":"#666666"},"* 请输入手机号",false);
	}).on("blur",function(){
		var patrn=/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
		if(tel.val().match(patrn)){
			validateTip(tel.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(tel.next(),{"color":"red"},imgNo + " 您输入的手机号格式不正确",false);
		}
	});
	
	
	email.on("focus",function(){
		validateTip(email.next(),{"color":"#666666"},"* 请输入email",false);
	}).on("blur",function(){
		var patrn =  /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
		if(email.val().match(patrn)){
			validateTip(email.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(email.next(),{"color":"red"},imgNo + " 你输入的邮箱格式不正确",false);
		}
	});
	
	saveBtn.on("click",function(){
		name.blur();
		tel.blur();
		birthday.blur();
		email.blur();
		if(name.attr("validateStatus") == "true" 
			&& tel.attr("validateStatus") == "true"
			&& birthday.attr("validateStatus") == "true"
			&& email.attr("validateStatus") == "true"	){
			if(confirm("是否确认要提交数据？")){
				$("#userForm").submit();
			}
		}
	});
	
});