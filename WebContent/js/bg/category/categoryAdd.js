var categoryName = null;
var addBtn = null;
var backBtn = null;
$(function(){
	categoryName = $("#name");
	addBtn = $("#add");
	backBtn = $("#back");
	categoryName.next().html("*");

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