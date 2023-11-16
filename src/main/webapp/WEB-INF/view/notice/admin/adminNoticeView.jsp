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
        <!-- Header responsive Bottom  End -->        
        <!-- Ec Main Menu End -->	
	<div class="content container" style="width : 50%;">
		<div class="breadcrumb-wrapper breadcrumb-contacts">
			<div>
				<h1>공지사항</h1>
				<p class="breadcrumbs">
					<span><a href="/admin/main">Main</a></span> <span><i
						class="mdi mdi-chevron-right"></i></span>Notice 
						<i class="mdi mdi-chevron-right"></i><span>View</span>
				</p>
			</div>
		</div>
			<div class="row">
			<div class="col-12">
				<div class="card card-default" style="width: 900px">					
					<div class="card-body" style="width:900px" >
						<h4 style="border-left: 12px solid ;border-bottom: 3px solid; color: #808080;">${view.noticeTitle}</h4> 						
						<fmt:formatDate value="${view.noticeCreated}" pattern="yyyy-MM-dd-mm" var="formattedDate" />
						<p style="border-bottom: 2px solid #ccc;">${formattedDate}</p>						
						<p style="border-bottom: 2px solid #ccc;">조회수:${view.hitCount}</p>					
						<p><textarea readonly="readonly" style ="width: 852px; height: 26em; border: none; resize: none; border-bottom: 2px solid #ccc;">${view.noticeContent}</textarea></p>
						<table class="table-responsive">
						    <tr>
					      	<td><a href = "/notice/admin/update/${view.id}" class="btn btn-primary" style="margin :5px">수정하기</a></td>
					      	<td><a href = "/notice/admin/delete/${view.id}" class="btn btn-primary" style="margin :5px">삭제하기</a></td>
					          <td><a href = "/notice/admin/list" class="btn btn-primary" style="margin :5px">목록으로</a></td>
					      	</tr>							  
						</table>														 							   			
						</div>
					</div>
				</div>
			</div>	
			</div>
</body>	
</html>
<%@include file="/WEB-INF/view/layout/adminFooter.jsp"%>