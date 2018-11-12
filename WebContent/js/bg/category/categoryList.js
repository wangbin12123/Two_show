var userObj;
//用户管理页面上点击删除按钮弹出删除框(userlist.jsp)
function deleteProduct(obj){
	$.ajax({
		type:"GET",
		url:path+"/delete",
		data:{id:obj.attr("categoryid")},
		dataType:"json",
		success:function(data){
			let delObj =JSON.parse(data);
			if(delObj.delResult == "ture"){//删除成功：移除删除行
				cancleBtn();
				obj.parents("tr").remove();
			}else if(delObj.delResult == "false"){//删除失败
				//alert("对不起，删除用户【"+obj.attr("username")+"】失败");
				changeDLGContent("对不起，删除类别【"+obj.attr("name")+"】失败存在商品关联");
			}else{
				changeDLGContent("对不起，类别【"+obj.attr("name")+"】不能为空");
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
	/*$(".viewCategory").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/bg/cview/"+ obj.attr("categoryid");
	});*/
	
	$(".modifyCategory").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/bg/cview?id="+ obj.attr("categoryid");
	});

	$('#no').click(function () {
		cancleBtn();
	});
	
	$('#yes').click(function () {
		deleteProduct(userObj);
	});

	$(".deleteCategory").on("click",function(){
		userObj = $(this);
		changeDLGContent("你确定要删除商品类别【"+userObj.attr("categoryName")+"】吗？");
		openYesOrNoDLG();
	});
});