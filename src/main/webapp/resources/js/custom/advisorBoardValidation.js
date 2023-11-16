const advisorBoardValidation = {
    version : 1,
    init : function(){
        const form = document.querySelector('#advisorBoardForm');
        form.addEventListener('submit', this.formSubmit.bind(this));

        document.getElementById('historyBack').addEventListener('click', ()=> history.back());
    },

    formSubmit: function (event){
        event.preventDefault();
        const title = document.querySelector('input[name=title]');
        const content = document.querySelector('textarea[name=content]');
        const isTitle = this.validateElement(title, '제목이 없습니다.');
        const isContent = this.validateElement(content, '내용이 없습니다.');

        if(isTitle && isContent){
            event.currentTarget.submit();
        }
    },

    validateElement : function(ele, msg){
        const value = ele.value.trim();
        if(!value){
            alert(msg);
            ele.focus();
            return false;
        }
        return true;
    },

    
};
advisorBoardValidation.init();