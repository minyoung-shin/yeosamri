<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container">
		<div class="col-lg-12">
			<a class="btn btn-default pull-right" role="button" data-toggle="modal" data-target="#myModal">등록</a>
			
			<section id="cd-timeline" class="cd-container">
				<div class="cd-timeline-block">
					<div class="cd-timeline-img cd-picture">
						<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/148866/cd-icon-picture.svg" alt="Picture">
					</div> <!-- cd-timeline-img -->
		
					<div class="cd-timeline-content">
						<h2>Title of section 1</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, optio, dolorum provident rerum aut hic quasi placeat iure tempora laudantium ipsa ad debitis unde? Iste voluptatibus minus veritatis qui ut.</p>
						<a href="#0" class="cd-read-more">Read more</a>
						<span class="cd-date">Jan 14</span>
					</div> <!-- cd-timeline-content -->
				</div> <!-- cd-timeline-block -->
		
				<div class="cd-timeline-block">
					<div class="cd-timeline-img cd-movie">
						<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/148866/cd-icon-movie.svg" alt="Movie">
					</div> <!-- cd-timeline-img -->
		
					<div class="cd-timeline-content">
						<h2>Title of section 2</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, optio, dolorum provident rerum aut hic quasi placeat iure tempora laudantium ipsa ad debitis unde?</p>
						<a href="#0" class="cd-read-more">Read more</a>
						<span class="cd-date">Jan 18</span>
					</div> <!-- cd-timeline-content -->
				</div> <!-- cd-timeline-block -->
		
				<div class="cd-timeline-block">
					<div class="cd-timeline-img cd-picture">
						<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/148866/cd-icon-picture.svg" alt="Picture">
					</div> <!-- cd-timeline-img -->
		
					<div class="cd-timeline-content">
						<h2>Title of section 3</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi, obcaecati, quisquam id molestias eaque asperiores voluptatibus cupiditate error assumenda delectus odit similique earum voluptatem doloremque dolorem ipsam quae rerum quis. Odit, itaque, deserunt corporis vero ipsum nisi eius odio natus ullam provident pariatur temporibus quia eos repellat consequuntur perferendis enim amet quae quasi repudiandae sed quod veniam dolore possimus rem voluptatum eveniet eligendi quis fugiat aliquam sunt similique aut adipisci.</p>
						<a href="#0" class="cd-read-more">Read more</a>
						<span class="cd-date">Jan 24</span>
					</div> <!-- cd-timeline-content -->
				</div> <!-- cd-timeline-block -->
		
				<div class="cd-timeline-block">
					<div class="cd-timeline-img cd-location">
						<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/148866/cd-icon-location.svg" alt="Location">
					</div> <!-- cd-timeline-img -->
		
					<div class="cd-timeline-content">
						<h2>Title of section 4</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, optio, dolorum provident rerum aut hic quasi placeat iure tempora laudantium ipsa ad debitis unde? Iste voluptatibus minus veritatis qui ut.</p>
						<a href="#0" class="cd-read-more">Read more</a>
						<span class="cd-date">Feb 14</span>
					</div> <!-- cd-timeline-content -->
				</div> <!-- cd-timeline-block -->
		
				<div class="cd-timeline-block">
					<div class="cd-timeline-img cd-location">
						<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/148866/cd-icon-location.svg" alt="Location">
					</div> <!-- cd-timeline-img -->
		
					<div class="cd-timeline-content">
						<h2>Title of section 5</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, optio, dolorum provident rerum.</p>
						<a href="#0" class="cd-read-more">Read more</a>
						<span class="cd-date">Feb 18</span>
					</div> <!-- cd-timeline-content -->
				</div> <!-- cd-timeline-block -->
		
				<div class="cd-timeline-block">
					<div class="cd-timeline-img cd-movie">
						<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/148866/cd-icon-movie.svg" alt="Movie">
					</div> <!-- cd-timeline-img -->
		
					<div class="cd-timeline-content">
						<h2>Final Section</h2>
						<p>This is the content of the last section</p>
						<span class="cd-date">Feb 26</span>
					</div> <!-- cd-timeline-content -->
				</div> <!-- cd-timeline-block -->
			</section> <!-- cd-timeline -->
		</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		    <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">공지등록</h4>
		    </div>
		    <div class="modal-body">
	    	<form class="form-horizontal" enctype="multipart/form-data" id="historyForm">
				<div class="form-group">
					<label class="col-sm-2 control-label">공지날짜</label>
				  	<div class="col-sm-10">
				 		<input type="date" class="form-control" name="postDate">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">사람구분</label>
				  	<div class="col-sm-10">
				 		<select class="form-control" name="group1">
							<option>민영</option>
							<option>용숙</option>
							<option>하영</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">내용구분</label>
				  	<div class="col-sm-10">
				 		<select class="form-control" name="group2">
							<option>일정</option>
							<option>대화</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
				  	<div class="col-sm-10">
				 		<input type="text" class="form-control" name="title">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
				  	<div class="col-sm-10">
				  		<textarea class="form-control" rows="10" cols="10" name="content"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">사진첨부</label>
			 		<input type="file" class="col-sm-10" style="border-color: transparent;">
				</div>
			</form>
		    </div>
		    <div class="modal-footer">
	     		<button type="button" class="btn btn-primary" id="registerBtn">등록</button>
		    </div>
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
	
	// 히스토리 등록
	$("#registerBtn").click(function() {
		params = $("#historyForm").serialize(); 
        
        $.ajax({
			url : '/insertHistory',
			type : 'GET',
			dataType : 'json',
			data : params,
			success : function(data) {
				if(data.requestMap.result == "1") {
					alert("등록완료!");
					$("#myModal").hide();
				}
			}
		});
	});
});
</script>
