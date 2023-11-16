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
			.rep-tb{
				width: 90%;
				border: 1px solid #777;
				margin: auto;
				text-align: center;
			}
			.rep-tb td{
				height: 50px;
			}
			.rep-content{
				max-width: 200px; 
				text-align: left;
				overflow: hidden; 
				white-space: nowrap; 
				text-overflow: ellipsis;
			}
			.board-tb{
				width: 90%;
				border: 1px solid #777;
				margin: auto;
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
			
			.count-div{
				width: 90%;
				margin: 50px auto;
				text-align: center;
				border: 1px solid #eee;
				display: flex;
				justify-content: center;
			}
			.count-div div{
				width: 50%;
				height: 200px;
				padding: 30px;
				cursor: pointer;
			}
			.count-div div:hover{
				background-color: #f7f7f7;
			}
			.count-div div span{
				font-size: 50px;
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
		          	<h5 style="text-align: center;">${principal.userName} 님 환영합니다</h5>
		          	
		          	<div class="count-div">
		          		<div onclick="location.href='/user/my-board'">
		          			총 게시글 수<br><br>
		          			<span class="count-board">
		          				<fmt:formatNumber pattern="#,###">${boardSize}</fmt:formatNumber>
	          				</span>
		          		</div>
		          		<div onclick="location.href='/user/my-reply'">
		          			총 댓글 수<br><br>
		          			<span class="count-reply">
		          				<fmt:formatNumber pattern="#,###">${replySize}</fmt:formatNumber>
	          				</span>
		          		</div>
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