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
    <!-- Ec breadcrumb start -->
    <div class="sticky-header-next-sec  ec-breadcrumb section-space-mb">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row ec_breadcrumb_inner">
                        <div class="col-md-6 col-sm-12">
                            <h2 class="ec-breadcrumb-title">구독정보</h2>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <!-- ec-breadcrumb-list start -->
                            <ul class="ec-breadcrumb-list">
                                <li class="ec-breadcrumb-item">회원</li>
                                <li class="ec-breadcrumb-item active">구독정보</li>
                            </ul>
                            <!-- ec-breadcrumb-list end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Ec breadcrumb end -->

    <!-- Ec cart page -->
    <section class="ec-page-content section-space-p">
        <div class="container">
            <div class="row">
                <div class="ec-cart-leftside col-lg-8 col-md-12 ">
                    <!-- cart content Start -->
                    <div class="ec-cart-content">
                        <div class="ec-cart-inner">
                            <div class="row">
                                <form action="#">
                                    <div class="table-content cart-table-content">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>구독명</th>
                                                    <th>결제번호</th>
                                                    <th>총액</th>
                                                    <th>결제시각</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach var="pay" items="${payList}">
                                                <tr>
                                                    <td data-label="Price" class="ec-cart-pro-price"><span
                                                            class="amount">${pay.advisorNickName}</span></td>
                                                    <td data-label="Price" class="ec-cart-pro-price"><span
                                                            class="amount">${pay.tid}</span></td>
                                                    <td data-label="Price" class="ec-cart-pro-price"><span
                                                            class="amount">${pay.amount}</span></td>
                                                    <td data-label="Price" class="ec-cart-pro-price"><span
                                                            class="amount">${pay.createdAt}</span></td>
                                                    <td data-label="Remove" class="ec-cart-pro-remove">
                                                        <a href="/pay/refund?tid=${pay.tid}" class="btn btn-danger" style="font-size: 10px; color: white; width:80px; padding: 0 8px;">환불하기</a>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!--cart content End -->
                </div>
                <!-- Sidebar Area Start -->
                <div class="ec-cart-rightside col-lg-4 col-md-12">
                    <div class="ec-sidebar-wrap">
                        <!-- Sidebar Summary Block -->
                        <div class="ec-sidebar-block">
                            <div class="ec-sb-title">
                                <h3 class="ec-sidebar-title">요약</h3>
                            </div>
                            <div class="ec-sb-block-content">
                                <h4 class="ec-ship-title">구독 정보</h4>
                                <div class="ec-cart-form">
                                </div>
                            </div>

                            <div class="ec-sb-block-content">
                                <div class="ec-cart-summary-bottom">
                                    <div class="ec-cart-summary">
                                        <div>
                                            <span class="text-left">구독중인 서비스 수 : </span>
                                            <span class="text-right">${payList.size()}개</span>
                                        </div>
                                        <div class="ec-cart-coupan-content">
                                            <form class="ec-cart-coupan-form" name="ec-cart-coupan-form" method="post"
                                                action="#">
                                                <input class="ec-coupan" type="text" required=""
                                                    placeholder="Enter Your Coupan Code" name="ec-coupan" value="">
                                                <button class="ec-coupan-btn button btn-primary" type="submit"
                                                    name="subscribe" value="">Apply</button>
                                            </form>
                                        </div>
                                        <div class="ec-cart-summary-total">
                                            <span class="text-left" style="color: #444444; font-size: 14px; line-height: 24px; letter-spacing: 0; font-weight: bolder;">총 구독료 : </span>
                                            <span class="text-right" style="color: #555; font-size: 14px; line-height: 24px; font-weight: 500;">${totalAmount}원</span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Sidebar Summary Block -->
                    </div>
                </div>
            </div>
        </div>
    </section>
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
		<script src="/resources/js/custom/signIn.js"></script>

	</body>
</html>