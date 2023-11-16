let adminUser = {

	version: 1,

	init: function() {
		$('#search-btnn').on('click', () => {
			console.log('listem click');
			this.searchUser();
		});
	},

	searchUser: function() {
		let search = $('#c-search-input').val();
		console.log('In Search');
		console.log(search);
		if (search === '') {
			alert('검색할 유저이름을 입력해주세요.');
			return false;
		}
		console.log('true');
		$('#search-frm')[0].submit();
	}
}

adminUser.init();