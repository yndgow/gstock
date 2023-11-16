let boardListInit = {
	version: 1,
	init: function(){
		this.keepCategory();
		this.nowCategory();
		this.tdHoverEvent();
		document.getElementById('search-word').addEventListener('keypress', (event) => {
		    if (event.key === "Enter") {
		        event.preventDefault();
		        this.searchValid();
		    }
		});
		document.getElementById("orderType").addEventListener("change", () => {
			this.orderSelect();
		});
	},
	toSignIn: function(){
		if(confirm("로그인이 필요한 서비스입니다\n로그인 화면으로 이동하시겠습니까?")){
			location.href="/user/sign-in";
		}
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
		console.log('word - if3');
			document.getElementById("search-frm").submit();
		}
	},
	
	searchParam: function(key){
		return new URLSearchParams(location.search).get(key);
	},
	
	appendCategory: function(cate){
		let searchDiv = document.getElementById("search-div");
		let input = document.createElement("input");
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "categoryId");
		input.setAttribute("value", cate);
		searchDiv.appendChild(input);
	},
	
	keepCategory: function(){
		let cate = this.searchParam('categoryId');
		if(cate){
			this.appendCategory(cate);
		}
	},
	
	nowCategory: function(){
		let cate = this.searchParam('categoryId');
	    let categoryButton = document.getElementById('category-btn-' + cate);
		console.log('categoryButton : '+categoryButton)
	    if (categoryButton) {
			if(cate==1){
		        categoryButton.style.border = "1px solid skyblue";
		        categoryButton.style.backgroundColor = "rgba(135, 206, 235, 0.1)";
			}else if(cate==2){
		        categoryButton.style.border = "1px solid #ffc107";
		        categoryButton.style.backgroundColor = "rgba(255, 193, 6, 0.1)";
			}else if(cate==3){
		        categoryButton.style.border = "1px solid #2ab674";
		        categoryButton.style.backgroundColor = "rgba(42, 182, 116, 0.1)";
			}
	    } else {
	        console.log("해당 ID를 가진 카테고리 버튼을 찾을 수 없습니다.");
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
	},
	
	orderSelect: function(){
		let search = `/board/list?`;
		let cate = this.searchParam('categoryId');
		let type = this.searchParam('searchType');
		let word = this.searchParam('searchWord');
		let orderType = document.getElementById("orderType").value;
		
		if(cate!=null){
			search += 'categoryId='+cate+'&';
		}
		if(type!=null){
			search += 'searchType='+type+'&';
		}
		if(word!=null){
			search += 'searchWord='+word+'&';
		}
		location.href=`${search}orderType=${orderType}`;
	}
};

boardListInit.init();