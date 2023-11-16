<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
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
    <!-- font-awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Hi+Melody&display=swap" rel="stylesheet" />

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
    
    <!-- Summernote -->
	 <script src="https://kit.fontawesome.com/e8f010a863.js" crossorigin="anonymous"></script>
	 <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.css" rel="stylesheet">
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.js"></script>
	 
	<style>
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

      #dropdownBtn {
        color: white;
        /* 		    padding: 10px 20px; */
        border: none;
        cursor: pointer;
      }

      .submenu {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        transition: max-height 0.5s ease-in-out;
        overflow: hidden;
        z-index: 800 !important;
      }

      .submenu a {
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        transition: 0.3s;
      }

      .submenu a:hover {
        background-color: #ddd;
      }

      .sign-inup .container {
        position: relative;
        z-index: auto;
      }
    </style>
  </head>
  <body>
    <header class="ec-header" style="position: relative !important; z-index: 200 !important">
      <!-- Header Start -->
      <div class="ec-header-bottom d-none d-lg-block">
        <div class="container position-relative">
          <div class="row">
            <div class="ec-flex">
              <!-- Header Logo Start -->
              <div class="align-self-center">
                <div class="header-logo">
                  <a href="/main"><img src="/resources/img/G_logo.jpg" alt="/resources/img/G_logo.jpg" /></a>
                </div>
              </div>
              <!-- Header Logo End -->

              <!-- Header Search Start -->
              <div class="align-self-center">
                <div class="header-search">
                  <form class="ec-btn-group-form" action="/stock/domestic" method="get">
                    <input class="form-control ec-search-bar" name="searchData" placeholder="종목명을 입력해주세요" type="text" required="required" />
                    <button class="submit" type="submit">
                      <i class="fi-rr-search"></i>
                    </button>
                  </form>
                </div>
              </div>
              <!-- Header Search End -->

              <!-- Header Button Start -->
              <div class="align-self-center">
                <div class="ec-header-bottons">
                  <!-- Header User Start -->
                  <c:if test="${empty principal}">
                    <li>
                      <a href="http://localhost/user/sign-in" style="display: flex; align-items: center" class="login_btn"
                        ><span><i class="fa-solid fa-arrow-right-to-bracket"></i></span><span>&nbsp;&nbsp;</span><span class="btn_label">로그인</span></a
                      >
                    </li>
                    <li>
                      <a href="http://localhost/user/sign-up" class="signIn_button" style="display: flex; align-items: center"
                        ><span><i class="fa-solid fa-user-plus"></i></span><span>&nbsp;&nbsp;</span><span class="btn_label">회원가입</span></a
                      >
                    </li>
                  </c:if>
                  <c:if test="${principal.roletypeId == 1}">
                    <div class="ec-main-menu">
                      <ul>
                        <li class="dropdown">
                          <a href="javascript:void(0)" style="display: flex; align-items: center"
                            ><i class="fa-solid fa-house-user"></i><span>&nbsp;&nbsp;</span><span class="btn_label">내 정보</span></a
                          >
                          <ul class="sub-menu" style="min-width: 120px">
                            <li><a href="/user/verify-user">내 정보 수정</a></li>
                            <li><a href="/user/payment">구독 목록</a></li>
                            <li><a href="/user/my-info">내 글 목록</a></li>
                          </ul>
                        </li>
                      </ul>
                    </div>
                    <li style="text-align: center; display: flex; align-items: center; margin-left: 0px">
                      <a href="http://localhost/user/sign-out" style="display: flex; align-items: center" class="signIn_button"
                        ><span><i class="fa-solid fa-person-walking-dashed-line-arrow-right"></i></span><span>&nbsp;&nbsp;</span><span class="btn_label">로그아웃</span></a
                      >
                    </li>
                  </c:if>
                  <c:if test="${principal.roletypeId == 0}">
                    <li>
                      <a href="http://localhost/admin/main" style="display: flex; align-items: center" class="login_btn"
                        ><span><i class="fa-solid fa-screwdriver-wrench"></i></span><span>&nbsp;&nbsp;</span><span class="btn_label">관리자 페이지</span></a
                      >
                    </li>
                    <li>
                      <a href="http://localhost/user/sign-out" style="display: flex; align-items: center" class="signIn_button"
                        ><span><i class="fa-solid fa-person-walking-dashed-line-arrow-right"></i></span><span>&nbsp;&nbsp;&nbsp;</span><span class="btn_label">로그아웃</span></a
                      >
                    </li>
                  </c:if>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Ec Header Button End -->
      <!-- Header responsive Bottom  Start -->
      <div class="ec-header-bottom d-lg-none">
        <div class="container position-relative">
          <div class="row">
            <!-- Ec Header Logo Start -->
            <div class="col">
              <div class="header-logo">
                <a href="/main"><img src="/resources/img/G_logo.jpg" alt="Site Logo" /></a>
              </div>
            </div>
            <!-- Ec Header Logo End -->
            <!-- Ec Header Search Start -->
            <div class="col d-flex justify-content-center align-items-center">
              <div class="header-search">
                <form class="ec-btn-group-form" action="#">
                  <input class="form-control ec-search-bar" placeholder="종목명을 입력해주세요" type="text" />
                  <button class="submit" type="submit">
                    <i class="fi-rr-search"></i>
                  </button>
                </form>
              </div>
            </div>
            <!-- Ec Header Search End -->
          </div>
        </div>
      </div>
      <!-- Header responsive Bottom  End -->
      <!-- EC Main Menu Start -->
      <div id="ec-main-menu-desk" class="d-none d-lg-block sticky-nav">
        <div class="container position-relative">
          <div class="row">
            <div class="col-md-12 align-self-center">
              <div class="ec-main-menu">
                <ul style="z-index: 1">
                  <li><a href="/main">메인</a></li>
                  <li class="dropdown">
                    <!--                     <span class="main-label-note-new" data-toggle="tooltip" title="NEW"></span> -->
                    <a href="/portfolio">포트폴리오</a>
                  </li>
                  <li class="dropdown">
                    <a href="javascript:void(0)">주식전문가</a>
                    <ul class="sub-menu">
                      <li><a href="/advisor/list">주식 전문가 리스트</a></li>
                      <li><a href="/advisor/register">전문가 신청</a></li>
                    </ul>
                  </li>
                  <li class="dropdown">
                    <a href="/board/list">커뮤니티</a>
                    <ul class="sub-menu">
                      <li><a href="/notice/list">공지사항</a></li>
                      <li><a href="/board/list">자유게시판</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Ec Main Menu End -->
    </header>
  </body>
</html>
