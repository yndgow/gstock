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
    <script src="/resources/js/vendor/jquery-3.5.1.min.js"></script>
    <script src="/resources/js/vendor/jquery-migrate-3.3.0.min.js"></script>
    <link rel="stylesheet" href="/resources/css/plugins/jquery-ui.min.css" />
    <link rel="stylesheet" href="/resources/css/vendor/ecicons.min.css" />

    <!-- css All Plugins Files -->
    <link rel="stylesheet" href="/resources/css/plugins/animate.css" />
    <link rel="stylesheet" href="/resources/css/plugins/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/plugins/countdownTimer.css" />
    <link rel="stylesheet" href="/resources/css/plugins/slick.min.css" />
    <link rel="stylesheet" href="/resources/css/plugins/bootstrap.css" />
    <!-- Background css -->
    <link rel="stylesheet" id="bg-switcher-css" href="/resources/css/backgrounds/bg-4.css" />
    <!-- Vendor JS -->
    <script src="/resources/js/vendor/popper.min.js"></script>
    <script src="/resources/js/vendor/bootstrap.min.js"></script>
    <script src="/resources/js/vendor/modernizr-3.11.2.min.js"></script>

    <!-- Main Style -->
    <link rel="stylesheet" href="/resources/css/style.css" />
    <link rel="stylesheet" href="/resources/css/responsive.css" />
    <!--Plugins JS-->
    <script src="/resources/js/plugins/swiper-bundle.min.js"></script>
    <script src="/resources/js/plugins/countdownTimer.min.js"></script>
    <script src="/resources/js/plugins/scrollup.js"></script>
    <script src="/resources/js/plugins/jquery.zoom.min.js"></script>
    <script src="/resources/js/plugins/slick.min.js"></script>
    <script src="/resources/js/plugins/infiniteslidev2.js"></script>
    <script src="/resources/js/vendor/jquery.magnific-popup.min.js"></script>
    <script src="/resources/js/plugins/jquery.sticky-sidebar.js"></script>
    <!-- Main Js -->
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
    <div class="ec-content-wrapper container mb-5 stockSearchList">
      <div class="content">
        <div class="breadcrumb-wrapper">
          <div>
            <h4>검색목록</h4>
            <p class="breadcrumbs mb-3 findResult">
              <span>&quot;${responseDomesticStockSearchDto.searchData}&quot;</span> <span><i class="mdi mdi-chevron-right"></i></span>검색결과
              ${responseDomesticStockSearchDto.pagination.totalCount} 건
            </p>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <div class="card card-default">
              <div class="card-body">
                <div class="table-responsive">
                  <c:choose>
                    <c:when test="${empty responseDomesticStockSearchDto.domesticStockCurrentPriceList}">
                      <table id="responsive-data-table" class="table searchList" style="width: 100%">
                        <tbody>
                          <tr>
                            <td>'${responseDomesticStockSearchDto.searchData}' 에 대한 정보가 없습니다.</td>
                          </tr>
                        </tbody>
                      </table>
                    </c:when>
                    <c:otherwise>
                      <table id="responsive-data-table" class="table searchList" style="width: 100%">
                        <thead>
                          <tr class="text-center">
                            <th>종목명</th>
                            <th>현재가</th>
                            <th>전일대비</th>
                            <th>등락율</th>
                            <th>매도호가</th>
                            <th>매수호가</th>
                            <th>거래량</th>
                            <th>거래대금(백만)</th>
                          </tr>
                        </thead>

                        <tbody>
                          <c:forEach var="item" items="${responseDomesticStockSearchDto.domesticStockCurrentPriceList}">
                            <tr class="text-end pe-3">
                              <td class="text-start">
                                <a href="/stock/domestic/${item.companyCode}?companyName=${item.companyName}">${item.companyName}</a
                                ><span class="badge badge-primary ms-2 tag">${fn:toUpperCase(item.type)}</span>
                              </td>
                              <td><fmt:formatNumber value="${item.stckPrpr}" /></td>
                              <td class="${item.prdyVrssSign < 3 ? 'primaryColorRed' : 'primaryColorBlue'}">
                                ${item.prdyVrssSign < 3 ? '▲' : '▼'}
                                <fmt:formatNumber value="${item.prdyVrss}" />
                              </td>
                              <td class="${item.prdyVrssSign < 3 ? 'primaryColorRed' : 'primaryColorBlue'}">${item.prdyVrssSign < 3 ? '+' += item.prdyCtrt : item.prdyCtrt} %</td>
                              <td><fmt:formatNumber value="${item.stckHgpr}" /></td>
                              <td><fmt:formatNumber value="${item.stckLwpr}" /></td>
                              <td><fmt:formatNumber value="${item.acmlVol}" /></td>
                              <td><fmt:formatNumber value="${item.acmlTrPbmnMillion}" /></td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </c:otherwise>
                  </c:choose>
                </div>
                <!-- 페이징 영역 -->
                <div class="ec-pro-pagination">
                  <span
                    >Showing ${responseDomesticStockSearchDto.pagination.start}-${responseDomesticStockSearchDto.pagination.end} of
                    ${responseDomesticStockSearchDto.pagination.totalCount} 개</span
                  >
                  <ul class="ec-pro-pagination-inner">
                    <c:if test="${responseDomesticStockSearchDto.pagination.prevPageGroup}">
                      <li>
                        <a
                          class="next"
                          href="/stock/domestic?searchData=${responseDomesticStockSearchDto.searchData}&page=${responseDomesticStockSearchDto.pagination.currentPage - 1}"
                          >Prev <i class="ecicon eci-angle-left"></i
                        ></a>
                      </li>
                    </c:if>

                    <c:forEach var="num" begin="${responseDomesticStockSearchDto.pagination.startPageGroup}" end="${responseDomesticStockSearchDto.pagination.endPageGroup}">
                      <li>
                        <a
                          class="${num eq responseDomesticStockSearchDto.pagination.currentPage ? 'active' : ''}"
                          href="/stock/domestic?searchData=${responseDomesticStockSearchDto.searchData}&page=${num}"
                          >${num}</a
                        >
                      </li>
                    </c:forEach>
                    <c:if test="${responseDomesticStockSearchDto.pagination.nextPageGroup}">
                      <li>
                        <a
                          class="next"
                          href="/stock/domestic?searchData=${responseDomesticStockSearchDto.searchData}&page=${responseDomesticStockSearchDto.pagination.currentPage + 1}"
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
