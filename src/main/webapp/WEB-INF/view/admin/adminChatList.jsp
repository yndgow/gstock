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

.board-tb{
	width: 100%;
	text-align: center;
	margin: 20px auto;
}
.board-tb td{
	height: 40px;
}

.input-group select{
	border: 1px solid #ddd;
}
.input-group select:first-child{
	border-top-left-radius: 15px;
	border-bottom-left-radius: 15px;
}
.delete-btn{
	width: 100%; 
/* 	background-color: rgba(226,24,17,0.7); */
	border: 1px solid rgba(226,24,17,0.7); 
	border-radius: 5px; 
	color: rgba(226,24,17,0.7);
}
</style>
<div class="ec-content-wrapper">
	<div class="content">
		<div class="breadcrumb-wrapper breadcrumb-contacts">
			<div>
				<h1>Board List</h1>
				<p class="breadcrumbs">
					<span><a href="/admin/main">Main</a></span> <span><i
						class="mdi mdi-chevron-right"></i></span>Board
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="ec-vendor-list card card-default">
					<div class="card-body">
						<div class="table-responsive">
							<table class="board-tb">
					    		<tr>
					    			<td style="width: 5%;">번호</td>
					    			<td style="width: 80%;">주식명</td>
					    			<td style="width: 15%;">구독자 수</td>
					    		</tr>
						    	<c:forEach var="chat" items="${list}">
						    		<tr>
						    			<td>${chat.companyCode}</td>
						    			<td>
						    				<button id="subCheckBtn" 
						    						onclick="window.open('/chat?companyCode=${chat.companyCode}&companyName=${chat.companyName}&userId=${principal.id}', '_black', 'width= 480, height= 720, location=no')">
					    						${chat.companyName}
				    						</button>
						    			</td>
						    			<td>${chat.countUser}</td>
						    		</tr>
						    	</c:forEach>
					    	</table>
						</div>
						<!-- 검색 div-->
						<div>
							<!----------페이징 function -->
							<c:set var="search" value="/admin/chat?"/>
							<c:if test="${not empty paging.orderType}">
								<c:set var="search" value="${search}${'searchWord='}${paging.searchWord}&"/>
							</c:if>
							
							<form action="/admin/chat" id="search-frm">
								<div class="search-form d-lg-inline-block">
									<div class="input-group" style="margin-top: 20px;">
							    		<input class="form-control ec-search-bar" type="text" id="search-word" name="searchWord">
										<button type="button" id="search-btnn" onclick="adminBoardInit.searchValid()"
											class="btn btn-flat" style="border: 1px solid #ddd;">
											<i class="mdi mdi-magnify"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
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
									href="${search}page=${page.paging.page-5}"> prev </a>
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
										<a class="page-a" id="customPageA" href="${search}page=${nowPage}"
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
											href="${search}page=${page.paging.page+5}"> next </a>
									</c:when>
									<c:otherwise>
										<a class="page-a"
											style="display: inline-block; border: 1px solid lightgrey; padding: 4px 12px; margin: 1px; border-radius: 5px;"
											href="${search}page=${page.endPage}"> next </a>
									</c:otherwise>
								</c:choose>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Content -->
</div>
<!-- End Content Wrapper -->
<%@include file="/WEB-INF/view/layout/adminFooter.jsp"%>

<!-- custom Js -->
<script src="/resources/js/custom/common.js"></script>
<script src="/resources/js/custom/adminBoardList.js"></script>
<script src="/resources/js/custom/subscribe.js"></script>

