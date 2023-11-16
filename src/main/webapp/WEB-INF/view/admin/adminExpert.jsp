<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>

<style>
.centered-table td, .centered-table th {
	vertical-align: middle;
}

#customPageA {
	display: inline-block;
	border: 1px solid lightgrey;
	padding: 4px 12px;
	margin: 1px;
	border-radius: 5px;
}

#customPagenation {
	width: 100%;
	margin: auto;
	text-align: center;
	margin-top: 0px;
	display: flex;
	justify-content: center;
}
</style>
<div class="ec-content-wrapper">
	<div class="content">
		<div class="breadcrumb-wrapper breadcrumb-contacts">
			<div>
				<h2>전문가 신청 목록</h2>
				<p class="breadcrumbs">
					<span><a href="index.html">메인</a></span> <span><i
						class="mdi mdi-chevron-right"></i></span>전문가
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="ec-vendor-list card card-default">
					<div class="card-body">
						<div class="table-responsive">
							<table id="responsive-data-table" class="table centered-table">
								<thead>
									<tr>
										<th>이름</th>
										<th>이메일</th>
										<th>휴대폰</th>
										<th>생일</th>
										<th>가입일</th>
										<th>신청일</th>
										<th>
											<div style="display: flex; float: right;"
												class="dropdown show d-inline-block widget-dropdown">
												<a style="display: block"
													class="dropdown-toggle icon-burger-mini" href="#"
													role="button" id="dropdown-recent-order4"
													data-bs-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false" data-display="static"></a>
												<ul class="dropdown-menu dropdown-menu-center">
													<li class="dropdown-item"><a href="/admin/expert/1/page/1">신청</a></li>
													<li class="dropdown-item"><a href="/admin/expert/2/page/1">승인</a></li>
													<li class="dropdown-item"><a href="/admin/expert/3/page/1">반려</a></li>
												</ul>
											</div>
										</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="expert" items="${expertList}">
										<tr id="tr_${expert.id}">
											<td>${expert.advisorFullName}</td>
											<td>${expert.email}</td>
											<td>${expert.tel}</td>
											<td><fmt:formatDate value="${expert.birthDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${expert.regDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${expert.createdAt}"
													pattern="yyyy-MM-dd" /></td>
											<td>
												<%-- <div class="btn-group mb-1">
													<div>
														<button onclick="infoClicked(`${expert}`)"
															data-bs-toggle="modal" data-bs-target="#modalContact"
															class="btn btn-outline-success view-detail" type="button">Info</button>
														<c:if test="${expert.status eq 1}">
															<button
																onclick="approveClicked(`${expert.advisorId}`,`${expert.email}`)"
																class="btn btn-success">승인</button>
															<button class="btn btn-danger" data-bs-toggle="modal"
																data-bs-target="#modal-refuse-contact"
																onclick="refuseClicked(`${expert.advisorId}`,`${expert.email}`)">반려</button>
														</c:if>
													</div>
												</div> --%>
												<div class="btn-group mb-1">
													<button type="button" class="btn btn-outline-success">Info</button>
													<button type="button"
														class="btn btn-outline-success dropdown-toggle dropdown-toggle-split"
														data-bs-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false" data-display="static">
														<span class="sr-only">Info</span>
													</button>

													<div class="dropdown-menu">
														<button onclick="infoClicked(`${expert}`)"
															data-bs-toggle="modal" data-bs-target="#modalContact"
															class="dropdown-item view-detail" type="button">정보</button>
														<c:if test="${expert.status eq 1}">
															<button
																onclick="approveClicked(`${expert.advisorId}`,`${expert.email}`)"
																class="dropdown-item">승인</button>
															<button data-bs-toggle="modal"
																data-bs-target="#modal-refuse-contact"
																onclick="refuseClicked(`${expert.advisorId}`,`${expert.email}`)"
																class="dropdown-item">반려</button>
														</c:if>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- page -->
						<div id="customPagenation">
							<!--시작 페이지 -->
							<c:choose>
								<c:when test="${page.paging.page>4}">
									<c:set var="startPage" value="${page.paging.page-4}" />
								</c:when>
								<c:otherwise>
									<c:set var="startPage" value="1" />
								</c:otherwise>
							</c:choose>

							<!-- 엔드 페이지 -->
							<c:choose>
								<c:when test="${page.endPage < page.paging.page+4}">
									<c:set var="endPage" value="${page.endPage}" />
								</c:when>
								<c:otherwise>
									<c:set var="endPage" value="${page.paging.page+4}" />
								</c:otherwise>
							</c:choose>

							<!-- 이전 버튼 -->
							<c:if test="${startPage ne 1}">
								<a class="page-a"
									style="display: inline-block; border: 1px solid lightgrey; padding: 4px 12px; margin: 1px; border-radius: 5px;"
									href="/admin/expert/${status}/${search}page/${page.paging.page-5}"> prev </a>
							</c:if>
							<!-- 페이지 넘버 반복문 -->
							<c:set var="nowPage" value="${startPage}" />
							<c:forEach begin="${startPage}" end="${endPage}">
								<c:choose>
									<c:when test="${page.paging.page eq nowPage}">
										<p class="page-a" id="customPageA"
											style="background-color: #3474D4; color: white; cursor: pointer; display: inline-block; border: 1px solid lightgrey; padding: 4px 12px; margin: 1px; border-radius: 5px;">
											<c:out value="${nowPage}" />
										</p>
									</c:when>
									<c:otherwise>
										<a class="page-a" id="customPageA"
											href="/admin/expert/${status}/${search}page/${nowPage}"
											style="display: inline-block; border: 1px solid lightgrey; padding: 4px 12px; margin: 1px; border-radius: 5px;">
											<c:out value="${nowPage}" />
										</a>
									</c:otherwise>
								</c:choose>
								<c:set var="nowPage" value="${nowPage+1}" />
							</c:forEach>
							<!-- 이후 버튼 -->
							<c:if test="${page.endPage >= startPage+9}">
								<c:choose>
									<c:when test="${page.endPage > page.paging.page+5}">
										<a class="page-a"
											style="display: inline-block; border: 1px solid lightgrey; padding: 4px 12px; margin: 1px; border-radius: 5px;"
											href="/admin/expert/${status}/${search}page/${page.paging.page+5}"> next </a>
									</c:when>
									<c:otherwise>
										<a class="page-a"
											style="display: inline-block; border: 1px solid lightgrey; padding: 4px 12px; margin: 1px; border-radius: 5px;"
											href="/admin/expert/${status}/${search}page/${page.endPage}"> next </a>
									</c:otherwise>
								</c:choose>
							</c:if>
						</div>
						<!-- 검색 div-->
						<form action="/admin/search-user" id="search-frm">
							<div class="search-form d-lg-inline-block">
								<div class="input-group" style="margin-top: 20px;">
									<input type="text" name="search" id="c-search-input"
										class="form-control" placeholder="유저 검색" autofocus
										autocomplete="off" style="border: 1px solid #ddd;" />
									<button type="button" id="search-btnn" class="btn btn-flat"
										style="border: 1px solid #ddd;">
										<i class="mdi mdi-magnify"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade modal-refuse-contact" id="modal-refuse-contact"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div style="border: none;">
					<div style="border: none;" class="modal-header px-4">
						<input id="refuseMsg"
							style="border: none; heigth: 70%; width: 80%;" type="text"
							placeholder="반려메시지 작성">
						<button onclick="modalConfirmClicked()" class="btn btn-primary">확인</button>
						<input id="hidden_email" type="hidden"> <input
							id="hidden_advisorId" type="hidden">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Content -->
</div>
<div class="modal fade modal-contact-detail" id="modalContact"
	tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg"
		role="document">
		<div class="modal-content">
			<div class="modal-header justify-content-end border-bottom-0">
				<button type="button" class="btn-edit-icon">
					<!-- data-bs-dismiss="modal"
										aria-label="Close"  modal close-->
				</button>
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
								<div style="width: 300px; height: 300px;"
									class="card-img mx-auto rounded-circle">
									<img id="modal-image" src="assets/img/user/u6.jpg"
										alt="user image" />
								</div>
								<div class="card-body">
									<h3 id="modal-username">John Devilo</h3>
								</div>
							</div>

							<div class="d-flex justify-content-center">
								<div style="width: 33%;">
									<h6 style="text-align: center;" class="text-dark pb-2">전문분야</h6>
									<div id="modal-speciality"
										style="word-wrap: break-word; text-align: center;"></div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div id="modal-portfolio-info" class="contact-info px-4">
							<h3 class="text-dark mb-1"></h3>
							<h4 style="font-weight: bold"
								class="text-dark font-weight-medium pt-4 mb-2">이력</h4>
							<h5 id="modal-career"></h5>
							<h4 style="font-weight: bold"
								class="text-dark font-weight-medium pt-4 mb-2">자기소개</h4>
							<h5 id="modal-introduction"></h5>
							<!-- <button class = "btn btn-primary btn-pill my-4">저장</button>
												<button class = "btn btn-primary btn-pill my-4">삭제</button> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Content Wrapper -->
<%@include file="/WEB-INF/view/layout/adminFooter.jsp"%>

<!-- custom Js -->
<script src="/resources/js/custom/adminExpert.js"></script>
<!-- <script src="/resources/js/custom/adminUser.js"></script> -->