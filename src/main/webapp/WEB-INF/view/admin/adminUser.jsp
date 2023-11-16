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
				<h1>유저 목록</h1>
				<p class="breadcrumbs">
					<span><a href="index.html">메인</a></span> <span><i
						class="mdi mdi-chevron-right"></i></span>유저
				</p>
			</div>
			<div>
				<button type="button" class="btn btn-danger" data-bs-toggle="modal"
					data-bs-target="#addUser">회원 정지</button>
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
										<th>휴대전화</th>
										<th>생년월일</th>
										<th>가입일</th>
										<th>정지기간</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="user" items="${userList}">
										<tr>
											<td>${user.userName}</td>
											<td>${user.email}</td>
											<td>${user.tel}</td>
											<td><fmt:formatDate value="${user.birthDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${user.regDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${user.suspensionEndDate}"
													pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 검색 div-->
						<form action="/admin/search-user" id="search-frm">
							<div class="search-form d-lg-inline-block">
								<div class="input-group" style="margin-top: 20px;">
									<input type="text" name="search" id="c-search-input"
										class="form-control" placeholder="유저 검색" autofocus
										autocomplete="off" style="border: 1px solid #ddd;"/>
									<button type="button" id="search-btnn"
										class="btn btn-flat" style="border: 1px solid #ddd;">
										<i class="mdi mdi-magnify"></i>
									</button>
								</div>
							</div>
						</form>
						<!--페이징 div -->
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
									href="user?page=${page.paging.page-5}"> prev </a>
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
										<a class="page-a" id="customPageA" href="user?page=${nowPage}"
											style="display: inline-block; border: 1px solid lightgrey; padding: 4px 12px; margin: 1px; border-radius: 5px;">
											<c:out value="${nowPage}" />
										</a>
									</c:otherwise>
								</c:choose>
								<c:set var="nowPage" value="${nowPage+1}" />
							</c:forEach>
							<!-- 이후 버튼 -->
							<c:if test="${page.endPage > startPage+9}">
								<c:choose>
									<c:when test="${page.endPage > page.paging.page+5}">
										<a class="page-a"
											style="display: inline-block; border: 1px solid lightgrey; padding: 4px 12px; margin: 1px; border-radius: 5px;"
											href="user?page=${page.paging.page+5}"> 다음 </a>
									</c:when>
									<c:otherwise>
										<a class="page-a"
											style="display: inline-block; border: 1px solid lightgrey; padding: 4px 12px; margin: 1px; border-radius: 5px;"
											href="user?page=${page.endPage}"> 다음 </a>
									</c:otherwise>
								</c:choose>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- modal -->
	<div class="modal fade modal-add-contact" id="addUser" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<form action="/admin/suspended" method="post">
					<div class="modal-header px-4">
						<h5 class="modal-title" id="exampleModalCenterTitle">Account
							suspension</h5>
					</div>

					<div class="modal-body px-4">
						<div class="row mb-2">
							<div class="col-lg-12">
								<div class="form-group">
									<label for="firstName">유저이름</label> <input type="text"
										class="form-control" id="suspensionDate" name="userName"
										placeholder="username">
								</div>
								<div class="form-group">
									<label for="firstName">정지기간</label> <input type="number"
										class="form-control" id="suspensionDate" name="suspendDate"
										placeholder="ex : 30(단위 일)">
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer px-4">
						<button type="button" class="btn btn-secondary btn-pill"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" id = "suspend=btn" class="btn btn-primary btn-pill">정지하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- End Content -->
</div>
<!-- End Content Wrapper -->
<%@include file="/WEB-INF/view/layout/adminFooter.jsp"%>

<!-- custom Js -->
<script src="/resources/js/custom/common.js"></script>
<script src="/resources/js/custom/adminUser.js"></script>

