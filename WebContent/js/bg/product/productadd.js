
var productName = null;
var price = null;
var pdesc = null;
var cid = null;
var addBtn = null;
var backBtn = null;
$(function(){
	//billCode = $("#billCode");
	productName = $("#name");
	price = $("#price");
	pdesc = $("#pdesc");
	cid = $("#cid");
	addBtn = $("#add");
	backBtn = $("#back");
	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
	//billCode.next().html("*");
	productName.next().html("*");
	price.next().html("*");
	pdesc.next().html("*");
	cid.next().html("*");
	
	$.ajax({
		type:"GET",//请求类型
		url:path+"/aaa2",//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			if(data != null){
				cid.html("");
				var options = "<option value=\"0\">请选择</option>";
				for(var i = 0; i < data.length; i++){
					options += "<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				}
				cid.append(options);
			
				
				
			}
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			validateTip(cid.next(),{"color":"red"},imgNo+" 获取类别名error",false);
		}
	});
	
	
	
	/*
	 * 验证
	 * 失焦\获焦
	 * jquery的方法传递
	 */
	/*billCode.bind("blur",function(){
		//ajax后台验证--userCode是否已存在
		//user.do?method=ucexist&userCode=**
		$.ajax({
			type:"GET",//请求类型
			url:path+"/billCode",//请求的url
			data:{method:"billCodeisExist",billCode:billCode.val()},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
				alert(data.billCode);
		//		var obj=eval("("+data+")");  转换
				if(data.billCode == "exist"){//账号已存在，错误提示
					validateTip(billCode.next(),{"color":"red"},imgNo+ " 该用户账号已存在",false);
				}else if(data.billCode=="null"){
					validateTip(billCode.next(),{"color":"red"},imgNo+ " 请输入订单编码",false);
				}else{//账号可用，正确提示
					validateTip(billCode.next(),{"color":"green"},imgYes+" 该账号可以使用",true);
				}
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				validateTip(billCode.next(),{"color":"red"},imgNo+" 您访问的页面不存在",false);
			}
		});
		
		
	}).bind("focus",function(){
		//显示友情提示
		validateTip(billCode.next(),{"color":"#666666"},"* 请输入订单编码",false);
	}).focus();*/
	
//	productName.bind("focus",function(){
//		validateTip(productName.next(),{"color":"#666666"},"* 商品名长度必须是大于1小于15的字符",false);
//	}).bind("blur",function(){
//		if(productName.val() != null && productName.val().length > 1
//				&& productName.val().length < 15){
//			validateTip(productName.next(),{"color":"green"},imgYes,true);
//		}else{
//			validateTip(productName.next(),{"color":"red"},imgNo+" 商品名输入的不符合规范，请重新输入",false);
//		}
//		
//	});
//	
//	productUnit.bind("focus",function(){
//		validateTip(productUnit.next(),{"color":"#666666"},"* 商品单位长度为1的字符",false);
//	}).bind("blur",function(){
//		if(productUnit.val() != null && productUnit.val().length ==1 ){
//			validateTip(productUnit.next(),{"color":"green"},imgYes,true);
//		}else{
//			validateTip(productUnit.next(),{"color":"red"},imgNo + " 商品单位输入不符合规范，请重新输入",false);
//		}
//	});
//	
//
//	productCount.bind("focus",function(){
//		validateTip(phone.next(),{"color":"#666666"},"* 请输入商品数量(1-3位数字)",false);
//	}).bind("blur",function(){
//		var patrn=/^[1-9]\d{0,2}\.0{2}$/;
//		if(productCount.val().match(patrn)){
//			validateTip(productCount.next(),{"color":"green"},imgYes,true);
//		}else{
//			validateTip(productCount.next(),{"color":"red"},imgNo + " 您输入的商品数量格式不正确",false);
//		}
//	});
//	
//	totalPrice.bind("focus",function(){
//		validateTip(totalPrice.next(),{"color":"#666666"},"* 请输入商品总金额(1-8位数字)",false);
//	}).bind("blur",function(){
//		var patrn=/^[1-9]\d{0,7}\.0{2}$/;
//		if(totalPrice.val().match(patrn)){
//			validateTip(totalPrice.next(),{"color":"green"},imgYes,true);
//		}else{
//			validateTip(totalPrice.next(),{"color":"red"},imgNo + " 您输入的商品总金额格式不正确",false);
//		}
//	});
//	
//	
//	
//	providerId.bind("focus",function(){
//		validateTip(providerId.next(),{"color":"#666666"},"* 请选择供应商",false);
//	}).bind("blur",function(){
//		if(providerId.val() != null && providerId.val() > 0){
//			validateTip(providerId.next(),{"color":"green"},imgYes,true);
//		}else{
//			validateTip(providerId.next(),{"color":"red"},imgNo + " 请重新选择供应商",false);
//		}
//	});
//	
//	addBtn.bind("click",function(){
//		 if(productName.attr("validateStatus") != "true"){
//			productName.blur();
//		}else if(productUnit.attr("validateStatus") != "true"){
//			productUnit.blur();
//		}else if(productUnit.attr("validateStatus") != "true"){
//			productCount.blur();
//		}else if(totalPrice.attr("validateStatus") != "true"){
//			totalPrice.blur();
//		}else if(providerId.attr("validateStatus") != "true"){
//			providerId.blur();
//		}else{
//			if(confirm("是否确认提交数据")){
//				$("#billForm").submit();
//			}
//		}
//	});
//	
	backBtn.on("click",function(){
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