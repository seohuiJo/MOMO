<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>�α���</title>
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
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/slicknav.css">
<link rel="stylesheet" href="css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
<style>
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<!-- �̷»��� ��� -->
	<div class="whole-wrap">
		<div class="container box_1170">
			<div class="section-top-border">
				<div class="row">
					<div class="col-lg-2 col-md-2"></div>
					<div class="col-lg-8 col-md-8">
						<h3 class="mb-30">
							<b>�α���</b>
						</h3>
						<form action="login.mo" id="loginForm" method="post">
							<div class="section-top-border">
								<div class="mt-10">
									<div>
										<p>
											<i class="fa fa-thumb-tack" aria-hidden="true"></i> ���̵�
										</p>
									</div>
									<input type="text" name="userId" required class="single-input"
										placeholder="���̵�">
								</div>
								<div class="mt-10">
									<div>
										<p>
											<i class="fa fa-thumb-tack" aria-hidden="true"></i> ��й�ȣ
										</p>
									</div>
									<input type="password" name="password" required
										class="single-input" placeholder="�н�����">
								</div>
								<input type="submit" class="genric-btn success radius"
									value="�α���">&nbsp;&nbsp;
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- link that opens popup -->

<jsp:include page="../common/footer.jsp" />
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
<!-- <script src="js/gijgo.min.js"></script> -->
<script src="js/range.js"></script>



<!--contact js-->
<script src="js/contact.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>


<script src="js/main.js"></script>

<script>

	/* �˾�â �ݱ� */
	function closePopUp(){
		window.opener.location="signUp.mo";
		window.close();
	}
	/* �α���/ȸ������ �˾� â*/
	function findId() {
		var width = 430, height = 1000;
		var popupX = (document.body.offsetWidth / 2) - (width / 2);
		//&nbsp;���� �˾�â �¿� ũ���� 1/2 ��ŭ ���������� ���־���

		var popupY = (window.screen.height / 2) - (height / 2);
		//&nbsp;���� �˾�â ���� ũ���� 1/2 ��ŭ ���������� ���־���

		var url = "findId.html";
		/*var url = "/views/note/noteBox.jsp?type=1";*/
		var option = "width = " + width + ", height = " + height + ", " +
			"top = " + popupY + ", left = " + popupX + ", resizable=no, status=no, location=no";
		var title = "������/�α���";
		window.open(url, title, option);
	};

	function findPwd() {
		var width = 430,
			height = 415;
		var popupX = (document.body.offsetWidth / 2) - (width / 2);
		//&nbsp;���� �˾�â �¿� ũ���� 1/2 ��ŭ ���������� ���־���

		var popupY = (window.screen.height / 2) - (height / 2);
		//&nbsp;���� �˾�â ���� ũ���� 1/2 ��ŭ ���������� ���־���

		var url = "findPwd.html";
		/*var url = "/views/note/noteBox.jsp?type=1";*/
		var option = "width = " + width + ", height = " + height + ", " +
			"top = " + popupY + ", left = " + popupX + ", resizable=no, status=no, location=no";
		var title = "������/�α���";
		window.open(url, title, option);
	};

</script>
</html>