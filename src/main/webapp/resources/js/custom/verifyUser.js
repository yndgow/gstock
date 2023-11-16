let verifyUser = {
	version: 1,
	
	init: function() {
		$('#signInBtn').on('click', () => {
			this.verifyUser();
		});
	},

	verifyUser: function() {
		//유효성
		let idval = $('#userName').val();
		let pwval = $('#password').val();
		let idvalcheck = /^[a-z0-9]+$/;
		if (!idvalcheck.test(idval) || idval.length < 4) {
			alert('아이디는 영소문자,숫자로 된 4자 이상이어야 합니다.');
			$('#userName').focus();
			return false
		}
		if (pwval.length < 1) {
			alert('비밀번호를 입력하세요.');
			$('#password').focus();
			return false
		}

		$.ajax({
			type: "POST",
			url: "/user/verify-user",
			data: {
				"userName": idval,
				"password": pwval
			},
			success: function(data) {
				if (data === 200) {
					window.location.href = "http://localhost/user/user-info";
				} else {
					alert('유저 인증 실패. \n아이디 비밀번호를 다시 확인해주세요.');
					$('#userName').focus();
				}
			}
			, error: function() {
				alert('서버 에러입니다.');
			}
		});
	}
}

verifyUser.init();