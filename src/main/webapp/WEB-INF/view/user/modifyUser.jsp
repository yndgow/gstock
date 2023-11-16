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
		            <h2 class="ec-breadcrumb-title">정보 수정</h2>
		          </div>
		          <div class="col-md-6 col-sm-12">
		            <!-- ec-breadcrumb-list start -->
		            <ul class="ec-breadcrumb-list">
		              <li class="ec-breadcrumb-item"><a href="index.html">회원</a></li>
		              <li class="ec-breadcrumb-item active">정보 수정</li>
		            </ul>
		            <!-- ec-breadcrumb-list end -->
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- start of main  -->
		<div class="container d-flex align-items-center justify-content-center form-height pt-24px pb-24px">
		    <div class="row justify-content-center">
		      <div class="col-lg-4 col-md-10">
		        <div class="card">
		          <div class="card-header bg-primary">
		            <div class="ec-brand">
		              <a href="index.html" title="Ekka">
		                <img class="ec-brand-icon" src="/resources/img/G_logo_white.jpg" alt="" />
		              </a>
		            </div>
		          </div>
		          <div class="card-body p-5">
		            <h4 class="text-dark mb-5">회원 정보 수정</h4>
		
		            <form action="/user/modify-userInfo" method="post" class="signUpForm">
		              <div class="row">
		                <div class="form-group col-md-12 mb-4" style="margin-bottom:0px !important;">
		                  <div class="input-group">
		                  	<input type="text" class="form-control" id="userName" placeholder="아이디" name="userName" value="${principal.userName}">
		                  	<div class="input-group-append">
		                  		<input type="hidden" class="form-control" id="pName" value="${principal.userName}">
		                  		<button class="btn btn-primary bg-primary" type="button" id="checkId">중복확인</button>
		                  	</div>
		                  </div>
		                </div>
		                
		                <div class="form-group col-md-12 mb-4">
		                  <input type="password" class="form-control" id="password" placeholder="비밀번호" name="password">
		                </div>
		
		                <div class="form-group col-md-12 mb-4">
		                  <input type="password" class="form-control" id="cpassword" placeholder="비밀번호 확인">
		                </div>
		
				        <div class="input-group" style="margin-bottom:0px !important;">
			                <input type="text" class="form-control" id="email" placeholder="이메일" name="email" value="${principal.email}">
			                <input type="hidden" class="form-control" id="pEmail" placeholder="Email" value="${principal.email}">
			                <div class="input-group-append">
			                	<button class="btn btn-primary bg-primary" type="button" id="checkEmail">이메일 확인</button>
			                </div>
		                </div>
		                
		                <div class="form-group col-md-12 mb-4">
		                  <input type="text" class="form-control" id="emconfirm" placeholder="인증번호를 입력하세요." style="display: none; margin-top:20px;">
		                  <label class="form-label my-0" id="emailconfirmTxt" style="display: none; margin-left: 10px;"> </label><span id='timer2'></span>
		                </div>
<!-- 				        <div class="form-group col-md-12 mb-4">
		                  <input type="text" class="form-control" id="email" placeholder="Email" name="email">
		                </div> -->
		                		
				        <div class="form-group col-md-12 mb-4">
		                  <input type="text" class="form-control" id="tel" placeholder="휴대전화" name="tel" value="${principal.tel}">
		                </div>
		                
		            	<div class="form-group col-md-12 mb-4">
		                  <input type="text" class="form-control" id="bDate" placeholder="생년월일 Ex : 1994-04-26" name="birthDate" value="<fmt:formatDate value="${principal.birthDate}" pattern="yyyy-MM-dd" />"></input>
		                </div>
		                
		                <div class="col-md-12 row">
		                  <button type="submit" class="btn btn-primary btn-block mb-4 bg-primary" style="margin-left: 40px;">회원정보 수정</button>
		                  <button type="button" class="btn btn-danger btn-block mb-4 danger" id="deleteUserBtn">회원탈퇴</button>
		                </div>
		              </div>
		              <input type="hidden" class="form-control" id="userId" name="id" value="${principal.id}">
		            </form>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		<!-- end of main  -->
		<%@include file="/WEB-INF/view/layout/footer.jsp"%>
		<!-- Javascript -->
		<!-- custom Js -->
		<script src="/resources/js/custom/common.js"></script>
		<script src="/resources/js/custom/modifyUser.js"></script>
		
		<script src="/resources/plugins/jquery/jquery-3.5.1.min.js"></script>
		<script src="/resources/js/bootstrap.bundle.min.js"></script>
		<script src="/resources/plugins/jquery-zoom/jquery.zoom.min.js"></script>
		<script src="/resources/plugins/slick/slick.min.js"></script>
	
		<!-- Ekka Custom -->	
		<script src="/resources/js/ekka.js"></script>
	</body>
</html>