const advisorList = {
    version: 1,
    init: function () {
        const orderByArray = document.getElementsByClassName('orderBy');
        Array.from(orderByArray).forEach((ele) => {
            ele.addEventListener('click', this.advisorListOrderBy.bind(this));
        });
        const divContent = document.querySelectorAll('.ec-product-content');


        Array.from(divContent).forEach(ele => {
            ele.addEventListener('mouseover', this.hiddenAreaVisible.bind(this));
            ele.addEventListener('mouseout', this.hiddenAreaHidden.bind(this));
        });

    },

    advisorListOrderBy: function (event) {
        location.href = `/advisor/list?orderBy=${event.currentTarget.id}`;
    },

    hiddenAreaVisible: function (event) {
        const currentElement = event.currentTarget;
        const hiddenBlock = currentElement.querySelector('.pro-hidden-block');
        hiddenBlock.classList.add('visible');
        const card = currentElement.querySelector('.card');
        card.style.transition = 'height 0.3s ease-in-out';
        card.style.height = '420px';
    },

    hiddenAreaHidden: function (event) {
        const currentElement = event.currentTarget;
        const hiddenBlock = currentElement.querySelector('.pro-hidden-block');
        hiddenBlock.classList.remove('visible');
        const card = currentElement.querySelector('.card');
        card.style.transition = 'height 0.3s ease-in-out';
        card.style.height = '';

    }
}
advisorList.init();