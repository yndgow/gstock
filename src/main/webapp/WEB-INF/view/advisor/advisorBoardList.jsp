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
    <link rel="stylesheet" href="/resources/css/custom/stockSearchList.css" />
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
    <div class="ec-content-wrapper container advisorBoardList" id="advisorBoardList">
      <div class="content">
        <div class="breadcrumb-wrapper">
          <div class="d-flex justify-content-between mb-2">
            <h4>${page.content[0].advisorNickname} 상담게시판</h4>
            <a href="/advisor/sub/board/${page.content[0].advisorNickname}/write" class="btn btn-primary">작성하기</a>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <div class="card card-default">
              <div class="card-body">
                <div class="table-responsive">
                  <table id="responsive-data-table" class="table" style="width: 100%">
                    <thead>
                      <tr class="text-center">
                        <th style="width: 10%">번호</th>
                        <th style="width: 50%">제목</th>
                        <th style="width: 20%">작성자</th>
                        <th style="width: 10%">작성일</th>
                        <th style="width: 10%">조회수</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="entity" items="${page.content}" varStatus="status">
                        <tr>
                          <td class="text-center">${page.getTotalElements() - status.index - page.getNumber() * 10}</td>
                          <td><a href="/advisor/sub/board/${entity.advisorNickname}/${entity.advisorBoardId}">${entity.title}</a></td>
                          <td>${entity.userName}</td>
                          <td class="text-center">${entity.createdAt.substring(0, 10)}</td>
                          <td>${entity.views}</td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
                <!-- 페이징 영역 -->
                <div class="ec-pro-pagination">
                  <span>Showing ${pagination.start}-${pagination.end} of ${pagination.totalCount} 개</span>
                  <ul class="ec-pro-pagination-inner">
                    <c:if test="${pagination.prevPageGroup}">
                      <li>
                        <a class="next" href="/advisor/sub/board/${page.content[0].advisorNickname}?page=${pagination.currentPage - 1}"
                          >Prev <i class="ecicon eci-angle-left"></i
                        ></a>
                      </li>
                    </c:if>

                    <c:forEach var="num" begin="${pagination.startPageGroup}" end="${pagination.endPageGroup}">
                      <li>
                        <a class="${num eq pagination.currentPage ? 'active' : ''}" href="/advisor/sub/board/${page.content[0].advisorNickname}?page=${num}">${num}</a>
                      </li>
                    </c:forEach>
                    <c:if test="${pagination.nextPageGroup}">
                      <li>
                        <a class="next" href="/advisor/sub/board/${page.content[0].advisorNickname}?page=${pagination.currentPage + 1}"
                          >Next <i class="ecicon eci-angle-right"></i
                        ></a>
                      </li>
                    </c:if>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End Content -->
    </div>
    <!-- End Content Wrapper -->
    <%@ include file ="/WEB-INF/view/layout/footer.jsp" %>
    <!-- Main Js -->
    <script src="/resources/js/main.js"></script>
    <script src="/resources/js/vendor/index.js"></script>
  </body>
</html>
