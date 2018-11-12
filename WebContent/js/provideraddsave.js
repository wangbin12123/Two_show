
var addBtn = null;
var backBtn = null;
var a_img=null;
var errorinfo=null;
var cid=null;

addBtn = $("#add");
backBtn = $("#back");
a_img=$("#a_img");
errorinfo=$("#errorinfo");
 cid=$("#cid");
$(function(){
	console.log(1)
	$.get(path + "/aaa", function (data) {
		//js转换为Json
		data = $.parseJSON(data);
		for (var i = 0; i < data.length; i++) {
			var option = "<option value='"+ data[i].id +"'>" + data[i].name + "</option>";
			$("#cid").append(option);
		}
	});

	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
	
	
	if(errorinfo==null || errorinfo==""){
		a_img.next().html("* 上传大小不超过500k * 上传文件类型必须是jpg、png、gif");
	}else{
		a_img.next().html(errorinfo.val());
	}
	
	
	addBtn.bind("click",function(){
		if(confirm("是否确认提交数据")){
			$("#productaddForm").submit();
		}
	});
	
	
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