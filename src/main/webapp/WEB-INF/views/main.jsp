<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YEOSAMRI</title>
<link rel="stylesheet" type="text/css" href="css/semantic.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/semantic.min.js"></script>
</head>
<body>
	<div class="ui fixed inverted menu">
		<div class="ui container">
			<a href="#" class="header item"> 
				<img class="logo" src="img/logo.png">여삼리
			</a> 
			<a href="#" class="item">마을회관</a>
			<a href="#" class="item">이장님네</a>
			<a href="#" class="item">여삼초교</a>
			<a href="#" class="item">민다방</a>
		</div>
	</div>
	
	<div class="ui container main" style="width: 100%">
		<div class="main-font">여삼리에<br>오신걸 환영합니다.</div>
		<img src="img/main.jpg" width="100%" height="100%"/>
	</div>
</body>
<script>
$(document).ready(function() {
	$(".main").css("height", $(window).height());
});
</script>
</html>