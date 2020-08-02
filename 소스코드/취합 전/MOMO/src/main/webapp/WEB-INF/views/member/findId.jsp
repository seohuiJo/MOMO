<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̵� ã��</title>
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
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/gijgo.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/slicknav.css">

<link rel="stylesheet" href="css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 410px;
}

/* Set gray background color and 100% height */
.sidenav {
	/*background-color: #87d1f2;*/
	background-image: url('img/banner/mainBanner.jpg');
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #87d1f2;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: 410px;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

table {
	width: 100%;
	height: 100%;
	text-align: center;
}
</style>
</head>
<body>
	<script type="text/javascript">
		window.onload = function() {
			if ($ {
					param.type
				} == 1) {
				receiveNoteBox();
			} else if ($ {
					param.type
				} == 2) {
				sendNoteBox();
			} else if ($ {
					param.type
				} == 3) {
				writeNote();
			}
		}

		function changeNavi(num) {
			if (num == 1) {
				$("#li1").addClass("active");
				$("#li2").removeClass("active");
				$("#li3").removeClass("active");
			} else if (num == 2) {
				$("#li1").removeClass("active");
				$("#li2").addClass("active");
				$("#li3").removeClass("active");
			} else if (num == 3) {
				$("#li1").removeClass("active");
				$("#li2").removeClass("active");
				$("#li3").addClass("active");
			}
		}

	</script>

	<div class="container-fluid" style="text-align: center;">

		<div class="row content">
			<form action="findId.mo" method="post">
				<div class="col-sm-3 sidenav">
					<br> <img src="img/momologo-03.png" alt="" style="width: 35%">
					<br>
					<br>
					<h2 class="bradcam_text" style="color: white;">���̵� ã��</h2>
					<br> <input type="text" name="email" required class="single-input" placeholder="�̸���">
					<br> <input type="submit" class="boxed-btn3" style="width: 100%;" value="���̵� ã��"><br>
					<br> <u><a href="#" onclick="javascript:findPwd();" style="color: white;">��й�ȣ�� �����̳���?</a></u> <br>
					<br> <a style="color: white;">��� ó���̽Ű���? </a>
						 <a href="#" onclick="signIn.html" style="color: white;">ȸ������</a>
				</div>
			</form>
		</div>
	</div>
</body>

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
<!-- <script src="js/gijgo.min.js"></script> -->
<script src="js/range.js"></script>



<!--contact js-->
<script src="js/contact.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>


<script src="js/main.js"></script>
<!-- ��й�ȣ �˾�â -->
<script>
function findPwd() {
	var width = 430,
		height = 415;
	var popupX = (document.body.offsetWidth / 2) - (width / 2);
	//&nbsp;���� �˾�â �¿� ũ���� 1/2 ��ŭ ���������� ���־���

	var popupY = (window.screen.height / 2) - (height / 2);
	//&nbsp;���� �˾�â ���� ũ���� 1/2 ��ŭ ���������� ���־���

	var url = "findPwdView.mo";
	/*var url = "/views/note/noteBox.jsp?type=1";*/
	var option = "width = " + width + ", height = " + height + ", " +
		"top = " + popupY + ", left = " + popupX + ", resizable=no, status=no, location=no";
	var title = "������/�α���";
	window.open(url, title, option);
};
</script>
</html>