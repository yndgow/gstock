<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description"
	content="Ekka - Admin Dashboard eCommerce HTML Template.">

<title>Ekka - Admin Dashboard eCommerce HTML Template.</title>

<!-- GOOGLE FONTS -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap"
	rel="stylesheet">

<link
	href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css"
	rel="stylesheet" />

<!-- PLUGINS CSS STYLE -->
<link href="resources/plugins/daterangepicker/daterangepicker.css"
	rel="stylesheet">
<link href="resources/plugins/simplebar/simplebar.css" rel="stylesheet" />

<!-- Ekka CSS -->
<link id="ekka-css" href="resources/css/ekka.css" rel="stylesheet" />

<!-- FAVICON -->
<link href="resources/img/favicon.png" rel="shortcut icon" />
<style>
.ui-autocomplete {
	background-color: white; /* 배경색을 흰색으로 설정 */
	color: black; /* 텍스트 색상을 흰색으로 설정 */
}

.col-xl-3.col-sm-6.p-b-15.lbl-card[data-clicked="true"] .card-body {
	border: 1px solid rgba(0, 0, 255, 0.3);
	box-shadow: 0 1px 5px 1px rgba(0, 0, 0, 0.1);
}
</style>
</head>

<body
	class="ec-header-fixed ec-sidebar-fixed ec-sidebar-light ec-header-light"
	id="body">

	<!--  WRAPPER  -->
	<div class="wrapper">

		<!--  PAGE WRAPPER -->
		<div style="width: 100%;">
			<!-- <div class="ec-page-wrapper"> -->
			<div style="width: 100%; margin: auto;">

				<!-- Header -->
				<%@ include file="/WEB-INF/view/layout/header.jsp"%>
				<div class="sticky-header-next-sec ec-breadcrumb section-space-mb"
					style="display: block">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<div class="row ec_breadcrumb_inner">
									<div class="col-md-6 col-sm-12">
										<h2 class="ec-breadcrumb-title">포트폴리오</h2>
									</div>
									<div class="col-md-6 col-sm-12">
										<!-- ec-breadcrumb-list start -->
										<ul class="ec-breadcrumb-list">
											<li class="ec-breadcrumb-item"><a href="index.html">메인</a></li>
											<li class="ec-breadcrumb-item active">포트폴리오</li>
										</ul>
										<!-- ec-breadcrumb-list end -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- CONTENT WRAPPER -->
				<div class="ec-content-wrapper" style="width: 50%; margin: auto;">
					<div class="content">
						<!-- Top Statistics -->
						<H2>내 포트폴리오</H2>
						<div style="margin-top: 3%" id="smallCardOuterWrapper" class="row"></div>

						<div class="row">
							<div class="col-xl-4 col-md-12 p-b-15">
								<div class="card card-default" style="height: 100%">
									<div class="card-header justify-content-center" style="background-color:#8eb7e3;">
										<h2 style="color:white;">선택된 포트폴리오</h2>
									</div>
									<div id="portfolioInfo" class="card-body"></div>
									<div class="card-footer d-flex flex-wrap bg-white p-0"></div>
								</div>
							</div>
							<div class="col-xl-4 col-md-12 p-b-15">
								<!-- Doughnut Chart -->
								<div class="card card-default" style="height: 100%">
									<div class="card-header justify-content-center" style="background-color:#8eb7e3;">
										<h2 style="color:white;">주식 오버뷰</h2>
									</div>
									<div id="donutChartBody" class="card-body"></div>
								</div>
							</div>
							<div class="col-xl-4 col-md-12 p-b-15">
								<!-- Sales Graph -->
								<div id="user-acquisition" style="height: 100%"
									class="card card-default">
									<div class="card-header justify-content-center" style="background-color:#8eb7e3;">
										<h2 id="modal_ranking" style="color:white">랭킹</h2>
									</div>
									<div id="rankingBody" style="overflow: auto" class="card-body">
										<div class="tab-content" id="rankingWrapper"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 p-b-15">
								<!-- Recent Order Table -->
								<div
									class="card card-table-border-none card-default recent-orders"
									id="recent-orders">
									<div class="card-header justify-content-between" style="background-color:#8eb7e3;">
										<h2 style="color:white">내 주식</h2>
										<div id="addStock" style="cursor: pointer;color:white">
											주식추가 <span style="width: 5%; height: 100%;color:white"
												class="mdi mdi-clipboard-plus"></span>
										</div>
									</div>
									<div class="card-body pt-0 pb-5">
										<table id="myStockCardTable"
											class="table card-table table-responsive table-responsive-large"
											style="width: 100%">

										</table>
									</div>
									<div id="stockCardFooter"
										class="card-footer d-flex flex-wrap bg-white p-20"></div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-12 p-b-15">
								<!-- trade log table -->
								<div
									class="card card-table-border-none card-default recent-orders"
									id="recent-orders">
									<div class="card-header justify-content-between" style="background-color:#8eb7e3;">
										<h2 style="color:white">거래 기록</h2>
									</div>
									<div class="card-body pt-0 pb-5"
										style="overflow: auto; height: 300px;">
										<table id="myTradeLogTable"
											class="table card-table table-responsive table-responsive-large"
											style="width: 100%">

										</table>
									</div>
									<div id="stockCardFooter"
										class="card-footer d-flex flex-wrap bg-white p-20"></div>
								</div>
							</div>
						</div>



						<div class="row">
							<div class="col-xl-12 col-md-12 p-b-15">
								<!-- User activity statistics -->
								<div class="card card-default" id="user-activity">
									<div class="no-gutters">
										<div>
											<div class="card-header justify-content-between" style="background-color:#8eb7e3;">
												<h2 style="color:white">포트폴리오 성장률</h2>
												<!-- <div class="date-range-report ">
												<span></span>
											</div> -->
											</div>
											<div class="card-body">
												<div class="tab-content" id="userActivityContent">
													<div id="assetBody" class="tab-pane fade show active"
														id="user" role="tabpanel"></div>
												</div>
											</div>
											<!-- <div class="card-footer d-flex flex-wrap bg-white border-top">
											<a href="#" class="text-uppercase py-3">In-Detail
												Overview</a>
										</div> -->
										</div>
									</div>
								</div>
							</div>
							<%-- <div class="col-xl-4 col-md-12 p-b-15">
							<div class="card card-default">
								<div class="card-header flex-column align-items-start">
									<h2>Current Users</h2>
								</div>
								<div class="card-body">
									<canvas id="currentUser" class="chartjs"></canvas>
								</div>
								<div class="card-footer d-flex flex-wrap bg-white border-top">
									<a href="#" class="text-uppercase py-3">In-Detail Overview</a>
								</div>
							</div>
						</div> --%>
						</div>
					</div>
				</div>
				<!-- End Content -->
			</div>
			<!-- End Content Wrapper -->

			<!-- Footer -->
			<!-- <footer class="footer mt-auto">
			<div class="copyright bg-white">
				<p>
					Copyright &copy; <span id="ec-year"></span><a class="text-primary"
						href="https://themeforest.net/user/ashishmaraviya" target="_blank">
						Ekka Admin Dashboard</a>. All Rights Reserved.
				</p>
			</div>
		</footer> -->
		</div>
	</div>
	<div class="modal fade modal-contact-detail" id="modalContact"
		tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header justify-content-end border-bottom-0">
					<button id="closeButton" type="button" class="btn-close-icon"
						data-bs-dismiss="modal">
						<i class="mdi mdi-close"></i>
					</button>
				</div>
				<div class="modal-body pt-0">
					<div class="row no-gutters">
						<div class="col-md-6">
							<div class="profile-content-left px-4">
								<div class="text-center widget-profile px-0 border-0">
									<!-- 	<div class="card-img mx-auto rounded-circle">
										 <img src="assets/img/user/u6.jpg" alt="user image"> 
									</div> -->

									<div id="modal_canvasWrapper" class="card-body">
										<!-- <div class="card-img mx-auto rounded-circle">
											<img src="assets/img/user/u6.jpg" alt="user image">
										</div> -->
									</div>
								</div>

								<div class="d-flex justify-content-between"
									style="margin-top: 10%">
									<div class="text-center pb-4">
										<h6 class="text-dark pb-2">랭킹</h6>
										<p id="user_rank">12</p>
									</div>

									<div class="text-center pb-4">
										<h6 class="text-dark pb-2">수익률</h6>
										<p id="modal_ror">11.33 %</p>
									</div>

									<div class="text-center pb-4">
										<div id="visible_toggle" style="display: flex;">
											<h6 class="text-dark pb-2">공개여부</h6>
										</div>
										<p id="visibleText">public</p>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-6">
							<div id="modal-portfolio-info" class="contact-info px-4">
								<h4 class="text-dark mb-1">포트폴리오 상세</h4>
								<p class="text-dark font-weight-medium pt-4 mb-2">포폴제목</p>
								<p id="modal_pfName">My Test Portfolio</p>
								<p class="text-dark font-weight-medium pt-4 mb-2">포폴설명</p>
								<p id="modal_pfDisc">portfolio for Test</p>
								<p class="text-dark font-weight-medium pt-4 mb-2">등록일</p>
								<p id="modal_pfReg">2023-11-03</p>
								<!-- <button class = "btn btn-primary btn-pill my-4">저장</button>
												<button class = "btn btn-primary btn-pill my-4">삭제</button> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

	<!-- End Page Wrapper -->
	<!-- End Wrapper -->

	<!-- Common Javascript -->
	<script src="resources/plugins/jquery/jquery-3.5.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script src="resources/plugins/simplebar/simplebar.min.js"></script>
	<script src="resources/plugins/jquery-zoom/jquery.zoom.min.js"></script>
	<script src="resources/plugins/slick/slick.min.js"></script>

	<!-- Chart -->
	<script src="resources/plugins/charts/Chart.min.js"></script>
	<script src="resources/js/myportfolioChart.js"></script>

	<!-- Google map chart -->
	<script src="resources/plugins/charts/google-map-loader.js"></script>
	<script src="resources/plugins/charts/google-map.js"></script>

	<!-- Date Range Picker -->
	<script src="resources/plugins/daterangepicker/moment.min.js"></script>
	<script src="resources/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="resources/js/date-range.js"></script>

	<!-- Option Switcher -->
	<script src="resources/plugins/options-sidebar/optionswitcher.js"></script>

	<!-- Ekka Custom -->
	<script src="resources/js/ekka.js"></script>

	<!-- My Custom -->
	<script src="resources/js/portfolio.js"></script>
</body>

</html>