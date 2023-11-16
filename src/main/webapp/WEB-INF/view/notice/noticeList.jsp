<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/view/layout/header.jsp"%> 
<html>
<body>
<header>
<script type="text/javascript">



</script>

		<!-- Ec Main Menu End -->
		<div class="content container">
			<div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">				
				<!-- 검색페이지 시작 -->
				<div class="container">
					<div class="row">					
						<form method="get"action="/notice/list">		
										<div class="font-size">
							<p class="breadcrumbs"></p>
								<i class="mdi mdi-chevron-right"> </i>
									</div>	
							<h2 style="width: 100%; text-align: center;">공지사항</h2>
							<div class="search-container" style="
							text-align: center;
							margin: 0 auto;							
							height: 100px;
							width: 600px;
							display: flex;
							justify-content: center;
							align-items: center;">						
							<select class="custom-select" style="margin: 19px;height: 40px;width: 150px;">
		                    <option value="select" disabled="disabled" selected="selected">선택</option>
		                    <option value="searchTitle">제목</option>                                    
		                	</select>															  
							    <input type="text" class="form-control" placeholder="검색어 입력" name="noticeTitle" maxlength="100" style="margin-right: 10px;">
							    <button type="submit" class="btn btn-success" style="
							    text-align: center;
							    width: 100px;
							    height: 50px;">검색</button>							   
							</div>
							
						</form>
					</div>	
				</div>
				<!-- 검색페이지 종료 -->
			</div>
			<div class="row">
				<div class ="col-12">		
				<div class ="clean-div">					
				<div class="detail-attr detail-writer">				
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
										class="table dataTable no-footer" style="width: 100%; "
										aria-describedby="responsive-data-table_info">
										<thead>
											<tr style="text-align: center; background-color: #f2f2f2; font-weight: bold;">
										    <th class="noticeId" tabindex="0" aria-controls="responsive-data-table" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Product: activate to sort column descending">번호</th>
										    <th class="notice-Title" tabindex="0" aria-controls="responsive-data-table" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending">제목</th>
										    <th class="notice-userId" tabindex="0" aria-controls="responsive-data-table" rowspan="1" colspan="1" aria-label="Offer: activate to sort column ascending" style="text-align: center;">작성자</th>
										    <th class="notice-Created" tabindex="0" aria-controls="responsive-data-table" rowspan="1" colspan="1" aria-label="Purchased: activate to sort column ascending" style="text-align: center;">작성일</th>
										    <th class="sorting" tabindex="0" aria-controls="responsive-data-table" rowspan="1" colspan="1" aria-label="Stock: activate to sort column ascending" style="text-align: center;">조회수</th>
										</tr>		
										</thead>
										<tbody>
										
											<c:forEach items="${noticeList}" var="notice" varStatus="status">
												<tr class="Noticeboard-list">
													<!-- <img class="tbl-thumb"></td> -->
													<td style="width: 10%; text-align: center;">${total - status.index - (pagination.currentPage -1) * 10 }</td>											
													<td style="width: 40%;"><a href="/notice/view/${notice.id}">${notice.noticeTitle}</a></td>
													<td style="width: 10%; text-align: center;">관리자</td>																																						
												<c:set var ="noticeUpdated" value="${notice.noticeUpdated}"/>																									
												<c:if test="${not empty noticeUpdated}">
												  <td style="text-align: center; width: 10%;">
												    <fmt:formatDate value="${noticeUpdated}" pattern="yyyy-MM-dd" />
												  </td>
												</c:if>																																	
													<td style="width: 10%; text-align: center;" >${notice.hitCount}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>																											
									<p>${notice.noticeState}</p>
									<!-- 페이징 시작 -->
									<div id = "paging">
										<div class="ec-pro-pagination">	
					                            <span>Showing ${pagination.start}-${pagination.end} 전체 ${pagination.totalCount}개</span>


					                            <ul class="ec-pro-pagination-inner">
					                                <c:if test="${pagination.prevPageGroup}">
					                                	<li>
					                                	<a class="next" href="/notice/list?page=${pagination.currentPage - 1}">Prev <i class="ecicon eci-angle-left"></i></a>
					                                	</li>
					                               	</c:if>
					                            
					                            	<c:forEach var="num" begin="${pagination.startPageGroup}" end="${pagination.endPageGroup}">
					                                <li>
					                                <a class="${num eq pagination.currentPage ? 'active' :  ''}" href="/notice/list?page=${num}">${num}</a>
					                                </li>
					                                </c:forEach>
					                                <c:if test="${pagination.nextPageGroup}">
					                                	<li><a class="next" href="/notice/list?page=${pagination.currentPage -1}">Next <i class="ecicon eci-angle-right"></i></a></li>
					                               	</c:if>
					                            </ul>
					                        </div>
									</div>
									</div>
								</div>
							</div>							
						</div>
					</div>
				</div>		
		</header>		
</body>
</html>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>