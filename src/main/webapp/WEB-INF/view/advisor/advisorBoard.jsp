<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8" />
    <title>Green Stock</title>
    <link rel="icon" href="/resources/img/favicon.png" sizes="32x32" />
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
  </head>
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
    #advisorBoard {
      width: 50%;
    }
    #advisorBoard textarea {
      resize: none;
      border: 1px solid #e7e7e7;
    }
    #advisorBoard #textareaReply{
      height: 120px;
    }
    #advisorBoard .hiddenPageArrow {
      visibility: hidden;
    }
    #advisorBoard .btn {
      border-radius: 5px;
      box-shadow: 1px 2px 1px 0px gray;
    }
    #advisorBoard .btn-warning {
      height: 30px;
      line-height: 30px;
      width: 60px;
      box-shadow: 1px 2px 1px 0px gray;
    }
    #advisorBoard #btnAdvisorBoardDelete{
      height: inherit;
      line-height: inherit;
    }
  </style>
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
    <div class="ec-content-wrapper container mb-5 advisorBoard" id="advisorBoard">
      <div class="content">
        <div class="breadcrumb-wrapper">
          <div class="my-4">
            <h4>${advisorBoard.advisorNickname} 상담게시판</h4>
            <input type="hidden" name="advisorNickname" value="${advisorBoard.advisorNickname}" />
          </div>
        </div>
        <div class="row">
          <div class="ec-blogs-rightside col-lg-12 order-lg-last col-md-12 order-md-first">
            <!-- Blog content Start -->
            <div class="ec-blogs-content">
              <div class="ec-blogs-inner">
                <div class="ec-blog-main-img text-center">
                  <img class="blog-image" src="/upload/${advisorBoard.image}" alt="Blog" style="width: 400px;"/>
                </div>
                <div class="ec-blog-date d-flex">
                  <p class="date me-auto">작성자 - ${advisorBoard.userName}</p>
                  <p class="date">${advisorBoard.createdAt.substring(0,10)} ${advisorBoard.createdAt.substring(11)} -</p>
                  <a href="javascript:void(0)">댓글 ${replyTotal}</a>
                </div>
                <div class="ec-blog-detail">
                  <h3 class="ec-blog-title">${advisorBoard.title}</h3>
                  <textarea name="" id="" cols="30" rows="10" readonly>${advisorBoard.content}</textarea>
                </div>
                <div class="ec-blog-arrows">
                  <a
                    href="/advisor/sub/board/${advisorBoard.advisorNickname}/${advisorBoard.prevBoard.advisorBoardId}"
                    class="${empty advisorBoard.prevBoard ? 'hiddenPageArrow' : ''}"
                    ><i class="ecicon eci-angle-left"></i> 이전 글</a
                  >
                  <a
                    href="/advisor/sub/board/${advisorBoard.advisorNickname}/${advisorBoard.nextBoard.advisorBoardId}"
                    class="${empty advisorBoard.nextBoard ? 'hiddenPageArrow' : ''}"
                    >다음 글 <i class="ecicon eci-angle-right"></i
                  ></a>
                </div>
                <div class="ec-blog-comments">
                  <div class="ec-blog-cmt-preview mb-5">
                    <c:choose>
                      <c:when test="${replyTotal > 0}">
                        <div class="ec-blog-comment-wrapper mt-55">
                          <h4 class="ec-blog-dec-title">댓글 수 : ${replyTotal}</h4>
                          <c:forEach var="entity" items="${reply.content}">
                            <div class="ec-single-comment-wrapper mt-35">
                              <div class="ec-blog-comment-content w-100">
                                <div class="d-flex align-items-baseline justify-content-between">
                                  <h5>${entity.userName}</h5>
                                  <c:if test="${entity.userId eq principal.id}">
                                    <button class="btn btn-warning btnDeleteAdvisorBoard" id="${entity.advisorBoardId}">삭제</button>
                                  </c:if>
                                </div>
                                <span>${entity.createdAt.substring(0, 10)} ${entity.createdAt.substring(11,16)}</span>
                                <p>${entity.content}</p>
                              </div>
                            </div>
                          </c:forEach>
                        </div>
                      </c:when>
                      <c:otherwise>
                        <div class="ec-blog-comment-wrapper mt-55">
                          <h4 class="ec-blog-dec-title">댓글이 없습니다.</h4>
                        </div>
                      </c:otherwise>
                    </c:choose>

                    <!-- 페이징 영역 -->
                    <c:if test="${replyTotal > 0}">
                      <div class="ec-pro-pagination justify-content-center">
                        <ul class="ec-pro-pagination-inner">
                          <c:if test="${pagination.prevPageGroup}">
                            <li>
                              <a class="next" href="/advisor/sub/board/${advisorBoard.advisorNickname}/reply/${advisorBoard.advisorBoardId}/${pagination.currentPage - 1}"
                                >Prev <i class="ecicon eci-angle-left"></i
                              ></a>
                            </li>
                          </c:if>
                          <c:forEach var="num" begin="${pagination.startPageGroup}" end="${pagination.endPageGroup}">
                            <c:if test="${not empty pagination.startPageGroup}">
                              <li>
                                <a
                                  class="btnPageNum ${num eq pagination.currentPage ? 'active' : ''}"
                                  href="/advisor/sub/board/${advisorBoard.advisorNickname}/reply/${advisorBoard.advisorBoardId}/${num}"
                                  >${num}</a
                                >
                              </li>
                            </c:if>
                          </c:forEach>
                          <c:if test="${pagination.nextPageGroup}">
                            <li>
                              <a class="next" href="/advisor/sub/board/${advisorBoard.advisorNickname}/reply/${advisorBoard.advisorBoardId}/${pagination.currentPage + 1}"
                                >Next <i class="ecicon eci-angle-right"></i
                              ></a>
                            </li>
                          </c:if>
                        </ul>
                      </div>
                    </c:if>
                  </div>
                  <div class="d-flex justify-content-end">
                    <c:if test="${advisorBoard.userId eq principal.id}">
                      <button id="btnAdvisorBoardUpdate" data-advisorboardid="${advisorBoard.advisorBoardId}" data-advisorboardnickname="${advisorBoard.advisorNickname}" type="button" class="btn btn-lg btn-info me-3">수 정</button>
                      <button id="btnAdvisorBoardDelete" data-advisorboardid="${advisorBoard.advisorBoardId}" data-advisorboardnickname="${advisorBoard.advisorNickname}" type="button" class="btn btn-lg btn-warning me-3">삭 제</button>
                    </c:if>
                    <button id="btnAdvisorBoardList" type="button" class="btn btn-lg btn-secondary">목 록</button>
                  </div>
                  <div class="ec-blog-cmt-form">
                    <div class="ec-blog-reply-wrapper mt-50">
                      <h4 class="ec-blog-dec-title">댓글 쓰기</h4>
                      <form
                        class="ec-blog-form"
                        id="saveReplyForm"
                        action="/advisor/sub/board/${advisorBoard.advisorNickname}/reply"
                        data-nickname="${advisorBoard.advisorNickname}"
                        method="post"
                      >
                      
                        <div class="row">
                          <div class="col-md-12">
                            <div class="ec-text-leave text-end">
                              <input type="hidden" name="userId" value="${principal.id}" />
                              <input type="hidden" name="advisorId" value="${advisorBoard.advisorId}" />
                              <input type="hidden" name="parent" value="${advisorBoard.advisorBoardId}" />
                              <textarea name="content" id="textareaReply" placeholder="댓글을 작성해주세요"></textarea>
                              <button id="btnReply" type="button" class="btn btn-lg btn-secondary">등 록</button>
                            </div>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!--Blog content End -->
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
    <script src="/resources/js/custom/advisorBoard.js"></script>
  </body>
</html>
