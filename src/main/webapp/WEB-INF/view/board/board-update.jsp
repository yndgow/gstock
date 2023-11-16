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
 
     <!-- Custom css -->
     <link rel="stylesheet" href="/resources/css/custom/boardWrite.css" />
     
 </head>
<body class="blog_page">

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
								<li class="ec-breadcrumb-item active">게시글 수정</li>
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
                        		<form method="post" action="/board/board-update" id="board-write-frm">
	                        		<table class="write-tb">
	                        			<tr>
	                        				<td>
	                        					<select id="category-select" name="categoryId">
	                        					<c:forEach var="cateName" items="${cate}" varStatus="status">
	                        						<c:choose>
	                        							<c:when test="${status.count eq board.categoryId}">
			                        						<option value="${status.count}" selected>${cateName}</option>
	                        							</c:when>
	                        							<c:otherwise>
			                        						<option value="${status.count}">${cateName}</option>
	                        							</c:otherwise>
	                        						</c:choose>
	                        					</c:forEach>
	                        					</select>
	                        				</td>
	                        				<td>
	                        					<input type="text" id="title-input" name="title" value="${board.title}">
	                        					<input type="hidden" name="id" value="${board.id}">
											</td>
	                        			</tr>
	                        			<tr>
	                        				<td style="height: 56px;">작성자</td>
	                        				<td>
	                        					${principal.userName}
	                        					<input type="hidden" name="userId" value="${principal.id}">
											</td>
	                        			</tr>
	                        			<tr>
	                        				<td colspan="2" style="padding: 20px;height: 600px;">
	                        					<textarea id="summernote" name="content">${board.content}</textarea>
											</td>
	                        			</tr>
	                        			<tr>
	                        				<td colspan="2">
	                        					<button type="button" class="btn btn-primary" id="update-submit-btn" onclick="boardWriteInit.submit()">저장</button>
	                        					<button type="button" class="custom-btn btn-1" onclick="history.back()">취소</button>
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


	<script>
	$('#summernote').summernote({
  	  tabsize: 1,
  	  height: 500,
  	  disableResizeEditor: true
  	});
	$(function(){
		$("#update-submit-btn").on("click", function(){
			if($("#category-select").val()==null){
				alert("카테고리를 선택해주세요");
	    		$('#category-select').focus();
			}else if($('#title-input').val().replace(/\s/gi, '').length==0){
	    		$('#title-input').val('');
	    		alert("제목을 입력해주세요");
	    		$('#title-input').focus();
			}else if($('#summernote').val().replace(/\s/gi, '').length==0){
	    		$('#summernote').val('');
	    		alert("내용을 입력해주세요");
	    		$('#summernote').focus();
	    	}else{
	    		if(confirm("해당 내용으로 글을 수정하시겠습니까?")){
		    		$("#board-write-frm").submit();
	    		}
	    	}
		})
	})
	</script>
</body>

</html>