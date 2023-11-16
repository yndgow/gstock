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

<!-- GOOGLE FONTS -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@400;500;700;900&display=swap"
	rel="stylesheet">

<!-- Ekka CSS -->
<link id="ekka-css" rel="stylesheet" href="/resources/css/ekka.css" />

<!-- FAVICON -->
<link href="/resources/img/favicon.png" rel="shortcut icon" />

<!-- Custom CSS -->

<style>
.gstock-div{
	border: 1px solid lightgrey;
	box-shadow: 0 1px 5px 1px rgba(0, 0, 0, 0.1);
	margin: 20px auto;
	margin-top: 0px;
}
.gstock-div-title{
	display: block;
	width: 95%;
	height: 50px;
	background-color: #0d6efd;
	text-align: center;
	margin: 20px auto;
	margin-bottom: 0px;
	padding: 15px;
	color: white;
	box-shadow: 0 1px 5px 1px rgba(0, 0, 0, 0.1);
}
#news-div {
	width: 95%;
	height: 350px;
	padding: 20px;
	text-align: center;
}

#preview{
	max-width : 100%;
	height : 100px;
	z-index:1;
	position:absolute;
}
#news_left, #news_right {
	padding: 10px;
}

.main-content-div {
	width: 100%;
	display: flex;
	justify-content: center;
}

.main-div {
	min-width: 300px;
	height: 1100px;
}

.content-center {
	width: 40%;
}

.content-left {
	width: 30%;
}
.content-right {
	width: 20%;
}

.chat-div {
	width: 90%;
	height: 400px;
	border-radius: 20px;
	padding: 15px;
	text-align: center;
}

.chat-list::-webkit-scrollbar {
	width: 7px;
}

.chat-list::-webkit-scrollbar-thumb {
	background-color: rgba(10, 10, 10, 0.2);
	border-radius: 15px;
}

.chat-list {
	height: 300px;
	overflow: auto;
	background-color: rgb(214, 227, 246); 
}

.chat-tb {
	width: 100%;
	border-collapse: collapse;
}
.chat-tb:last-of-type {
	border-bottom: 6px solid rgb(214, 227, 246);
}
.chat-tr {
	border: 6px solid rgb(214, 227, 246);
	border-bottom: none;
	cursor: pointer;
}

.chat-tr:hover td {
	background-color: rgb(246, 224, 17);
}

.chat-tb td {
	height: 50px;
	background-color: white;
	padding: 5px;
}

@media ( max-width : 1300px) {
	.main-content-div {
		width: 100%;
		display: block;
	}
	.main-div {
		width: 80%;
		margin: auto;
		min-width: 600px;
		height: 1020px;
	}
}

.board-div {
	width: 95%;
	height: 550px;
	padding: 10px;
	padding-top: 20px;
	text-align: center;
}

.centered-table tr:first-child {
	background-color: #f7f7f7;
	border-bottom: 1px solid lightgrey;
}

.centered-table td {
	max-width: 200px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
/* 	font-size: 0.8em; */
}

.ad-slider {
	width: 100%;
	margin-bottom: 50px;
}
.content-left > h6{
	text-align: center;
}
.divVolumeRank{
	font-size: 12px;
}
.divVolumeRank .primaryColorRed {
    color: #ff3149;
}
.divVolumeRank .primaryColorBlue {
	color: #3474d4;
}
.divVolumeRank .primaryColorNone {
	color: #212121;
}
.ranking-div {
	width: 95%;
	height: 970px;
	padding: 20px;
	text-align: center;
}
.divVolumeRank::-webkit-scrollbar {
	display: none;
}

.divVolumeRank::-webkit-scrollbar-thumb {
	background-color: rgba(10, 10, 10, 0.2);
	border-radius: 15px;
}
.divVolumeRank {
	height: 92%;
	margin-top: 30px;
	overflow: auto;
}
.ad-wrapper img{
	width: 100%;
	height: 300px;
	object-fit: cover;
	object-position: center;
}
.chat-category {
	width: 50%;
	height: 30px;
	padding-top: 4px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	background-color: #f7f7f7;
	cursor: pointer;
}
#chat-cate-all {
	background-color: rgb(214, 227, 246);
}
.newsAs{
	margin: 3px 0px;
	border-bottom: 1px solid #eee;
}
.portfolio-div{
	width: 90%;
	height: 360px;
	padding: 10px;
	padding-top: 20px;
	text-align: center;
}
.port-tb{
	width: 90%;
	margin: auto;
	padding: 10px;
}
.port-tb td{
	height: 30px;
}
</style>
</head>

<body class="sign-inup" id="body">
	<%@include file="/WEB-INF/view/layout/header.jsp"%>
	<!-- start of Main ---------------------------------------------------------------------------------------------------------------------- -->
	<div class="gstock-div ad-slider">
		<div class="ad-wrapper">
				<img src="/resources/img/banner/banner-img1.png">	
				<img src="/resources/img/banner/banner-img2.jpg">	
				<img src="/resources/img/banner/banner-img3.jpg">	
				<img src="/resources/img/banner/banner-img4.png">	
		</div>
	</div>

	<div class="main-content-div">


		<!----- 좌측 사이드 div ------------>
		<div class="main-div content-left">
			<h6 class="gstock-div-title">거래량 순위</h6>
			<div class="gstock-div ranking-div">
				<div class="table-responsive divVolumeRank">
	                <table class="table table-borederd tableVolumeRank">
	                  <c:forEach var="item" items="${volumeRank}" varStatus="status">
	                    <tr class="${item.prdyVrssSign < 3 ? 'primaryColorRed' : 'primaryColorBlue'}">
	                      <td class="text-start">${status.count}. <a href="/stock/domestic/${item.mkscShrnIscd}">${item.htsKorIsnm}</a></td>
	                      <td class="text-end"><fmt:formatNumber value="${item.stckPrpr}"/></td>
	                      <td class="text-end"><fmt:formatNumber value="${item.prdyVrss}"/></td>
	                      <td class="text-end">${item.prdyCtrt}%</td>
	                    </tr>
	                  </c:forEach>
	                </table>
	              </div>
            </div>
		</div>
		<!----- 중앙 사이드 div ------------>
		<div class="main-div content-center">

			<!--------- 뉴스 리스트 ------------>
			<h6 class="gstock-div-title">금융 소식</h6>
			<div class="gstock-div" id="news-div" style="font-weight: bold;">
				<div id="newsWrapper"
					style="display: flex; height: 85%; width: 100%;">
					<div id="news_left"
						style="width: 50%; height: 100%;">
						<div style="width: 100%; height: 90%;">
							<ul style="width: 100%;" id="news_left_list">
							</ul>
						</div>
					</div>
					<div id="news_right"
						style="width: 50%; height: 100%;">
						<div style="width: 100%; height: 90%;">
							<ul style="width: 100%;" id="news_right_list">
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--------- 게시판 리스트 ------------>
			<h6 class="gstock-div-title">커뮤니티 인기글</h6>
			<div class="gstock-div board-div">
				<table class="table centered-table">
					<thead>
						<tr>
							<th colspan="2" style="min-width: 100px;">제목</th>
							<th style="width: 100px;">작성자</th>
							<th style="width: 50px;">등록일</th>
							<th style="width: 40px;">조회수</th>
							<th style="width: 40px;">추천수</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="board" items="${boardList}">
							<c:choose>
								<c:when test="${board.recommand >= 5}">
									<tr style="background-color: #fee; font-weight: 500;">
								</c:when>
								<c:otherwise>
									<tr>
								</c:otherwise>
							</c:choose>
							<td style="width: 70px; text-align: right;"><c:forEach
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
							<td style="text-align: left;"><a
								href="/board/detail?boardId=${board.id}"> ${board.title} <c:if
										test="${board.reply ne 0}">
										<span style="color: #aaa">[${board.reply}]</span>
									</c:if>
							</a></td>
							<td>${board.userName}</td>
							<td><fmt:formatDate value="${board.date}"
									pattern="MM-dd" /></td>
							<td>${board.views}</td>
							<td>${board.recommand}</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="6" style="text-align: center;"><a
								href="/board/list">게시판 더 보기</a></td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>
		<!----- 우측 사이드 div ------------>
		<div class="main-div content-right">

			<!--------- 채팅 리스트 ------------>
			<div class="gstock-div chat-div" style="margin-top: 20px;">
				<h6>채팅</h6>
				<c:choose>
					<c:when test="${not empty chatList || not empty advisorChatList || not empty myAdvisorChatList}">
						<div style="display: flex;">
							<div class="chat-category" id="chat-cate-all">전체</div>
							<div class="chat-category" id="chat-cate-stock">종목별</div>
							<div class="chat-category" id="chat-cate-advisor">구독</div>
						</div>
						<div class="chat-list" id="chat-list">
					</c:when>
					<c:when test="${empty chatList && empty advisorChatList && empty myAdvisorChatList}">
						<div style="display: flex;">
							<div id="chat-cate-all"></div>
							<div id="chat-cate-stock"></div>
							<div id="chat-cate-advisor"></div>
						</div>
						<div class="chat-list" id="chat-list" style="background-color: rgb(70, 70, 70)">
					</c:when>
				</c:choose>
				<input type="hidden" id="chatDisplay" value="${chatList}">
					<c:if test="${not empty chatList}">
						<table class="chat-tb" id="chat-advisor-tb">
							<c:forEach var="chat" items="${chatList}">
								<c:if test="${fn:contains(chat.companyCode, '@')}">
										<tr class="chat-tr advisor-tr" onclick="window.open('/chat?companyCode=${chat.companyCode}&userId=${principal.id}', '_black', 'width= 480, height= 720, location=no')">
											<td colspan="3" style="width: 100%; position: relative;">${chat.companyName}
												<c:if test="${principal.roletypeId eq 1 && chat.lastMessage > chat.lastTime}">
													<span style="color: red; position: absolute; vertical-align: middle; right: 15px; color: red;">new</span>
												</c:if>
											</td>
										</tr>
								</c:if>
							</c:forEach>
						</table>
						<table class="chat-tb" id="chat-stock-tb">
							<c:forEach var="chat" items="${chatList}">
								<c:if test="${not fn:contains(chat.companyCode, '@')}">
										<tr class="chat-tr stock-tr" onclick="window.open('/chat?companyCode=${chat.companyCode}&companyName=${chat.companyName}&userId=${principal.id}', '_black', 'width= 480, height= 720, location=no')">
											<td style="width: 20%">${chat.companyCode}</td>
											<td style="width: 60%;">${chat.companyName}
											</td>
											<td style="width: 20%; position: relative;">${chat.countUser}명
												<c:if test="${principal.roletypeId eq 1 && chat.lastMessage > chat.lastTime}">
													<span style="color: red; position: absolute; vertical-align: middle; left: -15px; color: red;">new</span>
												</c:if>
											</td>
										</tr>
								</c:if>
							</c:forEach>
						</table>
					</c:if>
			</div>
		</div>
		<h6 class="gstock-div-title" style="width: 90%;">포트폴리오 랭킹</h6>
		<div class="gstock-div portfolio-div">
			<table class="port-tb">
				<tr>
					<td>랭킹</td>
					<td>제목</td>
					<td>수익율</td>
				</tr>
				<c:forEach var="port" items="${portfolio}" varStatus="status">
					<c:if test="${not empty port.ror}">
					<tr>
						<td>
							<c:choose>
								<c:when test="${status.count eq 1}">
								🥇
								</c:when>
								<c:when test="${status.count eq 2}">
								🥈
								</c:when>
								<c:when test="${status.count eq 3}">
								🥉
								</c:when>
								<c:otherwise>
									${status.count }
								</c:otherwise>
							</c:choose>
						</td>
						<td>${port.title}</td>
						<c:choose>
							<c:when test="${port.ror > 0}">
								<td style="color: #ff3149;">${port.ror}%</td>
							</c:when>
							<c:when test="${port.ror < 0}">
								<td style="color: #3474d4;">${port.ror}%</td>
							</c:when>
							<c:otherwise>
								<td style="color: #777;">${port.ror}%</td>
							</c:otherwise>
						</c:choose>
					</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
	</div>
	<!-- end of Main ------------------------------------------------------------------------------------------------------------------------ -->
	<%@include file="/WEB-INF/view/layout/footer.jsp"%>
	<!-- Javascript -->
	<script src="/resources/plugins/jquery/jquery-3.5.1.min.js"></script>
	<script src="/resources/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/plugins/jquery-zoom/jquery.zoom.min.js"></script>
	<script src="/resources/plugins/slick/slick.min.js"></script>

	<!-- Ekka Custom -->
	<script src="/resources/js/ekka.js"></script>

	<!-- Custom Js -->
	<script src="/resources/js/mainNews.js"></script>

	<script>
		// 			테이블 td->tr 배경 효과
		let tds = document.getElementsByClassName("centered-table")[0]
				.getElementsByTagName("td");
		for (let i = 0; i < tds.length; i++) {
			if (tds[i].parentNode.style.backgroundColor != "rgb(255, 238, 238)") {
				tds[i].addEventListener("mouseover", function() {
					this.parentNode.style.backgroundColor = "#f7f7f7";
				});
				tds[i].addEventListener("mouseout", function() {
					this.parentNode.style.backgroundColor = "";
				});
			}
		}
		
		function chatCategoryAll(){
			document.getElementById("chat-cate-all").style.backgroundColor = "rgb(214, 227, 246)";
			document.getElementById("chat-cate-stock").style.backgroundColor = "#f7f7f7";
			document.getElementById("chat-cate-advisor").style.backgroundColor = "#f7f7f7";
			document.getElementById("chat-stock-tb").style.display="";
			document.getElementById("chat-advisor-tb").style.display="";
		}
		function chatCategoryStock(){
			document.getElementById("chat-cate-all").style.backgroundColor = "#f7f7f7";
			document.getElementById("chat-cate-stock").style.backgroundColor = "rgb(214, 227, 246)";
			document.getElementById("chat-cate-advisor").style.backgroundColor = "#f7f7f7";
			document.getElementById("chat-stock-tb").style.display="";
			document.getElementById("chat-advisor-tb").style.display="none";
		}
		function chatCategoryAdvisor(){
			document.getElementById("chat-cate-all").style.backgroundColor = "#f7f7f7";
			document.getElementById("chat-cate-advisor").style.backgroundColor = "rgb(214, 227, 246)";
			document.getElementById("chat-cate-stock").style.backgroundColor = "#f7f7f7";
			document.getElementById("chat-stock-tb").style.display="none";
			document.getElementById("chat-advisor-tb").style.display="";
		}
		document.getElementById("chat-cate-all").addEventListener("click", function() {
			chatCategoryAll();
		});
		document.getElementById("chat-cate-stock").addEventListener("click", function() {
			chatCategoryStock();
		});
		document.getElementById("chat-cate-advisor").addEventListener("click", function() {
			chatCategoryAdvisor();
		});
		
		$(function() {
			$('.ad-wrapper').slick({
				slidesToShow : 1,
				slidesToScroll : 1,
				autoplay : true,
				autoplaySpeed : 2000,
				arrows : false
			});
		})
	</script>
</body>
</html>