/**
 * tab 을 구현하는 js
 */


const tabInit = {
    btnTabName: '.btnTab',
    divTabName: '.divTab',
    version: 1,
    init: function () {
        const btns = document.querySelectorAll(this.btnTabName);
        Array.from(btns).forEach((element) => element.addEventListener('click', this.handleTab.bind(this)));
    },
    handleTab: function (event) {
        const btnTarget = event.currentTarget;
        const btns = btnTarget.parentElement.children;
        const divs = document.querySelectorAll(this.divTabName);
        for (const item of btns) {
            item.classList.remove('btn-green');
        }
        Array.from(divs).forEach((element, index) => {
            element.classList.remove('active');
        });
        btnTarget.classList.add('btn-green');

        const divId = btnTarget.getAttribute('data-tab-target');
        document.querySelector(divId).classList.add('active')


    },
}
tabInit.init();