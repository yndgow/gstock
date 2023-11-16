<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chat Application</title>
	
	<!-- Custom css -->
    <link rel="stylesheet" href="/resources/css/custom/chat.css" />
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<div style="width: 100%;">
	    <h3>
	    	${companyName}(${companyCode})
	    	<br>
	    	<c:if test="${not empty companyCode}">
	    		<input type="hidden" id="hd-companyCode" value="${companyCode}">
	    	</c:if>
	    	<c:if test="${not empty principal}">
	    		<input type="hidden" id="hd-userId" value="${principal.id}">
	    		<input type="hidden" id="hd-userName" value="${principal.userName}">
	    	</c:if>
	   	</h3>
   	</div>
    <div id="chat-messages">
    	<c:set var="listLength" value="${fn:length(list)}" />
    	<c:forEach begin="1" end="${listLength}" varStatus="status">
			<c:if test="${fn:substring(list[listLength - status.count].date, 0, 11) ne fn:substring(list[listLength - status.count + 1].date, 0, 11)}">
    			<div class="date-messages">
	    			<fmt:formatDate value="${list[listLength-status.count].date}" pattern="yyyy년 MM월 dd일"/>
    			</div>
			</c:if>
  			<c:choose>
   				<c:when test="${list[listLength-status.count].userId eq principal.id}">
	    			<c:if test="${list[listLength - status.count].userName ne list[listLength - status.count + 1].userName}">
		    			<div class="my-message-user">
			    			${list[listLength-status.count].userName}
		    			</div>
		    		</c:if>	
		    		<div class="my-message-div">
		    			<div class="message-content" style="background-color: rgb(246,224,17);">
		    				${list[listLength-status.count].content}
		    			</div>
		    			<fmt:formatDate value="${list[listLength-status.count].date}" pattern="HH:mm"/>
		    			<form method="post" id="delete-form-${list[listLength-status.count].id}" action="/admin/chat-delete">
		    				<input type="hidden" name="id" value="${list[listLength-status.count].id}">
		    				<input type="hidden" name="code" value="${companyCode}">
		    				<c:if test="${principal.roletypeId eq 0}">
			    				<button type="button" class="delete-btn" onclick="chatInit.deleteMessage(${list[listLength-status.count].id})">X</button>
		    				</c:if>
		    			</form>
		    		</div>
   				</c:when>
   				<c:otherwise>
   					<c:if test="${list[listLength - status.count].userName ne list[listLength - status.count + 1].userName}">
		    			<div class="message-user">
			    			${list[listLength-status.count].userName}
		    			</div>
		    		</c:if>	
		    		<div class="message-div">
		    			<div class="message-content">
		    				${list[listLength-status.count].content}
		    			</div>
		    			<fmt:formatDate value="${list[listLength-status.count].date}" pattern="HH:mm"/>
		    			<form method="post" id="delete-form-${list[listLength-status.count].id}" action="/admin/chat-delete">
		    				<input type="hidden" name="id" value="${list[listLength-status.count].id}">
		    				<input type="hidden" name="code" value="${companyCode}">
		    				<c:if test="${principal.roletypeId eq 0}">
			    				<button type="button" class="delete-btn" onclick="chatInit.deleteMessage(${list[listLength-status.count].id})">X</button>
		    				</c:if>
		    			</form>
		    		</div>
   				</c:otherwise>
   			</c:choose>
    	</c:forEach>
    </div>
    <form id="chat-form">
    	<div class="submit-div">
	        <input type="text" id="message" style="width: 100%; height: 44px;" placeholder="Enter your message" autocomplete="off">
	        <button type="button" class="send-btn" id="send-btn">Send</button>
    	</div>
    </form>
    <br>
    <c:if test="${not empty userList}">
   	<h3>구독자 목록</h3>
	    <div class="user-list-div">
	    	<c:forEach var="user" items="${userList}" varStatus="status">
	    		${user.userName}<br>
	    	</c:forEach>
	    </div>
    </c:if>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="/resources/js/custom/chat.js"></script>
    <script>
//     	$(async function(){
//    			try {
//    			    const response = await fetch('chat/lastTimeUpdate?companyCode=${companyCode}&userId=${principal.id}');
//    			    if (!response.ok) {
//    			        throw new Error(`HTTP error! Status: ${response.status}`);
//    			    }
//    			    const check = await response.json();
//    			    console.log('check : '+check);
//    			} catch (error) {
//    			    console.error("Fetch error:", error);
//    			}
   			
//     		$(window).on('unload', function() {
//     			try {
//     			    const response = await fetch('chat/lastTimeUpdate?companyCode=${companyCode}&userId=${principal.id}');
//     			    if (!response.ok) {
//     			        throw new Error(`HTTP error! Status: ${response.status}`);
//     			    }
//     			    const check = await response.json();
//     			} catch (error) {
//     			    console.error("Fetch error:", error);
//     			}
//     		});
//     	})
    </script>
</body>
</html>