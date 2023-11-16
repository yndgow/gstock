let signIn = {
	version: 1,
	
	init: function() {
		$('#signInBtn').on('click', () => {
			this.signIn();
		});
	},

	signIn: function() {
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
			url: "/user/sign-in",
			data: {
				"userName": idval,
				"password": pwval
			},
			success: function(data) {
				if (data === 200) {
					window.location.href = "http://localhost/main";
				} else if(data === 500) {
					alert('정지된 유저입니다. \n자세한 내용은 가입이메일을 확인해주세요.');
					$('#userName').focus();
				} else {
					alert('로그인실패. \n아이디 비밀번호를 다시 확인해주세요.');
					$('#userName').focus();
				}
			}
			, error: function() {
				alert('서버 에러입니다.');
			}
		});
	}
}

signIn.init();