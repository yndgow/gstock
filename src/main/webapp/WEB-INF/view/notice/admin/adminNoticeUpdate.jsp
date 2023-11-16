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
function updateTextarea() {
    const editorContent = document.getElementById('editor').innerHTML;
    document.getElementById('textarea').value = editorContent;
}
</script>	
<div class="ec-content-wrapper">
	<div class="content">
		<div class="breadcrumb-wrapper breadcrumb-contacts">
			<div>
				<h1>공지사항</h1>
				<p class="breadcrumbs">
					<span><a href="/admin/main">Main</a></span> <span><i
						class="mdi mdi-chevron-right"></i></span>Notice 
						<i class="mdi mdi-chevron-right"></i><span>Update</span>
				</p>
			</div>
		</div>

<div class="content container" style="width: 100%;">
<h2> 수정하기</h2>
    <form action="/notice/update" method="post">
        <table class = "notice-table-update">  
                      <tr>
                <td>
                <button type="submit" class="btn btn-primary" style="margin :5px; font-size: 20px">수정하기</button>
                 <a href ="/notice/admin/list">
                	<button type="button" class="btn btn-primary" style="margin :5px; font-size: 20px ">목록으로</button>
                </a>
                </td>
                
            </tr>                                                                           
            <tr>                
                <td>
                	<input type="hidden" value="${notice.id}" name="id">
                	<input type="hidden" value="${notice.userId}" name="userId" style="font-size: 23px">                	
                		<p style="font-size: 23px">제목 :</p>                             
                		<textarea name="noticeTitle" id ="textarea" required style="font-size: 23px; width: 100%; height: 100px; resize: none; bac border-top: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; border-left: none; border-right:none;">${notice.noticeTitle}</textarea>                                          	                	    	                	                	                      		
                </td> 
            </tr>            
            <tr>            	               
                <td>
                    <p style="font-size: 23px"> 작성글 :</p>                   
                </td>                                                 
            </tr>
            <tr>            
                <td>                     
					<textarea name="noticeContent" cols="100" rows="15" required="required" style="resize: none; font-size: 23px">${notice.noticeContent}</textarea>                                	
                </td>
            </tr>
            <tr>
                <td>		            	
           			<div style="text-align: right;">
					    <input type="radio" name="noticeState" value="0" checked  
					    style="font-size: 5px;width: 4%;height: 25px;margin-right: 10px;" id="private"><label for="private">비공개</label>
					    <input type="radio" name="noticeState" value="1" 
					    style="font-size: 5px;width: 4%;height: 25px;margin-right: 10px;" id="public"><label for="public">공개</label>	
					</div>
            	</td>              
            </tr>                     
        </table>
    </form>
    </div>
    </div>
    </div>
</body>
</html>
<%@include file="/WEB-INF/view/layout/adminFooter.jsp"%>