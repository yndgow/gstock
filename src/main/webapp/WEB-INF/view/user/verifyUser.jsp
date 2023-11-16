<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta name="description" content="Ekka - Admin Dashboard HTML Template.">

		<title>Green Stock</title>
		
		<!-- GOOGLE FONTS -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

		<link href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css" rel="stylesheet" />
		
		<!-- Ekka CSS -->
		<link id="ekka-css" rel="stylesheet" href="/resources/css/ekka.css" />
		
		<!-- FAVICON -->
		<link href="/resources/img/favicon.png" rel="shortcut icon" />
	</head>
	
	<body class="sign-inup" id="body">
	<%@include file="/WEB-INF/view/layout/header.jsp"%>
		<div class="sticky-header-next-sec ec-breadcrumb section-space-mb" style="display: block">
		  <div class="container">
		    <div class="row">
		      <div class="col-12">
		        <div class="row ec_breadcrumb_inner">
		          <div class="col-md-6 col-sm-12">
		            <h2 class="ec-breadcrumb-title">정보 확인</h2>
		          </div>
		          <div class="col-md-6 col-sm-12">
		            <!-- ec-breadcrumb-list start -->
		            <ul class="ec-breadcrumb-list">
		              <li class="ec-breadcrumb-item"><a href="index.html">회원</a></li>
		              <li class="ec-breadcrumb-item active">정보 확인</li>
		            </ul>
		            <!-- ec-breadcrumb-list end -->
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		<div class="container d-flex align-items-center justify-content-center form-height-login pt-24px pb-24px card-body" style="background-image: url('/resources/img/sign_in_test1.jpg'); height: 70vh;">
			<div class="row justify-content-center">
				<div class="col-lg-6 col-md-10">
					<div class="card">
						<div class="card-header bg-primary">
							<div class="ec-brand">
								<a href="/main" title="Ekka">
									<img class="ec-brand-icon" src="/resources/img/G_logo_white.jpg" alt="" />
								</a>
							</div>
						</div>
						<div class="card-body p-5">
							<h4 class="text-dark mb-5" style="margin-bottom: 50px !important;">유저 확인</h4>
							
							<form action="/user/verify-user" method="post" id="loginForm">
								<div class="row">
									<div class="form-group col-md-12 mb-4">
										<input type="text" class="form-control" id="userName" name="userName" placeholder="아이디">
									</div>
									
									<div class="form-group col-md-12 ">
										<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
									</div>
									
									<div class="col-md-12">
										<button type="button" class="btn btn-primary btn-block mb-4 bg-primary" style="margin-top: 30px;" id="signInBtn">유저 확인</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/view/layout/footer.jsp"%>
		<!-- Javascript -->
		<script src="/resources/plugins/jquery/jquery-3.5.1.min.js"></script>
		<script src="/resources/js/bootstrap.bundle.min.js"></script>
		<script src="/resources/plugins/jquery-zoom/jquery.zoom.min.js"></script>
		<script src="/resources/plugins/slick/slick.min.js"></script>
	
		<!-- Ekka Custom -->	
		<script src="/resources/js/ekka.js"></script>
		
		<!-- custom Js -->
		<script src="/resources/js/custom/common.js"></script>
		<script src="/resources/js/custom/verifyUser.js"></script>
	</body>
</html>