<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8" />
    <title>Green Stock</title>
    <link rel="icon" href="/resources/images/favicon/favicon.png" sizes="32x32" />
    <link rel="apple-touch-icon" href="/resources/images/favicon/favicon.png" />
    <meta name="msapplication-TileImage" content="/resources/images/favicon/favicon.png" />

    <!-- css Icon Font -->
    <link rel="stylesheet" href="/resources/css/vendor/ecicons.min.css" />

    <!-- css All Plugins Files -->
    <link rel="stylesheet" href="/resources/css/plugins/animate.css" />
    <link rel="stylesheet" href="/resources/css/plugins/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/plugins/jquery-ui.min.css" />
    <link rel="stylesheet" href="/resources/css/plugins/countdownTimer.css" />
    <link rel="stylesheet" href="/resources/css/plugins/slick.min.css" />
    <link rel="stylesheet" href="/resources/css/plugins/bootstrap.css" />

    <!-- Main Style -->
    <link rel="stylesheet" href="/resources/css/style.css" />
    <link rel="stylesheet" href="/resources/css/responsive.css" />

    <!-- Background css -->
    <link rel="stylesheet" id="bg-switcher-css" href="/resources/css/backgrounds/bg-4.css" />
    <!-- Vendor JS -->
    <script src="/resources/js/vendor/jquery-3.5.1.min.js"></script>
    <script src="/resources/js/vendor/popper.min.js"></script>
    <script src="/resources/js/vendor/bootstrap.min.js"></script>
    <script src="/resources/js/vendor/jquery-migrate-3.3.0.min.js"></script>
    <script src="/resources/js/vendor/modernizr-3.11.2.min.js"></script>

    <!--Plugins JS-->
    <script src="/resources/js/plugins/swiper-bundle.min.js"></script>
    <script src="/resources/js/plugins/countdownTimer.min.js"></script>
    <script src="/resources/js/plugins/scrollup.js"></script>
    <script src="/resources/js/plugins/jquery.zoom.min.js"></script>
    <script src="/resources/js/plugins/slick.min.js"></script>
    <script src="/resources/js/plugins/infiniteslidev2.js"></script>
    <script src="/resources/js/vendor/jquery.magnific-popup.min.js"></script>
    <script src="/resources/js/plugins/jquery.sticky-sidebar.js"></script>

    <!-- kjh -->
    <script src="https://kit.fontawesome.com/e8f010a863.js" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.js"></script>

    <style>
      .advisorBoardWrite {
        width: 50%;
      }
      .advisorBoardWrite textarea {
        resize: none;
        border: 1px solid #ededed;
      }
      @font-face {
        font-family: 'Dovemayo';
        src: url('/resources/fonts/Dovemayo_gothic.ttf') format('truetype');
        font-weight: normal;
      }
      *:not(i),
      h5,
      h6,
      li {
        font-family: 'Dovemayo', sans-serif !important;
        font-weight: normal;
      }
      .advisorBoardWrite .btn {
        width: 100px;
        height: 45px;
        border-radius: 30px;
        font-size: 16px;
        box-shadow: 3px 3px 3px 0px gray;
        margin-right: 10px;
      }
    </style>
  </head>
  <body>
    <%@ include file ="/WEB-INF/view/layout/header.jsp" %>
    <div class="sticky-header-next-sec ec-breadcrumb section-space-mb">
	  <div class="container">
	    <div class="row">
	      <div class="col-12">
	        <div class="row ec_breadcrumb_inner">
	          <div class="col-md-6 col-sm-12">
	            <h2 class="ec-breadcrumb-title">${category}</h2>
	          </div>
	          <div class="col-md-6 col-sm-12">
	            <!-- ec-breadcrumb-list start -->
	            <ul class="ec-breadcrumb-list">
	              <li class="ec-breadcrumb-item"><a href="/">메인</a></li>
	              <li class="ec-breadcrumb-item active">${category}</li>
	            </ul>
	            <!-- ec-breadcrumb-list end -->
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
    <!-- CONTENT WRAPPER -->
    <div class="container mt-4 mb-4 advisorBoardWrite">
      <div class="section-title text-center">
        <h3>${advisor.nickName} 게시판 글 쓰기</h3>
      </div>
      <div class="ec-register-wrapper">
        <div class="ec-register-container">
          <div class="ec-register-form">
            <form id="advisorBoardForm" action="/advisor/sub/board/${advisor.nickName}/write" method="post">
                <input type="hidden" name="advisorId" value="${advisor.advisorId}" id="">
                <input type="hidden" name="userId" value="${principal.id}">
              <span class="ec-register-wrap ec-register-half mb-4">
                <label>작성자</label>
                <span class="spanUserName ms-5">${principal.userName}</span>
              </span>
              <span class="ec-register-wrap">
                <label>제 목</label>
                <input type="text" name="title" value="" />
              </span>
              <span class="ec-register-wrap">
                <label>내 용</label>
                <textarea name="content" rows="10"  id=""></textarea>
              </span>
              <span class="ec-register-wrap ec-register-btn">
                <button class="btn btn-primary" type="submit">등 록</button>
              </span>
            </form>
          </div>
        </div>
      </div>
    </div>  
    <%@ include file ="/WEB-INF/view/layout/footer.jsp" %>
    <a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647"><i class="ecicon eci-arrow-up" aria-hidden="true"></i></a>
    <!-- Main Js -->
    <script src="/resources/js/main.js"></script>
    <script src="/resources/js/vendor/index.js"></script>
    <script src="/resources/js/custom/advisorBoardValidation.js"></script>
  </body>
</html>
