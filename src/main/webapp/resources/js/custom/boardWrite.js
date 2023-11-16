let boardWriteInit = {
	version: 1,
	init: function(){},
	submit: function(){
		let category = document.getElementById("category-select");
		let title = document.getElementById("title-input");
		let content = document.getElementById("summernote");
		let writeForm = document.getElementById("board-write-frm");
		
		if(category.value.length==0){
			alert("카테고리를 선택해주세요");
    		category.focus();
		}else if(title.value.replace(/\s/gi, '').length==0){
			console.log('category : '+category.value);
    		title.value = '';
    		alert("제목을 입력해주세요");
    		title.focus();
		}else if(content.value.replace(/\s/gi, '').length==0){
    		content.value = '';
    		alert("내용을 입력해주세요");
    		content.focus();
    	}else{
    		if(confirm("해당 내용으로 글을 작성하시겠습니까?")){
	    		writeForm.submit();
    		}
    	}
	}
};