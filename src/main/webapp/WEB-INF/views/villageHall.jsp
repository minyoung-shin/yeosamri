<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="row">
		<div class="col-xs-12 text-right">
			<a class="btn" data-toggle="modal" data-target=".bs-example-modal-lg">등록</a>
			
			<div class="hidden" id="insertWrap">
				<div class="well">
				  ...
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-xs-12">
			<section id="cd-timeline" class="cd-container">
			<c:forEach var="vo" items="${historyList}" >
				<div class="cd-timeline-block cursor" data-history-no="${vo.historyNo}">
					<div class="cd-timeline-img cd-picture">
						<c:if test="${vo.group2 == '대화'}">
						<img src="img/fun.png">
						</c:if>
						<c:if test="${vo.group2 == '일정'}">
						<img src="img/issue.png">
						</c:if>
					</div>
					<div class="cd-timeline-content">
						<button type="button" class="close" aria-label="Close" data-history-no="${vo.historyNo}">
							<span aria-hidden="true">&times;</span>
						</button>
						<div class="cd-date"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>${vo.postDate}</div>
					<c:if test="${!empty vo.photoUrl}">	
						<img src="upload/${vo.photoUrl}">
					</c:if>
						<h4>${vo.title}</h4>
						<p>${vo.content}</p>
					</div>
				</div>
			</c:forEach>
			</section>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
	    	<form action="insertHistory" class="form-horizontal" enctype="multipart/form-data" method="POST">
			<input type="hidden" name="historyNo" id="historyNo">
		    <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">공지등록</h4>
		    </div>
		    <div class="modal-body">
				<div class="form-group">
					<label class="col-sm-2 control-label">공지날짜</label>
				  	<div class="col-sm-10">
				 		<input type="date" class="form-control" name="postDate" id="postDate">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">사람구분</label>
				  	<div class="col-sm-10">
				 		<select class="form-control" name="group1" id="group1">
							<option>민영</option>
							<option>용숙</option>
							<option>하영</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">내용구분</label>
				  	<div class="col-sm-10">
				 		<select class="form-control" name="group2" id="group2">
							<option>일정</option>
							<option>대화</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
				  	<div class="col-sm-10">
				 		<input type="text" class="form-control" name="title" id="title">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
				  	<div class="col-sm-10">
				  		<textarea class="form-control" rows="10" cols="10" name="content" id="content"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">사진첨부</label>
			 		<input type="file" class="col-sm-10" style="border-color: transparent;" name="photo" id="photo">
				</div>
		    </div>
		    <div class="modal-footer">
	     		<button type="submit" class="btn btn-primary" id="registerBtn">등록</button>
	     		<button type="submit" class="btn btn-primary hidden" id="updateBtn">수정</button>
		    </div>
			</form>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	var timelineBlocks  = $('.cd-timeline-block');
	var offset 			= 0.8;

	//hide timeline blocks which are outside the viewport
	hideBlocks(timelineBlocks, offset);

	//on scolling, show/animate timeline blocks when enter the viewport
	$(window).on('scroll', function(){
		(!window.requestAnimationFrame) 
			? setTimeout(function(){ showBlocks(timelineBlocks, offset); }, 100)
			: window.requestAnimationFrame(function(){ showBlocks(timelineBlocks, offset); });
	});

	function hideBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top > $(window).scrollTop()+$(window).height()*offset ) && $(this).find('.cd-timeline-img, .cd-timeline-content').addClass('is-hidden');
		});
	}

	function showBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top <= $(window).scrollTop()+$(window).height()*offset && $(this).find('.cd-timeline-img').hasClass('is-hidden') ) && $(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden').addClass('bounce-in');
		});
	}
	
	// history 상세보기
	$(".cd-timeline-block").click(function() {
		if(confirm("수정하시겠습니까?")) {
			$.ajax({
				url : './selectHistoryDetail',
				type : 'GET',
				dataType : 'json',
				data : { "historyNo" : $(this).attr("data-history-no") },
				success : function(data) {
					$("#historyNo").val(data.vo.historyNo);
					$("#postDate").val(data.vo.postDate);
					$("#group1").val(data.vo.group1);
					$("#group2").val(data.vo.group2);
					$("#title").val(data.vo.title);
					$("#content").val(data.vo.content);
					$("#photo").val(data.vo.photo);
					$("#registerBtn").hide();
					$("#updateBtn").removeClass("hidden").addClass("show pull-right");
					
					$('.modal').modal('show');
				}
			});	
		}
	});
	
	// history 수정
	$("#updateBtn").click(function() {
		params = $("form").serialize();
		
		$.ajax({
			url : './updateHistory',
			type : 'GET',
			dataType : 'json',
			data : params,
			success : function(data) {
				alert("수정되었습니다.");
				window.location.reload(true);
			}
		});	
	});
	
	// history 삭제
	$(".cd-timeline-content .close").click(function() {
		if(confirm("삭제하시겠습니까?")) {
			
// 			alert($(this).attr("data-history-no"));
		}
	});
});
</script>
