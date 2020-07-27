<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>우리 팀할래 상세페이지</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/gijgo.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/slicknav.css">
<link rel="stylesheet" href="css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
<style>
</style>
</head>

<body>

	<jsp:include page="../common/header.jsp" />
	<!--================Blog Area =================-->
	<section class="blog_area single-post-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post">
						<div class="feature-img">
							<img class="img-fluid"
								src="${contextPath}/resources/wuploadFiles/${we.wFileName}"
								alt="">
						</div>
						<div class="blog_details">
							<h2>${we.wTitle}</h2>
							<ul class="blog-info-link mt-3 mb-4">
								<li><a href="#"><i class="fa fa-user"></i> ${we.wWriter }
								</a></li>
								<li><a href="#"><i class="fa fa-comments"></i> 댓글수</a></li>
							</ul>
							<p class="excert">${we.wContent }</p>
						</div>
					</div>
					<div class="navigation-top">
						<div class="d-sm-flex justify-content-between text-center">
							<p class="like-info">
								<span class="align-middle"><i class="fa fa-heart"></i></span> 4
								people like this
							</p>
							<div class="col-sm-4 text-center my-2 my-sm-0">
								<!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
							</div>
							<ul class="social-icons">
								<li><a href="#"><i class="fa fa-facebook-f"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-behance"></i></a></li>
							</ul>
						</div>
						<div class="navigation-area">
							<div class="row">
								<div
									class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
									<div class="thumb">
										<a href="#"> <img class="img-fluid"
											src="img/post/preview.png" alt="">
										</a>
									</div>
									<div class="arrow">
										<a href="#"> <span class="lnr text-white ti-arrow-left"></span>
										</a>
									</div>
									<div class="detials">
										<p>Prev Team</p>
										<a href="#">
											<h4>팀 이름</h4>
										</a>
									</div>
								</div>
								<div
									class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
									<div class="detials">
										<p>Next Team</p>
										<a href="#">
											<h4>팀 이름</h4>
										</a>
									</div>
									<div class="arrow">
										<a href="#"> <span class="lnr text-white ti-arrow-right"></span>
										</a>
									</div>
									<div class="thumb">
										<a href="#"> <img class="img-fluid"
											src="img/post/next.png" alt="">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="blog-author">
						<div class="media align-items-center">
							<img src="img/blog/author.png" alt="">
							<div class="media-body">
								<a href="#">
									<h4>${we.wWriter }</h4>
								</a>
								<p>이메일</p>
								<p>
									<button class="btn" type="button">메세지 보내기</button>
								</p>
							</div>
						</div>
					</div>
					<div class="comments-area">
						<h4>
							<h4 id="wecCount">댓글</h4>
							<!--                   <div class="comment-list">
                  	 <div class="single-comment justify-content-between d-flex">
	                        <div class="user justify-content-between d-flex">
	                           <div class="thumb">
	                              <img src="img/comment/comment_1.png" alt="">
	                           </div>
	                           <div class="desc">
	                              <p class="comment">
	                                 댓글내용 어쩌구저쩌구
	                              </p>
	                              <div class="d-flex justify-content-between">
	                                 <div class="d-flex align-items-center">
	                                    <h5>
	                                       <a href="#">작성자</a>
	                                    </h5>
	                                    <p class="date">날짜 </p>
	                                 </div>
	                                 <div>
	                                    &nbsp;&nbsp;<a href="#">수정</a>
	                                    &nbsp;|&nbsp;<a href="#">삭제</a>
	                                 </div>
	                              </div>
	                           </div>
	                        </div>
	                     </div> -->
							<div class=" d-flex justify-content-between" id="31">
								<table id="rtb" align="center" width="600" cellspacing="0">
									<thead>
										<tr>
											<td colspan="2"></td>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
					</div>
					<div class="comment-form">
						<h4>댓글쓰기</h4>
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<textarea class="form-control w-100" name="wecContent"
										id="wecContent" cols="30" rows="9" placeholder="댓글을 남겨주세요"></textarea>
								</div>
							</div>

						</div>
						<div class="form-group">
							<button id="wecSubmit" class="boxed-btn3">댓글 작성</button>
						</div>
					</div>
				</div>


				<!-- aside -->
				<div class="col-lg-4">
					<div class="blog_right_sidebar">

						<!-- 로그인한 사람이 작성자 본인이거나 관리자일 경우  -->
						<c:if test="${loginUser.userId eq we.wWriter || 'admin' }">
							<!-- 게시글 수정 -->
							<c:url var="weUpdateView" value="weUpdateView.mo">
								<c:param name="wId" value="${we.wId }" />
							</c:url>
							<aside class="single_sidebar_widget newsletter_widget">
								<h4 class="widget_title">
									<b>게시글 수정하기</b>
								</h4>
								<a href="${weUpdateView}"
									class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn">수정</a>
							</aside>


							<!-- 게시글 삭제 -->
							<c:url var="weDelete" value="weDelete.mo">
								<c:param name="wId" value="${we.wId }" />
							</c:url>
							<aside class="single_sidebar_widget newsletter_widget">
								<h4 class="widget_title">
									<b>게시글 삭제하기</b>
								</h4>
								<a href="${weDelete }"
									class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn">삭제</a>
							</aside>
						</c:if>

						<aside class="single_sidebar_widget search_widget">
							<form action="weSearch.mo" method="get" accept-charset="utf-8">
								<div class="form-group">
									<div class="input-group mb-3">
										<select class="wide" name="searchCondition">
											<option value="content"
												<c:if test="${search.searchCondition=='content'}">selected</c:if>>내용</option>
											<option value="title"
												<c:if test="${search.searchCondition=='title'}">selected</c:if>>제목</option>
											<option value="writer"
												<c:if test="${search.searchCondition=='writer'}">selected</c:if>>작성자</option>
										</select> <input type="search" class="form-control"
											placeholder='검색할 단어 입력' name="searchValue"
											onfocus="this.placeholder = ''"
											onblur="this.placeholder = '검색할 단어 입력'"
											value="${search.searchValue }">
										<div class="input-group-append">
											<button class="btn" type="button">
												<i class="ti-search"></i>
											</button>
										</div>
									</div>
								</div>
								<button
									class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
									type="submit">검색</button>
							</form>
						</aside>

						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">
								<b>카테고리</b>
							</h4>
							<ul class="list cat-list">
								<li><a href="weCategoryList.mo?category=1" class="d-flex">
										<p>스터디</p> &nbsp;
										<p style="font-size: 12px;">(${studyCount })</p>
								</a></li>
								<li><a href="weCategoryList.mo?category=2" class="d-flex">
										<p>공모전</p>&nbsp;
										<p style="font-size: 12px;">(${contestCount })</p>
								</a></li>
								<li><a href="weCategoryList.mo?category=3" class="d-flex">
										<p>스포츠</p>&nbsp;
										<p style="font-size: 12px;">(${sportCount })</p>
								</a></li>
								<li><a href="weCategoryList.mo?category=4" class="d-flex">
										<p>취미</p>&nbsp;
										<p style="font-size: 12px;">(${hobbyCount })</p>
								</a></li>
								<li><a href="weCategoryList.mo?category=5" class="d-flex">
										<p>기타</p>&nbsp;
										<p style="font-size: 12px;">(${etcCount })</p>
								</a></li>
							</ul>
						</aside>

						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">
								<b>기대되는 팀 리스트</b>
							</h3>
							<c:forEach var="list" items="${hList }">
								<div class="media post_item">
									<img src="/resources/wuploadFiles/${list.wFileName }"
										style="width: 80px;" alt="post">
									<div class="media-body">
										<a href="wedetail.mo?wId=${list.wId }">
											<h3>${list.wTeamName }</h3>
										</a>
										<p>By ${list.wWriter }</p>
									</div>
								</div>
							</c:forEach>
						</aside>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ Blog Area end =================-->

	<!-- JS here -->
	<script src="js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/ajax-form.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/imagesloaded.pkgd.min.js"></script>
	<script src="js/scrollIt.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/wow.min.js"></script>
	<!--    <script src="js/nice-select.min.js"></script> -->
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/gijgo.min.js"></script>

	<!--contact js-->
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>

	<script>
$(function() {
		// 초기 페이지 로딩 시 댓글 불러오기
		getWecList();
		// ajax polling
		// 타 회원이 댓글들을 작성했을 수 있으니 지속적으로 댓글 불러오기
/* 		setInterval(function() {
			getWecList();
		}, 1000) */;

		// 댓글 등록 ajax
		$("#wecSubmit").on("click", function() {

			var wecContent = $("#wecContent").val(); // 댓글의 내용
			var wId = ${we.wId}; // 어느 게시글의 댓글인지 알려줌
			$.ajax({
				url : "wecinsert.mo",
				data : {wcContent : wecContent, wId : wId},
				type : "post",
				success : function(data) {
					if (data == "success") {
						getWecList();
						// $("#wecContent").val("");
					}
				}
			});
		});
	});

	// 댓글 리스트 불러오는 ajax 함수
	function getWecList() {
		var wId = ${we.wId};
		$.ajax({
			url : "weclist.mo",
			data : {wId : wId},
			dataType : "json",
			success : function(data) { // 응답이 오는 데이터는 JSON형태
				console.log(data);
			
				/* var $p1 = $("#p1");
				var $a1 = $("#a1");
				var $p2 = $("#p2");
				$p1.html("");
				$a1.html("");
				$p2.html("");
				$("#update").html("");
				$("#delete").html(""); */
				$tableBody = $("#rtb tbody");
	            $tableBody.html("");
				
				var $wecContent;
				var $wecWriter;
				var $wecCreateDate;
				var $update;
				var $delete;
				var $wecId;
				var $wId = ${we.wId};
				
				$("#wecCount").text(" + " + data.length);
				if (data.length > 0) {
					for ( var i in data) {
						console.log(data.length);
						$tr = $("<tr>");
						$td1 = $("<td>");
						$td2 = $("<td width='80'>");
						$wecContent = $("<td>").text(
								decodeURIComponent(data[i].wcContent.replace(
										/\+/g, " ")));
						$wecWriter = $("<a width='70' style='color:gray;, cursor:hand'>").html(data[i].wcWriter);
						$wecWriter.attr("href", "#");
						$wecCreateDate = $("<td width='100'>").text(data[i].wcCreateDate);
						$wecId = data[i].wcId;
						
						$tr.append($wecContent);
						$td1.append($wecWriter);
						$tr.append($td1);
						
						$update = $("<a style='color:gray;, cursor:hand'>").html("[수정]  ");
						$update.attr("href", "wecupdate.mo?wecId="+$wecId);
						$delete = $("<a style='color:gray;, cursor:hand'>").html("[삭제]");
						$delete.attr({
							href : "wecdelete.mo?wecId="+$wecId+"&"+"wId="+$wId
						});
						
						$td2.append($update);
						$td2.append($delete);
						$tr.append($td1);
						$tr.append($wecCreateDate);
						$tr.append($td2);
						$tableBody.append($tr);

					}
				} else {
					$tr = $("<tr>");
	                  $wecContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
	                  
	                  $tr.append($wecContent);
	                  $tableBody.append($tr);
				}
			}
		});
	}
</script>


	<jsp:include page="../common/footer.jsp" />

</body>

</html>