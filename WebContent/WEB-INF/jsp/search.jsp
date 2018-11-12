<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
    .search-group {
        width: 35%;
        margin: 0 auto;
        padding: 30px 0 50px 0;
        background: #fff;
    }
    .form-control{
        height: 47px;
    }
    .btn-search{
        padding: 9px 26px;
        background: #e4393c;
        color: #fff;
        font-size: 19px;
    }
    .btn-search:hover {
        color: #fff;
        background-color: #f66060;
    }
</style>
</head>
<body>
<div class="search-group">
		<form action="${pageContext.request.contextPath}/productList.html">
    	<div class="input-group">
	        <input type="text" class="form-control" name="name" id="name" placeholder="Search for...">
	        <span class="input-group-btn">
	        <button class="btn btn-search" type="submit">搜索</button>
	        </span>
    	</div>
        </form>
</div>
</body>
</html>