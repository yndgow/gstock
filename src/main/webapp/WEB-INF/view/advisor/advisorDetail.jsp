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
      #advisorDetail {
        width: 50%;
      }
      #advisorDetail table th {
        width: 25%;
      }
      #advisorDetail textarea {
        height: 140px;
        resize: none;
        border: none;
        padding: 0;
      }
      #advisorDetail #advisorCareer {
        height: 80px;
      }
      #advisorDetail .btn {
        width: 100px;
        height: 45px;
        border-radius: 10px;
        font-size: 16px;
        box-shadow: 3px 3px 3px 0px gray;
        margin-right: 10px;
      }
      #advisorDetail .btn-subscribe {
        background: #a6da41;
      }
      .advisorDetail .btn-advisor {
        width: 140px;
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
    <div class="container mt-4 mb-4 advisorDetail" id="advisorDetail">
      <div class="row">
        <div class="col-6">
          <img src="/upload/${advisor.image}" alt="" />
        </div>
        <div class="col-6">
          <div class="section-title text-center">
            <h3>전문가</h3>
          </div>
          <div class="table-responsive h-100">
            <input type="hidden" name="userId" id="userId" value="${principal.id}" />
            <table class="table w-100">
              <tbody>
                <tr>
                  <th scope="row">닉네임</th>
                  <td id="advisorNickName">${advisor.nickName}</td>
                </tr>
                <tr>
                  <th scope="row">이름</th>
                  <td>${advisor.fullName}</td>
                </tr>
                <tr>
                  <th scope="row">분야</th>
                  <td>${advisor.strSpecialization}</td>
                </tr>
                <tr>
                  <th scope="row">이력</th>
                  <td>
                    <!-- <textarea name="career" id="summernote" readonly>${advisor.career}</textarea> -->
                    <div>${advisor.career}</div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">자기소개</th>
                  <td>
                    <textarea name="career" id="advisorIntroduction" readonly>${advisor.introduction}</textarea>
                  </td>
                </tr>
              </tbody>
            </table>
            <div class="text-center">
              <c:if test="${!validate}">
                <button class="btn btn-subscribe" id="btnAdvisorSub" data-id="${advisor.advisorId}">구독하기</button>
              </c:if>
              <button class="btn btn-subscribe" id="btnAdvisorList">목록으로</button>
              <c:if test="${validate}">
              <button class="btn btn-info btn-advisor" id="btnAdvisorBoard" data-id="${advisor.advisorId}">
                상담게시판
              </button>
              <button class="btn btn-info btn-advisor" id="btnAdvisorChat" data-id="${advisor.advisorId}"
              		onclick="window.open('/chat?companyCode=${advisor.nickName}@${principal.userName}&userId=${principal.id}', '_black', 'width= 480, height= 720, location=no')">
              	실시간채팅
              </button>
            </c:if>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@ include file ="/WEB-INF/view/layout/footer.jsp" %>
    <a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647"><i class="ecicon eci-arrow-up" aria-hidden="true"></i></a>
  <!-- Main Js -->
  <script src="/resources/js/main.js"></script>
  <script src="/resources/js/vendor/index.js"></script>
  <script src="/resources/js/custom/advisorDetail.js"></script>
  </body>
</html>
