var userObj;
//用户管理页面上点击删除按钮弹出删除框(userlist.jsp)
function deleteProduct(obj){
	$.ajax({
		type:"GET",
		url:path+"/productDelete",
		data:{id:obj.attr("productid")},
		dataType:"json",
		success:function(data){
			let delResultObj = JSON.parse(data); 
			if(delResultObj.delResult){//删除成功：移除删除行
				alert("wqfd");
				cancleBtn();
				obj.parents("tr").remove();
			}else if(delResultObj.delResult){//删除失败
				alert(data.delResult);
				//alert("对不起，删除用户【"+obj.attr("username")+"】失败");
				changeDLGContent("对不起，删除用户【"+obj.attr("productName")+"】失败");
			}
			else{
				alert("??");
			}
		},
		error:function(data){
			//alert("对不起，删除失败");
			changeDLGContent("对不起，删除失败");
		}
	});
}

function openYesOrNoDLG(){
	$('.zhezhao').css('display', 'block');
	$('#removeUse').fadeIn();
}

function cancleBtn(){
	$('.zhezhao').css('display', 'none');
	$('#removeUse').fadeOut();
}
function changeDLGContent(contentStr){
	var p = $(".removeMain").find("p");
	p.html(contentStr);
}

$(function(){
	//通过jquery的class选择器（数组）
	//对每个class为viewUser的元素进行动作绑定（click）
	/**
	 * bind、live、delegate
	 * on
	 */
	$(".viewProduct").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/bg/view.html?id="+ obj.attr("productid");
	});
	
	$(".modifyProduct").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/bg/modify.html?id="+ obj.attr("productid");
	});

	$('#no').click(function () {
		cancleBtn();
	});
	
	$('#yes').click(function () {
		deleteProduct(userObj);
	});

	$(".deleteProduct").on("click",function(){
		userObj = $(this);
		changeDLGContent("你确定要删除商品【"+userObj.attr("productName")+"】吗？");
		openYesOrNoDLG();
	});
	
	/*$(".deleteUser").on("click",function(){
		var obj = $(this);
		if(confirm("你确定要删除用户【"+obj.attr("username")+"】吗？")){
			$.ajax({
				type:"GET",
				url:path+"/jsp/user.do",
				data:{method:"deluser",uid:obj.attr("userid")},
				dataType:"json",
				success:function(data){
					if(data.delResult == "true"){//删除成功：移除删除行
						alert("删除成功");
						obj.parents("tr").remove();
					}else if(data.delResult == "false"){//删除失败
						alert("对不起，删除用户【"+obj.attr("username")+"】失败");
					}else if(data.delResult == "notexist"){
						alert("对不起，用户【"+obj.attr("username")+"】不存在");
					}
				},
				error:function(data){
					alert("对不起，删除失败");
				}
			});
		}
	});*/
});