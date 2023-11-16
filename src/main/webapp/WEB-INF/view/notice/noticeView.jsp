<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ include file="/WEB-INF/view/layout/header.jsp" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<body>

 <script type="text/javascript">
	
</script>
    <header class="ec-header">
        <!--Ec Header Top Start -->
        <div class="header-top">
            <div class="container">
                <div class="row align-items-center">
                    <!-- Header Top social Start -->
                    <div class="col text-left header-top-left d-none d-lg-block">
                        <div class="header-top-social">
                            <span class="social-text text-upper">Follow us on:</span>
                           
                        </div>
                    </div>
                  
                    <div class="col d-lg-none ">
                        <div class="ec-header-bottons">
                            <!-- Header User Start -->
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
                            <!-- Header menu End -->
                        </div>
                    </div>
                    <!-- Header Top responsive Action -->
                </div>
            </div>
        </div>
        <!-- Ec Header Top  End -->
       
       
        <div class="ec-header-bottom d-lg-none">
            <div class="container position-relative">
                <div class="row ">

                    <!-- Ec Header Logo Start -->
                    <div class="col">
                        <div class="header-logo">
                            <a href="index.html"><img src="/resources/images/logo/logo.png" alt="Site Logo" /><img
                                    class="dark-logo" src="/resources/images/logo/dark-logo.png" alt="Site Logo"
                                    style="display: none;" /></a>
                        </div>
                    </div>
                    <!-- Ec Header Logo End -->
                    <!-- Ec Header Search Start -->
                    <div class="col">
                        <div class="header-search">
                            <form class="ec-btn-group-form" action="#">
                                <input class="form-control ec-search-bar" placeholder="Search products..." type="text">
                                <button class="submit" type="submit"><i class="fi-rr-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <!-- Ec Header Search End -->
                </div>
            </div>
        </div>
        <!-- Header responsive Bottom  End -->        
        <!-- Ec Main Menu End -->	
	<div class="content container"style="width: 50%;" >
		<div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">					
			<div>
				<p class="breadcrumbs">					
					
					<i class="mdi mdi-chevron-right">
					</i>
					<h3></h3>
			</div>					
		</div>
		<div class="row">
			<div class="col-12">	
																	
						<h4 style="border-left: 12px solid; border-bottom: 12px solid #C0C0C0; color: #C0C0C0;">
						    <span style="color: black;">제목 : ${view.noticeTitle}</span>
						</h4>

						 
						<p style="border-bottom: 1px solid #C0C0C0; color: black;">작성자 : 관리자</p>
						<c:set var="formattedDate">
					    <fmt:formatDate value="${view.noticeUpdated}" pattern="yyyy-MM-dd"/>
						</c:set>					
						<p style="border-bottom: 1px solid #C0C0C0; color: black;"">작성일자: ${formattedDate}</p>					
						<p style="margin-bottom: 30px;">
    					<textarea readonly="readonly" style="width: 100%; height: 23em; resize: none; color: black; border-top: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; border-left: none; border-right: none;">${view.noticeContent}</textarea>
    					</p>
						<table class="table-responsive"style =" color : border-bottom: 1px solid;color: #C0C0C0">
						    <tr style="border: none; resize: none" >					     
					          <td><a href = "/notice/list" class="btn btn-primary">목록으로</a></td>
					      	</tr>							  
						</table>														 							   												
				</div>
			</div>
		</div>		
	</header>
	</body>
	</head>
</html>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>