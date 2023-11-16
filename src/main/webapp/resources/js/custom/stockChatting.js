/**
 * 실시간 채팅방 js
 */
const chatInit = {
    init: function(){
        const btnChatIn = document.getElementById('chatIn');
        const btns = document.querySelectorAll('.btn');
        btnChatIn.addEventListener('click', this.openChatRoom.bind(this));

    },

    openChatRoom: function(event){
        const companyCode = event.target.dataset.companycode;
        alert('채팅방 입장!');
        
    },
}
chatInit.init();