<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta name="description" content="Ekka - Admin Dashboard HTML Template.">

		<title>Green Stock</title>
		
		<!-- Ekka CSS -->
		<link id="ekka-css" rel="stylesheet" href="/resources/css/ekka.css" />
		
		<!-- FAVICON -->
		<link href="/resources/img/favicon.png" rel="shortcut icon" />
		
		<style>
			.board-tb{
				width: 90%;
				border: 1px solid #eee;
				margin: 30px auto;
				text-align: center;
			}
			.board-tb td{
				height: 50px;
			}
			.board-content{
				max-width: 200px; 
				text-align: left;
				overflow: hidden; 
				white-space: nowrap; 
				text-overflow: ellipsis;
			}
			.page-div{
				width: 90%;
				margin: auto;
				display: flex;
				justify-content: center;
			}
			.page-a{
				padding: 5px 10px;
			}
		</style>
	</head>
	
	<body class="sign-inup" id="body">
	<%@include file="/WEB-INF/view/layout/header.jsp"%>
		<!-- start of main  -->
		<div class="container d-flex align-items-center justify-content-center form-height pt-24px pb-24px">
		    <div class="row justify-content-center">
		      <div class="col-lg-4 col-md-10" style="width: 600px;">
		        <div class="card">
		          <div class="card-header bg-primary">
		            <div class="ec-brand">
		              <a href="/main" title="Ekka">
		                <img class="ec-brand-icon" src="/resources/img/G_logo_white.jpg" alt="" />
		              </a>
		            </div>
		          </div>
		          <div class="card-body p-3">
		          	<h5 style="text-align: center;">나의 게시글 목록</h5>
		          	<div style="display: flex; justify-content: space-between;">
		          		<a href="/user/my-info">목록으로</a>
		          		<a href="/user/my-reply">나의 댓글 목록</a>
		          	</div>
					<table class="board-tb">
						<thead>
							<tr>
								<td style="width: 60px;">글번호</td>
								<td colspan="2" style="min-width: 80px;">제목</td>
								<td style="width: 60px;">등록일</td>
								<td style="width: 60px;">조회수</td>
								<td style="width: 60px;">추천수</td>
							</tr>
						</thead>
	
						<tbody>
							<c:forEach var="board" items="${boardList}">
								<c:choose>
									<c:when test="${board.recommand >= 2}">
										<tr style="background-color: #fee; font-weight: 500;">
									</c:when>
									<c:otherwise>
										<tr>
									</c:otherwise>
								</c:choose>
								<td>${board.id}</td>
								<td style="width: 50px;"><c:forEach
										var="c" items="${cate}" varStatus="status">
										<c:choose>
											<c:when
												test="${board.categoryId eq status.count && board.categoryId eq 1}">
												<span
													style="border: 1px solid skyblue; padding: 3px 5px; border-radius: 5px; color: skyblue;">
													${c} </span>
											</c:when>
											<c:when
												test="${board.categoryId eq status.count && board.categoryId eq 2}">
												<span
													style="border: 1px solid orange; padding: 3px 5px; border-radius: 5px; color: orange;">
													${c} </span>
											</c:when>
											<c:when
												test="${board.categoryId eq status.count && board.categoryId eq 3}">
												<span
													style="border: 1px solid green; padding: 3px 5px; border-radius: 5px; color: green;">
													${c} </span>
											</c:when>
										</c:choose>
									</c:forEach></td>
								<td class="board-content"><a
									href="/board/detail?boardId=${board.id}"> ${board.title} <c:if
											test="${board.reply ne 0}">
											<span style="color: #bbb;">[${board.reply}]</span>
										</c:if>
								</a></td>
								<td><fmt:formatDate value="${board.date}"
										pattern="MM-dd" /></td>
								<td>${board.views}</td>
								<td>${board.recommand}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			    	<div class="page-div">
		<!-- 	    		시작 페이지 -->
			    		<c:choose>
			    			<c:when test="${page.paging.page>4}">
				    			<c:set var="startPage" value="${page.paging.page-4}"/>
			    			</c:when>
			    			<c:otherwise>
				    			<c:set var="startPage" value="1"/>
			    			</c:otherwise>
			    		</c:choose>
		
		<!-- 				엔드 페이지	    		 -->
			    		<c:choose>
			    			<c:when test="${page.endPage < page.paging.page+4}">
				    			<c:set var="endPage" value="${page.endPage}"/>
			    			</c:when>
			    			<c:otherwise>
				    			<c:set var="endPage" value="${page.paging.page+4}"/>
			    			</c:otherwise>
			    		</c:choose>
		
		<!-- 	    		이전 버튼 -->
			    		<c:if test="${startPage ne 1}">
			    			<a class="page-a" href="my-board?page=${page.paging.page-5}">
			    				prev
			    			</a>
			    		</c:if>
		<!-- 	    		페이지 넘버 반복문 -->
			    		<c:set var="nowPage" value="${startPage}"/>
			    		<c:forEach begin="${startPage}" end="${endPage}">
			    			<c:choose>
			    				<c:when test="${page.paging.page eq nowPage}">
			    					<p class="page-a" style="background-color: #3474D4; color: white; cursor: pointer;">
						    			<c:out value="${nowPage}"/>
			    					</p>
			    				</c:when>
			    				<c:otherwise>
			    					<a class="page-a" href="my-board?page=${nowPage}">
						    			<c:out value="${nowPage}"/>
			    					</a>
			    				</c:otherwise>
			    			</c:choose>
			    			<c:set var="nowPage" value="${nowPage+1}"/>
			    		</c:forEach>
		<!-- 	    		이후 버튼 -->
			    		<c:if test="${page.endPage > startPage+9}">
			    			<c:choose>
			    				<c:when test="${page.endPage > page.paging.page+5}">
					    			<a class="page-a" href="my-board?page=${page.paging.page+5}">
					    				next
					    			</a>
			    				</c:when>
			    				<c:otherwise>
					    			<a class="page-a" href="my-board?page=${page.endPage}">
					    				next
					    			</a>
			    				</c:otherwise>
			    			</c:choose>
			    		</c:if>
			    	</div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		<!-- end of main  -->
		<%@include file="/WEB-INF/view/layout/footer.jsp"%>
		<!-- Javascript -->
		<!-- custom Js -->
		<script src="/resources/js/custom/common.js"></script>
		<script src="/resources/js/custom/modifyUser.js"></script>
		
		<script src="/resources/plugins/jquery/jquery-3.5.1.min.js"></script>
		<script src="/resources/js/bootstrap.bundle.min.js"></script>
		<script src="/resources/plugins/jquery-zoom/jquery.zoom.min.js"></script>
		<script src="/resources/plugins/slick/slick.min.js"></script>
	
		<!-- Ekka Custom -->	
		<script src="/resources/js/ekka.js"></script>
	</body>
</html>