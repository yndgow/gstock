let boardDetailInit = {
	version: 1,
	init: function(){
		this.thumbCheckFnc();
	},
    toSignIn: function() {
        if (confirm("로그인이 필요한 서비스입니다\n로그인 화면으로 이동하시겠습니까?")) {
            location.href = "/user/sign-in";
        }
    },

    replyDelete: function(id, boardId) {
        if (confirm("정말로 댓글을 삭제하시겠습니까? \n해당 댓글에 달린 댓글은 삭제되지 않습니다")) {
            location.href = `/board/reply-delete?id=${id}&boardId=${boardId}`;
        }
    },

    rereplyOpen: function(id, uid, bid, ref, step, level) {
        $(".rereply-div").empty();
        $("#rereply-id" + id).append(
            `<form class="ec-blog-form" method="post" action="/board/reply-write">
                <div class="row">
                    <div class="col-md-6">
                        <div class="ec-leave-form">
                            <input type="hidden" name="parentId" value="${id}">
                            <input type="hidden" name="userId" value="${uid}">
                            <input type="hidden" name="boardId" value="${bid}">
                            <input type="hidden" name="ref" value="${ref}">
                            <input type="hidden" name="step" value="${step}">
                            <input type="hidden" name="level" value="${level + 1}">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="ec-text-leave">
                            <textarea placeholder="Content" name="content"></textarea>
                            <button type="submit" class="btn btn-lg btn-secondary">등록</button>
                        </div>
                    </div>
                </div>
            </form>`
        );
    },

    boardDelete: function() {
        if (confirm("정말 게시글을 삭제하시겠습니까?")) {
            document.getElementById("board-delete-frm").submit();
        }
    },

    thumbFnc: async function(boardId, userId) {
        if (userId == null) {
            if (confirm("로그인이 필요한 서비스입니다\n로그인 하시겠습니까?")) {
                location.href = '/user/sign-in';
            }
        } else {
			try {
			    const response = await fetch(`/board/thumb-check?boardId=${boardId}&userId=${userId}`);
			    if (!response.ok) {
			        // HTTP 상태 코드가 에러를 나타내는 경우
			        throw new Error(`HTTP error! Status: ${response.status}`);
			    }
			    const check = await response.json();
	            if (check == 0) {
	                document.getElementById("thumb-div").style.backgroundColor = "#555";
	            } else {
	                document.getElementById("thumb-div").style.backgroundColor = "#f77";
	            }
			} catch (error) {
			    console.error("Fetch error:", error);
			}
        }
    },

    replyThumb: async function(replyId, userId) {
        if (userId == null) {
            if (confirm("로그인이 필요한 서비스입니다\n로그인 하시겠습니까?")) {
                location.href = '/user/sign-in';
            }
        } else {
			try{
				const response = await fetch(`/board/reply-thumb-check?replyId=${replyId}&userId=${userId}`);
            	if (!response.ok) {
			        // HTTP 상태 코드가 에러를 나타내는 경우
			        throw new Error(`HTTP error! Status: ${response.status}`);
			    }
			    const check = await response.json();
	            if (check == 0) {
	                document.getElementById("reply-thumb-btn-" + replyId).style.backgroundColor = "";
	                var replyCount = await fetch(`/board/get-reply-count?replyId=${replyId}`);
	                var count = await replyCount.text();
	                if (count == 0) {
	                    document.getElementById("reply-thumb-span-" + replyId).textContent = "";
	                } else {
	                    document.getElementById("reply-thumb-span-" + replyId).textContent = count;
	                }
	                console.log("count : " + count);
	            } else {
	                document.getElementById("reply-thumb-btn-" + replyId).style.backgroundColor = "#f77";
	                var replyCount = await fetch(`/board/get-reply-count?replyId=${replyId}`);
	                var count = await replyCount.text();
	                document.getElementById("reply-thumb-span-" + replyId).textContent = count;
	                console.log("count : " + count);
	            }
			} catch (error) {
			    console.error("Fetch error:", error);
			}
        }
    },
    
    thumbCheckFnc: function(){
		let thumbCheck = document.getElementById("thumb-check").value;
		console.log('thumbCheck'+thumbCheck);
		if(thumbCheck.length==0 || thumbCheck==0){
			document.getElementById("thumb-div").style.backgroundColor = "#555";
		}else{
			document.getElementById("thumb-div").style.backgroundColor = "#f77";
		}
	}
};

boardDetailInit.init();