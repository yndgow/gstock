let adminBoardInit = {
	version: 1,
	init: function(){
		document.getElementById('search-word').addEventListener('keypress', (event) => {
		    if (event.key === "Enter") {
		        event.preventDefault();
		        this.searchValid();
		    }
		});
		this.tdHoverEvent();
	},
	searchValid: function(){
		let word = document.getElementById("search-word");
		if(word.value.trim().length==0){
			word.value = "";
			word.focus();
		}else if(/<|>/.test(word.value)){
			alert("일부 특수문자는 사용할 수 없습니다");
    		word.value="";
    		word.focus();
		}else{
			document.getElementById("search-frm").submit();
		}
	},
	boardDelete: function(boardId) {
        if (confirm("정말 게시글을 삭제하시겠습니까?")) {
            document.getElementById(`admin-board-delete-frm-${boardId}`).submit();
        }
    },
    tdHoverEvent: function(){
		let tds = document.getElementsByClassName("board-tb")[0].getElementsByTagName("td");
		for(let i = 0; i<tds.length; i++){
			tds[i].addEventListener("mouseover", function() {
			  this.parentNode.style.backgroundColor = "#f7f7f7";
			});
			tds[i].addEventListener("mouseout", function() {
			  this.parentNode.style.backgroundColor = "";
			});
		}
	}
};

adminBoardInit.init();
