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
	min-height: 500px;
	text-align: center;
	margin: 20px auto;
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
<html>
<body>
<div class="ec-content-wrapper"></div>
	<div class="content">
		<div class="breadcrumb-wrapper breadcrumb-contacts">
			<div>
				<h1>공지사항</h1>
				<p class="breadcrumbs">
					<span>
					<a href="/admin/main">Main</a>
					</span>
					<i class="mdi mdi-chevron-right">Notice</i>
				</p>
			</div>
		</div>
				<!-- 검색페이지 시작 -->
	<div class="container">
	    <div class="row">                    
	        <form id="searchForm" action="/notice/admin/list" method="get">        
	            <div class="font-size">
	                <p class="breadcrumbs"></p>
	            </div>                                                                                            
	            <h2 style="width: 100%; text-align: center;">공지사항</h2>
	            <!--  검색 영역 시작 -->
	            <div class="search-container" style="text-align: center; margin: 0 auto; height: 100px; width: 600px; display: flex; justify-content: center; align-items: center;">                                                                                                                              
	                <select class="custom-select" style="margin: 19px;height: 40px;width: 150px;">
	                    <option value="select" disabled="disabled" selected="selected">선택</option>
	                    <option value="searchTitle">제목</option>                                    
	                </select>                                   
	                <input id="searchInput" type="text" class="form-control" placeholder="검색어 입력" name="noticeTitle" maxlength="100" style="margin-right: 10px;">                              
	                <button type="submit" class="btn btn-success" style="text-align: center; width: 100px; height: 42px;">검색</button>                                      
	            </div>    	                                                               
	        </form>
	    </div> 	    
	</div>
				<!-- 검색페이지 종료 -->
				<!-- 게시글 리스트 시작  -->
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card card-default">
						<div class="card-body">
							<div class="table-responsive">
								<div id="responsive-data-table_wrapper"
									class="dataTables_wrapper dt-bootstrap5 no-footer">
									<div class="row justify-content-between top-information">
										<div class="dataTables_length"
											id="responsive-data-table_length"></div>
										<div id="responsive-data-table_filter"
											class="dataTables_filter"></div>
									</div>
									<table id="responsive-data-table"
										class="table dataTable no-footer" style="width: 100%;"
										aria-describedby="responsive-data-table_info">
										<thead>
											<tr>
												<th class="noticeId" tabindex="0"
													aria-controls="responsive-data-table" rowspan="1"
													colspan="1" aria-sort="ascending"
													aria-label="Product: activate to sort column descending"
													style="text-align: center;">번호</th>
											<th class="notice-Title" tabindex="0"
												    aria-controls="responsive-data-table" rowspan="1"
												    colspan="1"
												    aria-label="Name: activate to sort column ascending"
												    style="text-align: center; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
												    제목
												</th>

												<th class="notice-userId" tabindex="0"
													aria-controls="responsive-data-table" rowspan="1"
													colspan="1"
													aria-label="Offer: activate to sort column ascending"style="text-align: center;">작성자</th>
												<th class="notice-Created" tabindex="0"
													aria-controls="responsive-data-table" rowspan="1"
													colspan="1"
													aria-label="Purchased: activate to sort column ascending"style="text-align: center;">공개/비공개</th>
												<th class="notice-Created" tabindex="0"
													aria-controls="responsive-data-table" rowspan="1"
													colspan="1"
													aria-label="Purchased: activate to sort column ascending"style="text-align: center;">작성일</th>
												<th class="sorting" tabindex="0" aria-controls="responsive-data-table" rowspan="1" colspan="1" aria-label="Stock: activate to sort column ascending" style="text-align: center;width: 100px;">조회수</th>
											</tr>
										</thead>
										<tbody>
										
											<c:forEach items="${noticeList}" var="notice" varStatus = "status">
												<tr class="Noticeboard-list">
													<td style="width: 10%; text-align: center;">${total - status.index - (pagination.currentPage -1) * 10 }</td>
													<td style="text-align: center; width: 40%; white-space: nowrap; overflow: hidden;">
													  <a href="/notice/admin/view/${notice.id}" style="color: #000000; display: inline-block; max-width: 100%;">${notice.noticeTitle}</a>
													</td>
													<td style="text-align: center; width:10%;">관리자</td>
													<td style="text-align: center; width:10%;">${notice.noticeState}</td>																																																								
													<c:set var ="noticeUpdated" value="${notice.noticeUpdated}"/>																									
												<c:if test="${not empty noticeUpdated}">
												  <td style="text-align: center; width: 10%;">
												    <fmt:formatDate value="${noticeUpdated}" pattern="yyyy-MM-dd" />
												  </td>
												</c:if>
													<td style="text-align: center; width:10%;">${notice.hitCount}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>																							
									<!-- 게시글 리스트 종료  -->
									<!-- 작성 하기 기능으로 이동  -->
									<div class="write" style="text-align: right">	
										<a href="/notice/admin/write" class="btn btn-primary"
											style="display: inline-block; vertical-align: inherit; text-align: center; font-weight: bold; color: white;">작성하기</a>																																																																																																
												
												<!-- 페이징 부분-->										
											<div class="ec-pro-pagination" style="display: flex; text-align: center;">
					                            <span>Showing ${pagination.start}-${pagination.end} 전채 ${pagination.totalCount} 개</span>
					                                	<a class="next" href="/notice/admin/list?page=${pagination.currentPage -1}"><i class="ecicon eci-angle-left"></i></a>
					                            <ul class="ec-pro-pagination-inner" style="display: flex; text-align: center;">
					                                <c:if test="${pagination.prevPageGroup}">
					                                	<li>
					                                	</li>
					                               	</c:if>
					                            
					                            	<c:forEach var="num" begin="${pagination.startPageGroup}" end="${pagination.endPageGroup}">
					                                <li>
					                                <a style="display: flex; justify-content: center;" class="${num eq pagination.currentPage ? 'active' : ''}" href="/notice/admin/list?page=${num}">${num}</a>
					                                </li>
					                                </c:forEach>
					                                <c:if test="${pagination.nextPageGroup}">
					                                	<li><a class="next" href="/notice/admin/list?page=${pagination.currentPage + 1}">Next <i class="ecicon eci-angle-right"></i></a></li>
					                               	</c:if>
					                            </ul>
					                        </div>
					                        <!--페이징 부분 종료  -->																		
									</div>	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>			
		</body>
	</html>
<%@include file="/WEB-INF/view/layout/adminFooter.jsp"%>