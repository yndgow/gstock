<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description"
	content="Ekka - Admin Dashboard eCommerce HTML Template.">

<title>Gstock Admin</title>

<!-- GOOGLE FONTS -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap"
	rel="stylesheet">

<link
	href="https://cdn.materialdesignicons.com/4.4.95/css/materialdesignicons.min.css"
	rel="stylesheet" />
	
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- PLUGINS CSS STYLE -->
<link href="/resources/plugins/daterangepicker/daterangepicker.css"
	rel="stylesheet">
<link href="/resources/plugins/simplebar/simplebar.css" rel="stylesheet" />

<!-- Ekka CSS -->
<link id="ekka-css" href="/resources/css/ekka.css" rel="stylesheet" />

<!-- FAVICON -->
<link href="/resources/img/favicon.png" rel="shortcut icon" />
<style>
.ec-brand a img {
    max-width: 100px;
}
</style>
</head>

<body
	class="ec-header-fixed ec-sidebar-fixed ec-sidebar-light ec-header-light"
	id="body">

	<!--  WRAPPER  -->
	<div class="wrapper">

		<!-- LEFT MAIN SIDEBAR -->
		<div class="ec-left-sidebar ec-bg-sidebar">
			<div id="sidebar" class="sidebar ec-sidebar-footer">

				<div class="ec-brand">
					<a href="/main" title="Gstock"><img src="/resources/img/G_logo.jpg" alt=""  style="width: 100px !important;"/>
					</a>
				</div>

				<!-- begin sidebar scrollbar -->
				<div class="ec-navigation" data-simplebar>
					<!-- sidebar menu -->
					<ul class="nav sidebar-inner" id="sidebar-menu">
						<!-- Dashboard -->
						<li class="active"><a class="sidenav-item-link"
							href="/admin/main"> <i class="mdi mdi-view-dashboard-outline"></i>
								<span class="nav-text">Admin Main</span>
						</a>
							<hr></li>
						<!-- Reviews -->
						<li><a class="sidenav-item-link" href="/admin/user">
								<i class="fas fa-user-edit" style="margin-right:20px;"></i> <span class="nav-text">회원 관리</span>
						</a></li>
						<!-- Board -->
						<li><a class="sidenav-item-link" href="/admin/board">
								<i class="fa-solid fa-pen-to-square" style="margin-right:20px;"></i> <span class="nav-text">게시판 관리</span>
						</a></li>
						<!-- Chatting -->
						<li><a class="sidenav-item-link" href="/admin/chat">
								<i class="fa-solid fa-comments" style="margin-right:20px;"></i> <span class="nav-text">채팅 관리</span>
						</a></li>	
						<!-- Notice  -->
						<li><a class="sidenav-item-link" href="/notice/admin/list">
								<i class="fa-solid fa-microphone-lines" style="margin-right:20px;"></i> <span class="nav-text">공지사항 관리</span>
						</a></li>
						<li><a class="sidenav-item-link" href="/admin/expert/1/page/1">
								<i class="fa-solid fa-user-secret" style="margin-right:20px;"></i> <span class="nav-text">전문가 신청 목록</span>
						</a></li>
						<!-- Category -->
					</ul>
				</div>
			</div>
		</div>

		<!--  PAGE WRAPPER -->
		<div class="ec-page-wrapper">

			<!-- Header -->
			<header class="ec-main-header" id="header">
				<nav class="navbar navbar-static-top navbar-expand-lg">
					<!-- Sidebar toggle button -->
					<button id="sidebar-toggler" class="sidebar-toggle" style="display : none"></button>
					<!-- search form -->
					<div style="margin-left : 2%" class="search-form d-lg-inline-block">
						<div class="input-group">
							<input type="text" name="query" id="search-input"
								class="form-control" placeholder="search.." autofocus
								autocomplete="off" />
							<button type="button" name="search" id="search-btn"
								class="btn btn-flat">
								<i class="mdi mdi-magnify"></i>
							</button>
						</div>
						<div id="search-results-container">
							<ul id="search-results"></ul>
						</div>
					</div>

					<!-- navbar right -->
					<div class="navbar-right">
						<ul class="nav navbar-nav">
							<li style="margin-right: 50px;"><a href="http://localhost/user/sign-out" style="display: flex; align-items: center;" class="signIn_button"><span><i class="fa-solid fa-person-walking-dashed-line-arrow-right"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">Logout</span></a></li>
						</ul>
					</div>
				</nav>
			</header>
