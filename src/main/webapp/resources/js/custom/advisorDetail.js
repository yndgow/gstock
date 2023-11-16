/**
 * 전문가 상세페이지 js
 */

const advisorDetailInit = {
  version: 1,
  advisorId : null,
  userId : null,
  btnAdvisorBoard : document.getElementById("btnAdvisorBoard"),
  btnAdvisorChat : document.getElementById("btnAdvisorChat"),
  init: function () {
    const btnAdvisorId = document.getElementById('btnAdvisorSub');

    if(btnAdvisorId){
      this.advisorId = btnAdvisorId.dataset.id;
    }

    const inputUserId = document.getElementById('userId');
    if(inputUserId){
      this.userId = inputUserId.value;
    }

    const btnSubscribe = document.getElementById("btnAdvisorSub");
    if(btnSubscribe){
      btnSubscribe.addEventListener("click", this.subscribe.bind(this));
    }
    
    if(this.btnAdvisorBoard && this.btnAdvisorChat){
      this.btnAdvisorBoard.addEventListener("click", this.enterBoard.bind(this));
    }
    
    document.getElementById('btnAdvisorList').addEventListener('click', function(){
      location.href = '/advisor/list';
    });
  },

  subscribe: function () {
    let subBtn = document.getElementById("btnAdvisorSub");
    let advisorId = subBtn.getAttribute("data-id");
    location.href = "/pay/kakao?advisorId=" + advisorId;
  },

  enterBoard: function () {
    const nickName = document.getElementById("advisorNickName");
    location.href = `/advisor/sub/board/${nickName.textContent}`;
  },

};
advisorDetailInit.init();
