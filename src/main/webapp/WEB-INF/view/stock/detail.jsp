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
    <link rel="stylesheet" href="/resources/css/custom/stockDetail.css" />

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
    <div class="ec-content-wrapper container mt-4 mb-4 stockDetail">
      <div class="content">
        <div class="breadcrumb-wrapper breadcrumb-wrapper-2 typography row">
          <div class="col-4 divCompanyNameInfo">
            <div class="divCompanyName">
              <div class="d-flex">
                <p class="ec-fw-bold h2ComapnyName">${companyName}</p>
              </div>
              <div>
                <p class="breadcrumbs" id="companyCode">
                  <span><i class="mdi mdi-chevron-right"></i></span>${companyCode}
                </p>
              </div>
            </div>
          </div>
          <div class="col-8 divComapnyStockInfo">
            <div class="row">
              <div class="col-lg-3 col-md-6 colCompanyStockInfo">
                <div>
                  <h1 class="changeElementArray mb-0 ${stockCurrentPrice.prdyVrssSign < 3 ? 'primaryColorRed' : 'primaryColorBlue'}">
                    <fmt:formatNumber value="${stockCurrentPrice.stckPrpr}" />
                  </h1>
                </div>
              </div>
              <div class="col-lg-2 col-md-6 colCompanyStockInfo">
                <div>
                  <p>전일</p>
                  <span><fmt:formatNumber value="${stockCurrentPrice.stckSdpr}" /></span>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 colCompanyStockInfo">
                <div>
                  <p>고가</p>
                  <p>
                    <span class="changeElementArray primaryColorRed">
                      <fmt:formatNumber value="${stockCurrentPrice.stckHgpr}" />
                    </span>
                    (상한가 <span class="primaryColorRed" id="stckMxpr"><fmt:formatNumber value="${stockCurrentPrice.stckMxpr}" /></span>)
                  </p>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 colCompanyStockInfo">
                <div>
                  <p>거래량</p>
                  <span class="changeElementArray"><fmt:formatNumber value="${stockCurrentPrice.acmlVol}" /></span>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-3 col-md-6 colCompanyStockInfo">
                <div>
                  <p>전일대비</p>
                  <p>
                    <span class="${stockCurrentPrice.prdyVrssSign < 3 ? 'primaryColorRed' : 'primaryColorBlue'}">${stockCurrentPrice.prdyVrssSign < 3 ? '▲' : '▼'}</span>
                    <span class="changeElementArray ${stockCurrentPrice.prdyVrssSign < 3 ? 'primaryColorRed' : 'primaryColorBlue'}">
                      <fmt:formatNumber value="${stockCurrentPrice.prdyVrss}"
                    /></span>
                    |
                    <span class="changeElementArray ${stockCurrentPrice.prdyVrssSign < 3 ? 'primaryColorRed' : 'primaryColorBlue'}">${stockCurrentPrice.prdyCtrt} </span>%
                  </p>
                </div>
              </div>
              <div class="col-lg-2 col-md-6 colCompanyStockInfo">
                <div>
                  <p>시가</p>
                  <span class="changeElementArray"><fmt:formatNumber value="${stockCurrentPrice.stckOprc}" /></span>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 colCompanyStockInfo">
                <div>
                  <p>저가</p>
                  <p>
                    <span class="changeElementArray primaryColorBlue">
                      <fmt:formatNumber value="${stockCurrentPrice.stckLwpr}" />
                    </span>
                    (하한가 <span class="primaryColorBlue" id="stckLlam"><fmt:formatNumber value="${stockCurrentPrice.stckLlam}" /></span>)
                  </p>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 colCompanyStockInfo">
                <div>
                  <p>거래대금</p>
                  <span class="changeElementArray"><fmt:formatNumber value="${stockCurrentPrice.acmlTrPbmnMillion}" /></span> 백만
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="divBtnTab my-3 row">
          <div class="col-6">
            <button class="btn btn-green btnChartDate" data-date="week">1W</button>
            <button class="btn btnChartDate" data-date="month">1M</button>
            <button class="btn btnChartDate" data-date="year">5M</button>
          </div>
          <div class="col-1">
            <div class="ec-tools-sidebar divWebSocket">
              <div class="ec-fullscreen-mode">
                <div class="ec-fullscreen-switch2">
                  <div class="ec-fullscreen-btn">실시간</div>
                  <div class="ec-fullscreen-on btnGetWebSocketData">On</div>
                  <div class="ec-fullscreen-off btnGetWebSocketData">Off</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-1" style="width: 90px; min-width: 90px; padding: 0px 5px; text-align: center;">
          <!------------------------- 채팅창 include 부분 -->
				  <c:choose>
            <c:when test="${empty principal}">
              <button class="btn btn-green" id="chatIn" style="width: 100%; font-size: 12px; font-weight: bold;" onclick="subscribeInit.toSignIn()">채팅창</button>
            </c:when>
            <c:when test="${subCheck eq principal.id}">
						  <button class="btn btn-green" type="button" id="openChat" onclick="window.open('/chat?companyCode=${companyCode}&companyName=${chat.companyName}&userId=${principal.id}', '_black', 'width= 480; height= 720;');" style="width: 100%;">채팅창<br>열기</button>
              <button type="button" id="unSubscribe-btn" onclick="subscribeInit.subscribe(${companyCode}, ${principal.id})" style="width: 100%; background-color: #ff3149; color: white; border-radius: 5px; font-size: 10px; margin: auto;">구독 해제</button>
					  </c:when>									
            <c:when test="${subCheck ne principal.id}">
              <button class="btn btn-green" id="subCheckBtn" style="width: 100%; font-weight: bold;" onclick="subscribeInit.subscribe('${companyCode}',${principal.id})">채팅창<br>구독</button>
            </c:when>
				</c:choose>
				<!------------------------- 채팅창 include 부분 끝 -->
          </div>
          <div class="col-4">
            <div class="col-lg-3 d-flex areaTab">
              <button class="btn btn-green btnTab" type="button" data-tab-target="#divTab1">투자정보</button>
              <button class="btn btnTab" type="button" data-tab-target="#divTab2">호가10단계</button>
              <button class="btn btnTab" type="button" data-tab-target="#divTab3">매매동향</button>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <canvas id="stockDetailchart"></canvas>
            <canvas id="stockDetailchart2"></canvas>
          </div>
          <div class="col-4">
            <section class="section ec-category-section section-space-p p-0" id="categories">
              <div>
                <div>
                  <!--Category Nav Start -->

                  <!-- Category Nav End -->
                  <!--Category Tab Start -->
                  <div class="col-lg-12">
                    <div class="tab-content">
                      <!-- 1st Category tab start -->
                      <div class="tab-pane fade divTab active" id="divTab1" role="tabpanel">
                        <div class="table-responsive">
                          <table class="table table-borederd text-end">
                            <tbody>
                              <tr>
                                <th class="text-start">시가총액</th>
                                <td><fmt:formatNumber value="${stockCurrentPrice.htsAvls}" /></td>
                              </tr>
                              <tr>
                                <th class="text-start">상장주식수</th>
                                <td><fmt:formatNumber value="${stockCurrentPrice.lstnStcn}" /></td>
                              </tr>
                              <tr>
                                <th class="text-start">외국인보유주식수</th>
                                <td><fmt:formatNumber value="${stockCurrentPrice.frgnHldnQty}" /></td>
                              </tr>
                              <tr>
                                <th class="text-start">외국인소진율</th>
                                <td>${stockCurrentPrice.htsFrgnEhrt} %</td>
                              </tr>
                              <tr>
                                <th class="text-start">52주 최고 | 최저</th>
                                <td><fmt:formatNumber value="${stockCurrentPrice.w52Hgpr}" /> | <fmt:formatNumber value="${stockCurrentPrice.w52Lwpr}" /></td>
                              </tr>
                              <tr>
                                <th class="text-start">PER | EPS</th>
                                <td>${stockCurrentPrice.per} 배 | <fmt:formatNumber value="${stockCurrentPrice.eps}" /> 원</td>
                              </tr>
                              <tr>
                                <th class="text-start">PBR | BPS</th>
                                <td>${stockCurrentPrice.pbr} 배 | <fmt:formatNumber value="${stockCurrentPrice.bps}" /> 원</td>
                              </tr>
                              <tr>
                                <td colspan="2" style="text-align: left; font-size: 11px">PER : 주가수익률(Price Earnings Ratio). 주가를 1주당 순이익으로 나눈 것</td>
                              </tr>
                              <tr>
                                <td colspan="2" style="text-align: left; font-size: 11px">EPS : 주당순이익(Earning per Stocks). 1주당 순이익</td>
                              </tr>
                              <tr>
                                <td colspan="2" style="text-align: left; font-size: 11px">PBR : 주가순자산비율(price-to-book ratio). 주가를 주당순자산가치로 나눈 것</td>
                              </tr>
                              <tr>
                                <td colspan="2" style="text-align: left; font-size: 11px">BPS : 주당순자산가치(Earning per Stocks). 기업의 순자산을 발행 주식수로 나눈 것</td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                      <!-- 1st Category tab end -->
                      <!-- 2nd Category tab start -->
                      <div class="tab-pane fade divTab" id="divTab2" role="tabpanel">
                        <div class="table-responsive d-flex">
                          <table class="table table-borederd primaryColorBlue">
                            <tbody>
                              <tr>
                                <th>매도 잔량</th>
                                <th>호가</th>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.askpRsqn10}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.askp10}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.askpRsqn9}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.askp9}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.askpRsqn8}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.askp8}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.askpRsqn7}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.askp7}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.askpRsqn6}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.askp6}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.askpRsqn5}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.askp5}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.askpRsqn4}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.askp4}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.askpRsqn3}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.askp3}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.askpRsqn2}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.askp2}" /></td>
                              </tr>
                              <tr class="font-weight-bold">
                                <td><fmt:formatNumber value="${askingSellingPrice.askpRsqn1}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.askp1}" /></td>
                              </tr>
                            </tbody>
                          </table>
                          <table class="table table-borederd text-end primaryColorRed">
                            <tbody>
                              <tr>
                                <th>호가</th>
                                <th>매수 잔량</th>
                              </tr>
                              <tr class="font-weight-bold">
                                <td><fmt:formatNumber value="${askingSellingPrice.bidp10}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidpRsqn10}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidp9}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidpRsqn9}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidp8}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidpRsqn8}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidp7}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidpRsqn7}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidp6}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidpRsqn6}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidp5}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidpRsqn5}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidp4}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidpRsqn4}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidp3}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidpRsqn3}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidp2}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidpRsqn2}" /></td>
                              </tr>
                              <tr>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidp1}" /></td>
                                <td><fmt:formatNumber value="${askingSellingPrice.bidpRsqn1}" /></td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                      <!-- 2nd Category tab end -->
                      <!-- 3rd Category tab start -->
                      <div class="tab-pane fade divTab" id="divTab3" role="tabpanel">
                        <div class="table-responsive">
                          <table class="table" style="margin-bottom: 17px">
                            <thead>
                              <tr>
                                <th>매도 상위</th>
                                <th>거래량</th>
                                <th>매수 상위</th>
                                <th>거래량</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>${inquireMember.selnMbcrName1}</td>
                                <td><fmt:formatNumber value="${inquireMember.totalSelnQty1}" /></td>
                                <td>${inquireMember.shnuMbcrName1}</td>
                                <td><fmt:formatNumber value="${inquireMember.totalShnuQty1}" /></td>
                              </tr>
                              <tr>
                                <td>${inquireMember.selnMbcrName2}</td>
                                <td><fmt:formatNumber value="${inquireMember.totalSelnQty2}" /></td>
                                <td>${inquireMember.shnuMbcrName2}</td>
                                <td><fmt:formatNumber value="${inquireMember.totalShnuQty2}" /></td>
                              </tr>
                              <tr>
                                <td>${inquireMember.selnMbcrName3}</td>
                                <td><fmt:formatNumber value="${inquireMember.totalSelnQty3}" /></td>
                                <td>${inquireMember.shnuMbcrName3}</td>
                                <td><fmt:formatNumber value="${inquireMember.totalShnuQty3}" /></td>
                              </tr>
                              <tr>
                                <td>${inquireMember.selnMbcrName4}</td>
                                <td><fmt:formatNumber value="${inquireMember.totalSelnQty4}" /></td>
                                <td>${inquireMember.shnuMbcrName4}</td>
                                <td><fmt:formatNumber value="${inquireMember.totalShnuQty4}" /></td>
                              </tr>
                              <tr>
                                <td>${inquireMember.selnMbcrName5}</td>
                                <td><fmt:formatNumber value="${inquireMember.totalSelnQty5}" /></td>
                                <td>${inquireMember.shnuMbcrName5}</td>
                                <td><fmt:formatNumber value="${inquireMember.totalShnuQty5}" /></td>
                              </tr>
                            </tbody>
                          </table>
                          <div class="text-center">
                            <p>외국인 기관</p>
                          </div>
                          <table class="table">
                            <thead>
                              <tr class="text-center">
                                <th>날짜</th>
                                <th>종가</th>
                                <th>전일비</th>
                                <th>외국인</th>
                                <th>기관</th>
                              </tr>
                            </thead>
                            <tbody>
                              <c:forEach var="item" items="${inquireInvestors}">
                                <tr>
                                  <td class="text-center">${item.stckBsopDate}</td>
                                  <td class="text-end"><fmt:formatNumber value="${item.stckClpr}" /></td>
                                  <td class="text-end ${item.prdyVrssSign < 3 ? 'primaryColorRed' : 'primaryColorBlue'}"><fmt:formatNumber value="${item.prdyVrss}" /></td>
                                  <td class="text-end ${item.frgnNtbyQty > 0 ? 'primaryColorRed' : 'primaryColorBlue'}"><fmt:formatNumber value="${item.frgnNtbyQty}" /></td>
                                  <td class="text-end ${item.orgnNtbyQty > 0 ? 'primaryColorRed' : 'primaryColorBlue'}"><fmt:formatNumber value="${item.orgnNtbyQty}" /></td>
                                </tr>
                              </c:forEach>
                            </tbody>
                          </table>
                        </div>
                      </div>
                      <!-- 3rd Category tab end -->
                    </div>
                    <!-- Category Tab End -->
                  </div>
                </div>
              </div>
            </section>
            <div style="width: 100%; height: auto">
              <div class="table-responsive divVolumeRank">
                <table class="table table-borederd tableVolumeRank">
                  <caption>
                    <h6>거래량 순위</h6>
                  </caption>
                  <c:forEach var="item" items="${rankOutPut}" varStatus="status">
                    <tr>
                      <td>${status.count}. <a href="/stock/domestic/${item.mkscShrnIscd}">${item.htsKorIsnm}</a></td>
                      <td class="text-end ${item.prdyVrssSign < 3 ? 'primaryColorRed' : 'primaryColorBlue'}"><fmt:formatNumber value="${item.stckPrpr}" /></td>
                      <td class="text-end ${item.prdyVrssSign < 3 ? 'primaryColorRed' : 'primaryColorBlue'}"><fmt:formatNumber value="${item.prdyVrss}" /></td>
                      <td class="text-end ${item.prdyVrssSign < 3 ? 'primaryColorRed' : 'primaryColorBlue'}">${item.prdyCtrt}%</td>
                    </tr>
                  </c:forEach>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- End Content -->
    </div>
    <!-- End Content Wrapper -->

    <%@ include file ="/WEB-INF/view/layout/footer.jsp" %>
    <a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: none"><i class="ecicon eci-arrow-up" aria-hidden="true"></i></a>
  </body>
  <!-- Main Js -->
  <script src="/resources/js/vendor/index.js"></script>
  <script src="/resources/js/main.js"></script>
  <!-- kjh -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.2.0/crypto-js.min.js"></script>
  <script src="/resources/js/custom/stockChart.js"></script>
  <script src="/resources/js/custom/stockWebsocket.js"></script>
  <script src="/resources/js/custom/stockTab.js"></script>
  <script src="/resources/js/custom/subscribe.js"></script>
</html>
