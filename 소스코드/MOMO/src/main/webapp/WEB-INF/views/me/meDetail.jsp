<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>나랑 팀할래 상세 페이지</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
<style>
.job_btn {
	text-align: center;
}

.form-group {
	text-align: right;
}

table {
	font-size: 11pt;
	color: gray;
	text-align: left;
}

tr {
	line-height: 250%;
}

a {
	text-align: center;
	color: gray;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="job_details_area">

		<div class="container">
			<div class="col-lg-12">
				<h3 id="title">
					<strong>나랑 일할래</strong> | 상세보기
				</h3>
			</div>
			<div class="row">
				<div class="col-lg-8">
					<!-- <div class="job_details_header"> -->
					<br>
					<div class="single_jobs white-bg d-flex justify-content-between">
						<div class="jobs_left d-flex align-items-center">
							<div class="thumb">

								<c:if test="${me.mCategory eq '스터디'}">

									<img src="img/candiateds/스터디.png" alt="" style="width: 49px"
										alt="">
								</c:if>
								<c:if test="${me.mCategory eq '공모전'}">

									<img src="img/candiateds/공모전.png" style="width: 49px" alt="">
								</c:if>
								<c:if test="${me.mCategory eq '취미'}">

									<img src="img/candiateds/취미.png" style="width: 49px" alt="">
								</c:if>
								<c:if test="${me.mCategory eq '여가'}">

									<img src="img/candiateds/여가.png" style="width: 49px" alt="">
								</c:if>
								<c:if test="${me.mCategory eq '기타'}">

									<img src="img/candiateds/기타.png" style="width: 49px" alt="">
								</c:if>
							</div>

							<div class="jobs_conetent">
								<ul class="blog-info-link">
									<p style="font-size: 20px; color: black;">${me.mTitle }</p>
									<a href="#">
										<h5 style="text-align: left">${me.mWriter }</h5>
									</a>
									<li><a><i class="fa fa-eye"></i>조회수 ${me.meCount } </a></li>
									<li><a><i class="glyphicon glyphicon-envelope"></i>메일주소
									</a></li>
									<li><a href="cDetail.mo?userId=${me.mWriter }"><i
											class="fa fa-id-card" aria-hidden="true"></i>이력사항 </a></li>
								</ul>

							</div>
						</div>
						<div class="jobs_right">
							<br>
							<div class="apply_now">
								<a class="heart_mark" href="#"> <i class="ti-heart"></i>
								</a>
							</div>
						</div>
					</div>
					<!-- </div> -->
					<br>
					<div class="descript_wrap white-bg">
						<div class="single_wrap">

							<p>${me.mContent }</p>
						</div>

						<!-- catagory_area-->
						<div class="catagory_area">
							<div class="col-lg-8 col-md-8">
								<div class="single_input">
									<select class="wide">
										<option data-display="Q & A">질문1</option>
										<option value="1">질문2</option>
										<option value="2">질문3</option>
									</select>
								</div>
							</div>
							<div class="col-lg-4 col-md-4">
								<input type="submit" class="genric-btn success w-100"
									value="Q & A" style="font-size: 15px;">
							</div>
						</div>
						<!--/ catagory_area -->
						<!-- 작성자와 관리자만 수정/삭제 가능 -->
						<br>
						<div class="job_btn">
							<c:url var="meupdate" value="meupView.mo">
								<c:param name="mId" value="${me.mId }"></c:param>
							</c:url>
							<a href="${meupdate }" class="boxed-btn3">수정</a>
							<c:url var="medelete" value="medelete.mo">
								<c:param name="mId" value="${me.mId }"></c:param>
							</c:url>
							<a href="${medelete }" class="boxed-btn3"
								style="background-color: darkgray">삭제</a>
						</div>
					</div>
					<!--댓글영역-->
					<div class="comments-area">
						<h3>댓글 |</h3>
						<h4 id="mecCount" style="color: gray;"></h4>
						<div class="comment-list d-flex" id="11">
							<div class="single-comment justify-content-between d-flex" id="2">
								<!-- <div class="thumb" id="mec4">
												<img src="" alt="img"> 
								</div> -->
								<!-- <div class=" d-flex justify-content-between col-md-7" id="31">
									<div class="d-flex align-items-center" id="41">
										<p class="comment" id="p1"/>
									</div>
								</div>
								<div class="d-flex justify-content-between col-md-5" id="32">
									<div class="d-flex align-items-center" id="42">
										<a href="#" id="a1"></a>
										<p class="date" id="p2"/>
									</div>
									<a href="#" class="update" id="update"></a>
									<a class="delete" id="delete"></a>
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
						</div>

						<!-- 로그인 시에만 보이도록 할 것 -->
						<div class="col-lg-12 comment-form white-bg d-flex" id="a">
							<div class="col-lg-12 col-md-12" id="b">
								<div class="row" id="c1">
									<div class="col-md-12 col-lg-12" id="d1">
										<div class="form-group" id="e">
											<textarea class="form-control w-100" name="mecContent"
												id="mecContent" cols="30" rows="2" placeholder="댓글을 입력하세요."></textarea>
										</div>
									</div>

								</div>
								<div class="form-group" id="c2">
									<div class="col-lg-9 col-md-9" id="d2"></div>
									<div class="col-lg-3 col-md-3" id="d3">
										<button id="mecSubmit" class="genric-btn success w-100"
											style="font-size: 15px;">등록</button>

										&nbsp;
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--사이드 -->
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<form action="#">
								<div class="form-group">
									<div class="input-group mb-3">
										<input type="text" class="form-control"
											placeholder='검색어를 입력해주세요.' onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'Search Keyword'">
										<div class="input-group-append">
											<button class="btn" type="button">
												<i class="ti-search"></i>
											</button>
										</div>
									</div>
								</div>
								<button
									class="button rounded-0 genric-btn success  w-100 boxed-btn3"
									style="font-size: 15px" type="submit">검색</button>

							</form>
						</aside>

						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">카테고리</h4>
							<ul class="list cat-list">
								<li><a href="#" class="d-flex">
										<p>스터디</p>
										<p>(글 갯수)</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>공모전</p>
										<p>(글 갯수)</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>스포츠</p>
										<p>(글 갯수)</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>취미</p>
										<p>(글 갯수)</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>기타</p>
										<p>(글 갯수)</p>
								</a></li>

							</ul>
						</aside>

						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">새로운 메이트</h3>
							<c:forEach var="me" items="${meList }">
								<div class="media post_item">
									<c:if test="${me.mCategory eq '스터디'}">

										<img src="img/candiateds/스터디.png" width="50" height="50"
											alt="">
									</c:if>
									<c:if test="${me.mCategory eq '공모전'}">

										<img src="img/candiateds/공모전.png" width="50" height="50"
											alt="">
									</c:if>
									<c:if test="${me.mCategory eq '취미'}">

										<img src="img/candiateds/취미.png" width="50" height="50" alt="">
									</c:if>
									<c:if test="${me.mCategory eq '여가'}">

										<img src="img/candiateds/여가.png" width="50" height="50" alt="">
									</c:if>
									<c:if test="${me.mCategory eq '기타'}">

										<img src="img/candiateds/기타.png" width="50" height="50" alt="">
									</c:if>
									<div class="media-body">
										<a href="medetail.mo?mId=${me.mId }"> <font size="5em;">${me.mWriter}</font>
										</a>
										<p>${me.mCreateDate }</p>
									</div>
								</div>
							</c:forEach>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>


</body>
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
<script src="js/nice-select.min.js"></script>
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
		getMecList();
		// ajax polling
		// 타 회원이 댓글들을 작성했을 수 있으니 지속적으로 댓글 불러오기
		setInterval(function() {
			getMecList();
		}, 1000);

		// 댓글 등록 ajax
		$("#mecSubmit").on("click", function() {

			var mecContent = $("#mecContent").val(); // 댓글의 내용
			var mId = $
			{
				me.mId
			}
			; // 어느 게시글의 댓글인지 알려줌

			$.ajax({
				url : "mecinsert.mo",
				data : {
					mecContent : mecContent,
					mId : mId
				},
				type : "post",
				success : function(data) {
					if (data == "success") {
						getMecList();
						$("#mecContent").val("");
					}
				}
			});
		});
	});

	// 댓글 리스트 불러오는 ajax 함수
	function getMecList() {
		var mId = $
		{
			me.mId
		}
		;
		$
				.ajax({
					url : "meclist.mo",

					data : {
						mId : mId
					},
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

						var $mecContent;
						var $mecWriter;
						var $mecCreateDate;
						var $update;
						var $delete;
						var $mecId;
						var $mId = $
						{
							me.mId
						}
						;

						$("#mecCount").text(" + " + data.length);
						if (data.length > 0) {
							for ( var i in data) {
								console.log(data.length);
								$tr = $("<tr>");
								$td1 = $("<td>");
								$td2 = $("<td width='80'>");
								$mecContent = $("<td>").text(
										decodeURIComponent(data[i].mecContent
												.replace(/\+/g, " ")));
								$mecWriter = $(
										"<a width='70' style='color:gray;, cursor:hand'>")
										.html(data[i].mecWriter);
								$mecWriter.attr("href", "#");
								$mecCreateDate = $("<td width='100'>").text(
										data[i].mecCreateDate);
								$mecId = data[i].mecId;

								$tr.append($mecContent);
								$td1.append($mecWriter);
								$tr.append($td1);

								$update = $(
										"<a style='color:gray;, cursor:hand'>")
										.html("[수정]  ");
								$update.attr("href", "mecupdate.mo?mecId="
										+ $mecId);
								$delete = $(
										"<a style='color:gray;, cursor:hand'>")
										.html("[삭제]");
								$delete.attr({
									href : "mecdelete.mo?mecId=" + $mecId + "&"
											+ "mId=" + $mId
								});

								$td2.append($update);
								$td2.append($delete);
								$tr.append($td1);
								$tr.append($mecCreateDate);
								$tr.append($td2);
								$tableBody.append($tr);

							}
						} else {
							$tr = $("<tr>");
							$mecContent = $("<td colspan='3'>").text(
									"등록된 댓글이 없습니다.");

							$tr.append($mecContent);
							$tableBody.append($tr);
						}
					}
				});
	}
</script>
</body>
</html>