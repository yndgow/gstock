<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
 <html lang="en">
 
 <head>
     <meta charset="UTF-8">
     <meta http-equiv="x-ua-compatible" content="ie=edge" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
 
     <title>Green Stock</title>
     <meta name="keywords"
         content="apparel, catalog, clean, ecommerce, ecommerce HTML, electronics, fashion, html eCommerce, html store, minimal, multipurpose, multipurpose ecommerce, online store, responsive ecommerce template, shops" />
     <meta name="description" content="Best ecommerce html template for single and multi vendor store.">
     <meta name="author" content="ashishmaraviya">
 
<!--      Custom css -->
     <link rel="stylesheet" href="/resources/css/custom/boardWrite.css" />
     
     
<!--Header -->
    <%@include file="/WEB-INF/view/layout/header.jsp"%>
	
	<div class="sticky-header-next-sec ec-breadcrumb section-space-mb" style="display: block">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="row ec_breadcrumb_inner">
						<div class="col-md-6 col-sm-12">
							<h2 class="ec-breadcrumb-title">게시글</h2>
						</div>
						<div class="col-md-6 col-sm-12">
						<!-- ec-breadcrumb-list start -->
							<ul class="ec-breadcrumb-list">
								<li class="ec-breadcrumb-item"><a href="/main">메인</a></li>
								<li class="ec-breadcrumb-item"><a href="/board/list">게시판</a></li>
								<li class="ec-breadcrumb-item active">게시글 작성</li>
							</ul>
						<!-- ec-breadcrumb-list end -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
    <!-- Ec Blog page -->
    <section class="ec-page-content section-space-p">
        <div class="container">
            <div class="row">
                <div class="ec-blogs-rightside col-lg-12 col-md-12">

                    <!-- Blog content Start -->
                    <div class="ec-blogs-content">
                        <div class="ec-blogs-inner">
                        	<div class="board-content">
                        		<form method="post" action="board-write" id="board-write-frm">
	                        		<table class="write-tb">
	                        			<tr>
	                        				<td>
	                        					<div class="write-select">
		                        					<select id="category-select" name="categoryId">
		                        						<option value="" disabled="disabled" selected="selected">- 카테고리 -</option>
		                        					<c:forEach var="cateName" items="${cate}" varStatus="status">
		                        						<option value="${status.count}">${cateName}</option>
		                        					</c:forEach>
		                        					</select>
	                        					</div>
	                        				</td>
	                        				<td>
	                        					<input type="text" id="title-input" name="title" placeholder="제목을 입력해주세요">
											</td>
	                        				<td style="height: 56px;">작성자 : 
	                        					${principal.userName}
	                        					<input type="hidden" name="userId" value="${principal.id}">
											</td>
	                        			</tr>
	                        			<tr>
<!-- 	                        				<td>내용</td> -->
	                        				<td colspan="3" style="padding: 30px 0px; height: 500px;">
	                        					<textarea id="summernote" name="content" placeholder="내용을 입력해주세요"></textarea>
	                        					
											</td>
	                        			</tr>
	                        			<tr>
	                        				<td colspan="3">
	                        					<button type="button" class="btn btn-primary" id="write-submit-btn" onclick="boardWriteInit.submit()">저장</button>
	                        					<button type="button" class="btn btn-danger" style="background-color: #aaa" onclick="history.back()">취소</button>
	                        				</td>
	                        			</tr>
	                        		</table>
                        		</form>
                        		
                        	</div>
                        </div>
                    </div>
                    <!--Blog content End -->
                </div>
            </div>
        </div>
    </section>

	<%@include file="/WEB-INF/view/layout/footer.jsp"%>

    <!-- Main Js -->
    <script src="/resources/js/vendor/index.js"></script>
    <script src="/resources/js/main.js"></script>
    
    <!-- Custom Js -->
    <script src="/resources/js/custom/boardWrite.js"></script>
    
    <script>
		$('#summernote').summernote({
	  	  tabsize: 1,
	  	  height: 300
	  	});
	</script>
</body>

</html>