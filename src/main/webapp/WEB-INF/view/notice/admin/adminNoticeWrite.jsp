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
<script type="text/javascript">
function cancellation() {
    // 취소 버튼 클릭시 목록창으로 돌아가도록 지정
    window.location.href = "http://localhost/notice/admin/list";
}

</script>
<div class="ec-content-wrapper">
	<div class="content">
		<div class="breadcrumb-wrapper breadcrumb-contacts">
			<div>
				<h1>작성하기</h1>
				<p class="breadcrumbs">
					<span><a href="/admin/main">Main</a></span> <span><i
						class="mdi mdi-chevron-right"></i></span>Notice 
						<span><i
						class="mdi mdi-chevron-right"></i></span>Write
				</p>
			</div>
		</div>
        <form action="/notice/admin/write" method="post">
        <div>
        <input type="hidden" value="1" name="userId" style="">제목 :</div>
            <table class="noticeWrite" style="width: 840px; height:200px ;">            
            	<tbody><tr>
            		<td>
            			<textarea name="noticeTitle" required style="font-size: 23px; width: 100%; height: 100px; resize: none; bac border-top: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; border-left: none; border-right:none;">${notice.noticeTitle}</textarea>   
            		</td>
            	</tr>            	
            	<tr>
            		<td>
            		작성란:
            		<textarea name="noticeContent" required="required" style="resize: none; width: 840px; height :500px;"></textarea>            		            
            		</td>            		            	
            		
            	</tr>  
            	<tr>
            	<td>		            	
           			<div style="text-align: right;">
					    <input type="radio" name="noticeState" value="0" checked style="font-size: 5px;width: 3%;height: 20px;margin-right: 0px;text-align: center;">비공개
					    <input type="radio" name="noticeState" value="1" style="font-size: 5px;width: 3%;height: 20px;margin-right: 0px;">공개	
					</div>
            	</td>            		
            	</tr>            	                
            	<tr>
            		<td>
            			<a><button type="submit" class="btn btn-primary">작성</button></a> 
            			<button type="submit" class="btn btn-primary" onclick="cancellation()">취소</button>                                     	
            		</td>            		           	
            	</tr>             	                                                   
    	</tbody>
    	</table>
    	</form>
    	</div>
</div>

    <header class="ec-header">
        <!--Ec Header Top Start -->
        <div class="header-top">
            <div class="container">
                <div class="row align-items-center">
                    <!-- Header Top social Start -->
                    <div class="col text-left header-top-left d-none d-lg-block">
                        <div class="header-top-social">
                            <span class="social-text text-upper">Follow us on:</span>
                            <ul class="mb-0">
                                <li class="list-inline-item"><a class="hdr-facebook" href="#"><i
                                            class="ecicon eci-facebook"></i></a></li>
                                <li class="list-inline-item"><a class="hdr-twitter" href="#"><i
                                            class="ecicon eci-twitter"></i></a></li>
                                <li class="list-inline-item"><a class="hdr-instagram" href="#"><i
                                            class="ecicon eci-instagram"></i></a></li>
                                <li class="list-inline-item"><a class="hdr-linkedin" href="#"><i
                                            class="ecicon eci-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>                
           
                    <div class="col d-lg-none ">
                        <div class="ec-header-bottons">              
                            <div class="ec-header-user dropdown">
                                <button class="dropdown-toggle" data-bs-toggle="dropdown"><i
                                        class="fi-rr-user"></i></button>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a class="dropdown-item" href="register.html">Register</a></li>
                                    <li><a class="dropdown-item" href="checkout.html">Checkout</a></li>
                                    <li><a class="dropdown-item" href="login.html">Login</a></li>
                                </ul>
                            </div>                        
                            <a href="wishlist.html" class="ec-header-btn ec-header-wishlist">
                                <div class="header-icon"><i class="fi-rr-heart"></i></div>
                                <span class="ec-header-count">4</span>
                            </a>                     
                            <a href="#ec-side-cart" class="ec-header-btn ec-side-toggle">
                                <div class="header-icon"><i class="fi-rr-shopping-bag"></i></div>
                                <span class="ec-header-count cart-count-lable">3</span>
                            </a>                      
                            <a href="#ec-mobile-menu" class="ec-header-btn ec-side-toggle d-lg-none">
                                <i class="fi fi-rr-menu-burger"></i>
                            </a>                        
                        </div>
                    </div>                  
                </div>
            </div>
        </div>
        <!-- Ec Header Top  End -->
       
       
        <div class="ec-header-bottom d-lg-none">
            <div class="container position-relative">
                <div class="row ">

           
                    <div class="col">
                        <div class="header-logo">
                            <a href="index.html"><img src="/resources/images/logo/logo.png" alt="Site Logo" /><img
                                    class="dark-logo" src="/resources/images/logo/dark-logo.png" alt="Site Logo"
                                    style="display: none;" /></a>
                        </div>
                    </div>
              
                    <div class="col">
                        <div class="header-search">
                            <form class="ec-btn-group-form" action="#">
                                <input class="form-control ec-search-bar" placeholder="Search products..." type="text">
                                <button class="submit" type="submit"><i class="fi-rr-search"></i></button>
                            </form>
                        </div>
                    </div>
         
                </div>
            </div>
        </div>   
	</header>
	</body>
	</head>
</html>
<%@include file="/WEB-INF/view/layout/adminFooter.jsp"%>