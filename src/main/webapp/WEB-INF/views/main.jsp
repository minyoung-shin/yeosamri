<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<div>
	<img src="img/welcome.png" class="img-responsive center-block main-img">
</div>

<script>
$(document).ready(function() {
	$(".main-img").css("margin-top", ($(window).height()-$(".main-img").height())/3);
});
</script>
