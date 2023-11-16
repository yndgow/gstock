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
	height: 50px;
}
.board-tb tr:first-child{
	background-color: #f7f7f7; 
	height: 50px; 
	border-bottom: 1px solid lightgrey;
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
					    			<td style="width: 10%;">카테고리</td>
					    			<td style="width: 40%;">제목</td>
					    			<td style="width: 10%;">작성자</td>
					    			<td style="width: 15%;">날짜</td>
					    			<td style="width: 8%;">조회수</td>
					    			<td style="width: 6%;">추천</td>
					    			<td style="width: 6%;">삭제</td>
					    		</tr>
						    	<c:forEach var="board" items="${list}">
						    		<tr>
						    			<td>${board.id}</td>
						    			<td>
						    				<c:forEach var="c" items="${cate}" varStatus="status">
				           						<c:choose>
					           						<c:when test="${board.categoryId eq status.count && board.categoryId eq 1}">
					           							<span style="border: 1px solid skyblue; padding: 3px 5px; border-radius: 5px; color: skyblue;">
					           								${c}
				           								</span>
					           						</c:when>
					           						<c:when test="${board.categoryId eq status.count && board.categoryId eq 2}">
					           							<span style="border: 1px solid #ffc107; padding: 3px 5px; border-radius: 5px; color: #ffc107;">
					           								${c}
				           								</span>
					           						</c:when>
					           						<c:when test="${board.categoryId eq status.count && board.categoryId eq 3}">
					           							<span style="border: 1px solid #2ab674; padding: 3px 5px; border-radius: 5px; color: #2ab674;">
					           								${c}
				           								</span>
					           						</c:when>
				           						</c:choose>
				           					</c:forEach>
										</td>
						    			<td>
						    				<a href="/board/detail?boardId=${board.id}">${board.title}
							    				<c:if test="${board.reply ne 0}">
							    					<span style="color: #bbb;">[${board.reply}]</span>
							    				</c:if>
						    				</a>
					    				</td>
						    			<td>${board.userName}</td>
						    			<td>
						    				<fmt:formatDate value="${board.date}" pattern="MM-dd HH:mm:ss"/>
						   				</td>
						    			<td>${board.views}</td>
						    			<td>${board.recommand}</td>
						    			<td>
						    				<form method="post" id="admin-board-delete-frm-${board.id}" action="/admin/board-delete">
						    					<input type="hidden" name="id" value="${board.id}">
							    				<button type="button" onclick="adminBoardInit.boardDelete(${board.id})"
							    						class="delete-btn">
							    				Del
							    				</button>
						    				</form>
						    			</td>
						    		</tr>
						    	</c:forEach>
					    	</table>
						</div>
						<!-- 검색 div-->
						<div>
							<!------검색 상태 표시 -->
							<c:if test="${not empty paging.orderType}">
								<c:if test="${paging.orderType eq 'views'}">
										<c:out value='[조회순] '/>
								</c:if>
								<c:if test="${paging.orderType eq 'recommand'}">
										<c:out value='[추천순] '/>
								</c:if>
								<c:if test="${paging.orderType eq 'reply'}">
										<c:out value='[댓글순] '/>
								</c:if>
							</c:if>
							<c:if test="${not empty paging.searchType}">
								<c:if test="${paging.searchType eq 'title'}">
										<c:out value='[제목]'/>
								</c:if>
								<c:if test="${paging.searchType eq 'content'}">
										<c:out value='[내용]'/>
								</c:if>
								<c:if test="${paging.searchType eq 'userName'}">
										<c:out value='[작성자]'/>
								</c:if>
							</c:if>
							<c:if test="${not empty paging.searchWord}">
										<c:out value='[\"${paging.searchWord}\"]'/>
							</c:if>
							<c:if test="${not empty paging.orderType ||
										  not empty paging.searchType ||
										  not empty paging.searchWord}">
										  에 대한 검색 결과
							</c:if>
							<!--  -->
							<!----------페이징 function -->
							<c:set var="search" value="/admin/board?"/>
							<c:if test="${not empty paging.searchType}">
								<c:set var="search" value="${search}${'searchType='}${paging.searchType}&"/>
							</c:if>
							<c:if test="${not empty paging.searchWord}">
								<c:set var="search" value="${search}${'searchWord='}${paging.searchWord}&"/>
							</c:if>
							<c:if test="${not empty paging.orderType}">
								<c:set var="search" value="${search}${'orderType='}${paging.orderType}&"/>
							</c:if>
							
							<form action="/admin/board" id="search-frm">
								<div class="search-form d-lg-inline-block">
									<div class="input-group" style="margin-top: 20px;">
							    			<select name="orderType">
							    				<option value="id">기본</option>
							    				<option value="views">조회순</option>
							    				<option value="recommand">추천순</option>
							    				<option value="reply">댓글순</option>
							    			</select>
							    			<select name="searchType">
							    				<option value="title">제목</option>
							    				<option value="content">내용</option>
							    				<option value="userName">작성자</option>
							    			</select>
							    		<input class="form-control ec-search-bar" type="text" id="search-word" name="searchWord" style="border: 1px solid #ddd;">
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

