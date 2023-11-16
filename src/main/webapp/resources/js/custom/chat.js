let chatInit = {
  version: 1,
  stompClient: null, // stompClient 변수를 chatInit 객체 밖에서 정의하여 전역 변수로 사용합니다.
  init: function() {
    this.scrollToBottom();
    this.connect();
    document.getElementById('send-btn').addEventListener('click', () => {
	  this.sendMessage();
	});
	document.getElementById('message').addEventListener('keypress', (event) => {
	    if (event.key === "Enter") {
	        event.preventDefault();
	        this.sendMessage();
	    }
	});
	this.lastTimeUpdate();
	window.addEventListener('unload', () => {
		this.lastTimeUpdate();
	});
  },

  scrollToBottom: function() {
	message = document.getElementById('chat-messages');
    message.scrollTop = message.scrollHeight;
  },

  connect: function() {
    let companyCode = document.getElementById("hd-companyCode").value;
    let userName = document.getElementById("hd-userName").value;
    this.stompClient = Stomp.over(new SockJS('/chat'));

    this.stompClient.connect({}, () => {
      this.stompClient.subscribe(`/topic/${companyCode}`, function(message) {
        var messageBody = JSON.parse(message.body);
        var messageDate = new Date(messageBody.date);

        let chatMessages = document.getElementById('chat-messages');
		
		if (messageBody.userName == userName) {
		  chatMessages.innerHTML +=
		    '<div class="my-message-user">' +
		    messageBody.userName +
		    '</div>' +
		    '<div class="my-message-div">' +
		    '<div class="message-content">' +
		    messageBody.content +
		    '</div>' +
		    messageDate.getHours() + ":" + messageDate.getMinutes() +
		    '</div>';
		} else {
		  chatMessages.innerHTML +=
		    '<div class="message-user">' +
		    messageBody.userName +
		    '</div>' +
		    '<div class="message-div">' +
		    '<div class="message-content">' +
		    messageBody.content +
		    '</div><p>' +
		    messageDate.getHours() + ":" + messageDate.getMinutes() +
		    '</p></div>';
		}
        chatInit.scrollToBottom();
      });
    });
  },

  sendMessage: async function() {
    let companyCode = document.getElementById("hd-companyCode").value;
    let userId = document.getElementById("hd-userId").value;
    let userName = document.getElementById("hd-userName").value;
    let message = document.getElementById("message");

    if (message.value.replace(/\s/gi, '').length == 0) {
      message.value = '';
      return false;
    }
    if (/[<>]/.test(message.value)) { // 정규 표현식 패턴 수정
      alert("일부 특수문자는 사용할 수 없습니다.");
      message.value = '';
      return false;
    }

    await this.stompClient.send(`/app/chat/${companyCode}`, {}, JSON.stringify({
      userId: userId,
      userName: userName,
      companyCode: companyCode,
      content: message.value,
      date: new Date()
    }));
    message.value = '';
    message.focus();
  },
  
  deleteMessage: function(id){
	  if(confirm("해당 메시지를 삭제하시겠습니까?")){
		  document.getElementById(`delete-form-${id}`).submit();
	  }
  },
  
  lastTimeUpdate: async function(){
	let companyCode = document.getElementById("hd-companyCode").value;
	let userId = document.getElementById("hd-userId").value;
	
	try {
	    let response = await fetch(`chat/lastTimeUpdate?companyCode=${companyCode}&userId=${userId}`);
	    if (!response.ok) {
	        throw new Error(`HTTP error! Status: ${response.status}`);
	    }
	    const check = await response.json();
	    console.log(`check = ${check}`);
	} catch (error) {
	    console.error("Fetch error:", error);
	}
  }
  
};

chatInit.init();