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
		            <h2 class="ec-breadcrumb-title">ID/PW 찾기</h2>
		          </div>
		          <div class="col-md-6 col-sm-12">
		            <!-- ec-breadcrumb-list start -->
		            <ul class="ec-breadcrumb-list">
		              <li class="ec-breadcrumb-item"><a href="index.html">회원</a></li>
		              <li class="ec-breadcrumb-item active">ID/PW 찾기</li>
		            </ul>
		            <!-- ec-breadcrumb-list end -->
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- start of main  -->
		<!-- 아이디찾기  -->
		<div class="container d-flex align-items-center justify-content-center form-height pt-24px pb-24px" style="height: 80vh">
		    <div class="row justify-content-center col-md-6">
		      <div class="col-md-10" style="height:446px;">
		        <div class="card">
		          <div class="card-header bg-primary">
		            <div class="ec-brand">
		              <a href="index.html" title="Ekka">
		                <img class="ec-brand-icon" src="/resources/img/G_logo_white.jpg" alt="" />
		              </a>
		            </div>
		          </div>
		          <div class="card-body p-5" style="height:365px;">
		            <h4 class="text-dark mb-5">아이디 찾기</h4>
		
		            <form action="/user/find-id" method="post" class="signUpForm" style="margin-top: 50px;">
		              <div class="row">
				        <div class="form-group col-md-12 mb-4">
				            <input type="text" class="form-control" id="IdEmail" placeholder="이메일" name="email">
		                </div>
		                
		                <div class="col-md-12" style="margin-top: 40px;">
		                  <button type="button" class="btn btn-primary btn-block mb-4 bg-primary" id="findIdBtn">아이디 찾기</button>
		                </div>
		              </div>
		            </form>
		          </div>
		        </div>
		      </div>
		    </div>
		    <!-- 비밀번호 찾기  -->
		    <div class="row justify-content-center">
		      <div class="col-md-10">
		        <div class="card">
		          <div class="card-header bg-primary">
		            <div class="ec-brand">
		              <a href="index.html" title="Ekka">
		                <img class="ec-brand-icon" src="/resources/img/G_logo_white.jpg" alt="" />
		              </a>
		            </div>
		          </div>
		          <div class="card-body p-5">
		            <h4 class="text-dark mb-5">비밀번호 찾기</h4>
		            <form action="/user/modify-pw" method="post" class="signUpForm">
		              <div class="row">
		                <div class="form-group col-md-12 mb-4">
		                  	<input type="text" class="form-control" id="pwUserName" placeholder="아이디" name="userName">
		                </div>
		                
				        <div class="input-group" style="margin-bottom:0px !important;">
			                <input type="text" class="form-control" id="pwEmail" placeholder="이메일" name="email">
			                <div class="input-group-append">
			                	<button class="btn btn-primary bg-primary" type="button" id="checkEmail">이메일 확인</button>
			                </div>
		                </div>
		                
		                <div class="form-group col-md-12 mb-4">
		                  <input type="text" class="form-control" id="emconfirm" placeholder="인증번호를 입력하세요." style="display: none; margin-top:20px;">
		                  <label class="form-label my-0" id="emailconfirmTxt" style="display: none; margin-left: 10px;"> </label><span id='timer2'></span>
		                </div>
		                		                
		                <div class="form-group col-md-12 mb-4">
		                  <input type="password" class="form-control" id="password" placeholder="새 비밀번호" name="password" style="display: none;">
		                </div>
		
		                <div class="form-group col-md-12 mb-4">
		                  <input type="password" class="form-control" id="cpassword" placeholder="새 비밀번호 확인" style="display: none;">
		                </div>
		                
		                <div class="col-md-12">
		                  <button type = "submit" class="btn btn-primary btn-block mb-4 bg-primary">비밀번호 변경</button>
		                </div>
		              </div>
		            </form>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>

		<!-- end of main  -->
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
		<script src="/resources/js/custom/findIdPw.js"></script>
	</body>
</html>