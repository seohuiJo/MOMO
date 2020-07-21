<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>고객센터 상세</title>
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
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->
	<jsp:include page="../common/header.jsp" />

	<div class="job_details_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<!--<div class="job_details_header">
                        <div class="single_jobs white-bg d-flex justify-content-between">
                            <div class="jobs_left d-flex align-items-center" style="line-height:45px;">
                                <div class="thumb">
                                    <img src="img/momologo-02.png" alt="" style="width:100%; height:50%">
                                </div>
                                <div class="jobs_conetent">
                                    <h4>고객센터</h4>
                                    <h5>모모에 대해 궁금하신 점, 광고, 협업 등 어떤 종류의 연락도 환영합니다.</h5>
                                </div>
                            </div>
                        </div>
                    </div>-->
					<div>
						<h3>
							<b>고객센터</b>
						</h3>
						<br>
						<h5>${servicecenter.userId }님의 문의내용</h5>
					</div>
					<div class="apply_job_form white-bg">
						<form action="scdetail.mo">
							<div class="row">
								<div class="col-md-12">
									<div class="input_field">
										<input type="text" id="sTitle"
											value="${servicecenter.sTitle }" readonly>
									</div>
								</div>

								<div class="col-md-12">
									<div class="input_field">
										<textarea name="sContent" id="sContent" cols="30" rows="25"
											readonly>
                                   ${servicecenter.sContent }
                                        </textarea>
									</div>
								</div>
								<div class="col-md-12">
									<div class="submit_btn" style="text-align: right;">
										<h6>*연락처는 문의내용 이외에 어떠한 다른 목적으로도 사용되지 않습니다.</h6>
										<a href="sendMessageView.mo"></a>
										<input type="button" class="genric-btn success" value = "답장하기"></a>
										<c:url var="scdelete" value="scdelete.mo">
									<c:param name="sId" value="${servicecenter.sId }" />
								</c:url>								
										 <a href="${scdelete }" class="genric-btn danger radius">삭제</a> 
										
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- link that opens popup -->
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


	<script src="js/main.js"></script>

	<jsp:include page="../common/footer.jsp" />

</body>

</html>