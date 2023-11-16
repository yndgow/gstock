let emailCheck = false;
let idCheck = false;
let telCheck = false;
let startTime;
let $email = $("#email");
let $emailconfirm = $("#emconfirm"); // 인증번호 확인input
let $emailconfirmTxt = $("#emailconfirmTxt"); // 인증번호 확인 txt
let $pEmail = $("#pEmail");
let $checkEmail = $("#checkEmail");
let interval;


let modifyUser = {
	version: 1,
	
	init: function() {
		$('#checkId').on('click', () => {
			this.checkId();
		});
		$('#checkEmail').on('click', () => {
			this.checkEmail();
		});
		$('#emconfirm').on('keyup', () => {
			this.chkEmailConfirm();
		});
		$('.signUpForm').on('submit', (event) => {
			event.preventDefault();
		    if (modifyUser.submitForm()) {
		        $('.signUpForm')[0].submit();
		    }
		});
		$('#deleteUserBtn').on('click', () => {
			this.deleteUser();
		});
	},
	
	checkId: function() {
		let idval = $('#userName').val();
		let pval = $('#pName').val();
		let idvalcheck = /^[a-z0-9]+$/;
		if (!idvalcheck.test(idval) || idval.length < 4) {
			alert('아이디는 영소문자,숫자로 된 4자 이상이어야 합니다.');
			$('#userName').focus();
			return false
		}
	
		if (idval == pval) {
			alert('기존 아이디와 같습니다.')
			$('#userName').focus();
			return false;
		}
	
		$.ajax({
			type: "POST",
			url: "/user/duplicate-check",
			data: {
				"username": idval
			},
			success: function(data) {
				if (data === 200) {
					alert('사용 가능한 아이디입니다.');
					idCheck = true;
					$("#checkId").prop("disabled", true);
					$("#checkId").css("background", "#bbbbbb");
					$("#userName").prop("readonly", true);
					$("#userName").css("background", "#f3f3f3");
				} else {
					alert('사용중인 아이디 입니다.');
					$('#userName').focus();
				}
			}
			, error: function() {
				alert('서버 에러입니다.');
			}
		});
	},
	
	checkEmail: function() {

		
		//이메일 유효성 검사
		const emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
		if (!emailRegex.test($email.val())) {
			alert('이메일 형식을 확인해주세요 ex) Gstock@naver.com');
			$('#email').focus();
			return false;
		}
	
		if ($email.val() == $pEmail.val()) {
			alert('기존 이메일과 같습니다.')
			$('#email').focus();
			return false;
		}
	
		//인풋창 활성화
		$emailconfirm.css('display', '');
		$emailconfirmTxt.css('display', '');
	
		//인증메일 보내기
		$.ajax({
			type: "POST",
			url: "/user/email-duplicate-check",
			data: {
				"email": $email.val()
			},
			success: function(data) {
				if (data === 200) {
					$.ajax({
						type: "POST",
						url: "/user/mail-confirm",
						data: {
							"email": $email.val()
						},
						success: function(data) {
							alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n확인부탁드립니다.");
							$emailconfirmTxt.html("<span id='emconfirmchk'>인증번호가 발송되었습니다</span>")
							$("#emconfirmchk").css({
								"color": "green",
								"font-weight": "bold",
								"font-size": "12px"
							});
	
							$("#timer2").css({
								"color": "#7800f7",
								"font-weight": "bold",
								"font-size": "12px"
							});
	
							startTime = new Date().getTime() + 5 * 60 * 1000;
							interval = setInterval(updateTimer, 1000);
	
							chkEmailConfirm(data, $emailconfirm, $emailconfirmTxt);
						}
					});
				} else {
					alert('사용중인 이메일 입니다.');
					$('#email').focus();
				}
			}
			, error: function() {
				alert('서버 에러입니다.');
			}
		});
	},
	
	chkEmailConfirm: function(data, $emailconfirm, $emailconfirmTxt) {
		$("#email").prop("readonly", true);
		$("#email").css("background", "#f3f3f3");
		if ($("#timer2").text() === "시간 종료") {
			$emailconfirmTxt.html("<span id='emconfirmchk'>시간이 초과되었습니다</span>");
			$("#emconfirmchk").css({
				"color": "#FA3E3E",
				"font-weight": "bold",
				"font-size": "12px"
			});
			$("#timer2").css({
				"color": "white",
			});
			clearInterval(interval);
			return false;
		}
		if (data != $emailconfirm.val()) {
			$emailconfirmTxt.html("<span id='emconfirmchk'>인증번호가 잘못되었습니다</span>");
			$("#emconfirmchk").css({
				"color": "#FA3E3E",
				"font-weight": "bold",
				"font-size": "12px"
			});
		} else {
			clearInterval(interval);
			$emailconfirmTxt.html("<span id='emconfirmchk'>인증번호 확인 완료</span>");
			$("#emconfirmchk").css({
				"color": "#0D6EFD",
				"font-weight": "bold",
				"font-size": "12px"
			});
			$("#timer2").css({
				"display": "none"
			});
			$("#emconfirm").prop("disabled", true);
			$("#emconfirm").css("background", "#f3f3f3");
			$("#checkEmail").prop("disabled", true);
			$("#checkEmail").css("background", "#f3f3f3");
			emailCheck = true;
		}
	},
	
	submitForm : function() {
		let idval = $('#userName').val();
		let pval = $('#pName').val();
		let pwdval = $('#password').val();
		let pwdokval = $('#cpassword').val();
		let pwdcheck = /^[a-zA-Z0-9]+$/;
	
		if (!pwdcheck.test(pwdval) || pwdval.length < 8) {
			alert('비밀번호는 영대소문자, 숫자로 구성된 8글자 이상이어야 합니다.');
			$('#password').focus();
			return false;
		} else {
			if (pwdokval) {
				if (pwdval !== pwdokval) {
					alert('비밀번호가 일치하지 않습니다.');
					$('#cpassword').focus();
					return false;
				}
			} else {
				alert('비밀번호 확인란을 입력하십시오.');
				$('#cpassword').focus();
				return false;
			}
		}
	
		let dateval = $('#bDate').val();
		const dateRegex = /^\d{4}\d{2}\d{2}$/; // YYYYMMDD 형식의 정규식
		const dateRegex2 = /^\d{4}-\d{2}-\d{2}$/; // YYYY-MM-DD 형식의 정규식
		const dateRegex3 = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/; // YYYYMMDD 각 자리에 유효한 생년월일인지 확인
		const dateRegex4 = /^(19|20)\d{2}-(0[1-9]|1[0-2])-([0-2][1-9]|3[01])$/; // YYYY-MM-DD 각 자리에 유효한 생년월일인지 확인
	
		if (dateRegex.test(dateval) || dateRegex2.test(dateval)) {
			if (dateRegex3.test(dateval) || dateRegex4.test(dateval)) {
				if (dateRegex.test(dateval)) {
					const year = dateval.substr(0, 4);
					const month = dateval.substr(4, 2);
					const day = dateval.substr(6, 2);
					dateval = year + '-' + month + '-' + day
					$('#bDate').val(dateval);
				}
			}
			else {
				alert('생년월일 숫자를 확인해주세요');
				$('#bDate').focus();
				return false;
			}
		} else {
			alert('생년월일 형식을 확인해주세요 ex)1989-11-12');
			$('#bDate').focus();
			return false
		}
	
		let telval = $('#tel').val();
		let telvalcheck = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
	
		if (!telvalcheck.test(telval)) {
			alert('전화번호 양식이 맞지 않습니다 ex) 01040618333');
			$('#tel').focus();
			return false
		}
	
		if (!idCheck && idval != pval) {
			alert('아이디 중복검사를 해주세요');
			$('#username').focus();
			return false;
		}
	
		if (!emailCheck && $email.val() != $pEmail.val()) {
			alert('이메일 인증을 진행해주세요');
			$('#email').focus();
			return false;
		}
		
		return true;
	},
	
	deleteUser: function() {
		var $id = $("#userId").val();
		
		if (confirm("정말 탈퇴하시겠습니까?") == true) {
			window.location.href = "http://localhost/user/delete/?id=" + $id;
		}
		else {
			return false
		}
	},
	
	updateTimer: function() {

		const currentTime = new Date().getTime();
		const timeDifference = startTime - currentTime;
	
		if (timeDifference <= 0) {
			$("#timer2").text("시간 종료");
			$("#timer2").css({
				"color": "red"
			});
			$emailconfirmTxt.html("<span id='emconfirmchk'>시간이 초과되었습니다</span>");
			$("#emconfirmchk").css({
				"color": "#FA3E3E",
				"font-weight": "bold",
				"font-size": "12px"
			});
			clearInterval(interval);
		} else {
			const minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
			const seconds = Math.floor((timeDifference % (1000 * 60)) / 1000);
			$("#timer2").text(minutes + ":" + (seconds < 10 ? '0' : '') + seconds);
		}
	}
}

modifyUser.init();

/*//아이디 중복확인
$('#checkId').on('click', () => {

	let idvalcheck = /^[a-z0-9]+$/;
	if (!idvalcheck.test(idval) || idval.length < 4) {
		alert('아이디는 영소문자,숫자로 된 4자 이상이어야 합니다.');
		$('#userName').focus();
		return false
	}

	if (idval == pval) {
		alert('기존 아이디와 같습니다.')
		$('#userName').focus();
		return false;
	}

	$.ajax({
		type: "POST",
		url: "/user/duplicate-check",
		data: {
			"username": idval
		},
		success: function(data) {
			if (data === 200) {
				alert('사용 가능한 아이디입니다.');
				idCheck = true;
				$("#checkId").prop("disabled", true);
				$("#checkId").css("background", "#bbbbbb");
				$("#userName").prop("readonly", true);
				$("#userName").css("background", "#f3f3f3");
			} else {
				alert('사용중인 아이디 입니다.');
				$('#userName').focus();
			}
		}
		, error: function() {
			alert('서버 에러입니다.');
		}
	});
});


//이메일확인
var $email = $("#email");
var $checkEmail = $("#checkEmail"); // 인증번호 발송 버튼
var $emailconfirm = $("#emconfirm"); // 인증번호 확인input
var $emailconfirmTxt = $("#emailconfirmTxt"); // 인증번호 확인 txt
var $pEmail = $("#pEmail");
let interval2;

$checkEmail.click(function() {

	//이메일 유효성 검사
	const emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	if (!emailRegex.test($email.val())) {
		alert('이메일 형식을 확인해주세요 ex) Gstock@naver.com');
		$('#email').focus();
		return false;
	}

	if ($email.val() == $pEmail.val()) {
		alert('기존 이메일과 같습니다.')
		$('#email').focus();
		return false;
	}

	//인풋창 활성화
	$emailconfirm.css('display', '');
	$emailconfirmTxt.css('display', '');

	//인증메일 보내기
	$.ajax({
		type: "POST",
		url: "/user/email-duplicate-check",
		data: {
			"email": $email.val()
		},
		success: function(data) {
			if (data === 200) {
				$.ajax({
					type: "POST",
					url: "/user/mail-confirm",
					data: {
						"email": $email.val()
					},
					success: function(data) {
						alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n확인부탁드립니다.");
						$emailconfirmTxt.html("<span id='emconfirmchk'>인증번호가 발송되었습니다</span>")
						$("#emconfirmchk").css({
							"color": "green",
							"font-weight": "bold",
							"font-size": "12px"
						});

						$("#timer2").css({
							"color": "#7800f7",
							"font-weight": "bold",
							"font-size": "12px"
						});

						startTime = new Date().getTime() + 5 * 60 * 1000;
						interval = setInterval(updateTimer2, 1000);

						chkEmailConfirm(data, $emailconfirm, $emailconfirmTxt);
					}
				});
			} else {
				alert('사용중인 이메일 입니다.');
				$('#email').focus();
			}
		}
		, error: function() {
			alert('서버 에러입니다.');
		}
	});
});

function updateTimer2() {

	const currentTime = new Date().getTime();
	const timeDifference = startTime - currentTime;

	if (timeDifference <= 0) {
		$("#timer2").text("시간 종료");
		$("#timer2").css({
			"color": "red"
		});
		$emailconfirmTxt.html("<span id='emconfirmchk'>시간이 초과되었습니다</span>");
		$("#emconfirmchk").css({
			"color": "#FA3E3E",
			"font-weight": "bold",
			"font-size": "12px"
		});
		clearInterval(interval);
	} else {
		const minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
		const seconds = Math.floor((timeDifference % (1000 * 60)) / 1000);
		$("#timer2").text(minutes + ":" + (seconds < 10 ? '0' : '') + seconds);
	}
}

function chkEmailConfirm(data, $emailconfirm, $emailconfirmTxt) {
	$emailconfirm.on("keyup", function() {
		$("#email").prop("readonly", true);
		$("#email").css("background", "#f3f3f3");
		if ($("#timer2").text() === "시간 종료") {
			$emailconfirmTxt.html("<span id='emconfirmchk'>시간이 초과되었습니다</span>");
			$("#emconfirmchk").css({
				"color": "#FA3E3E",
				"font-weight": "bold",
				"font-size": "12px"
			});
			$("#timer2").css({
				"color": "white",
			});
			clearInterval(interval);
			return false;
		}
		if (data != $emailconfirm.val()) {
			$emailconfirmTxt.html("<span id='emconfirmchk'>인증번호가 잘못되었습니다</span>");
			$("#emconfirmchk").css({
				"color": "#FA3E3E",
				"font-weight": "bold",
				"font-size": "12px"
			});
		} else {
			clearInterval(interval);
			$emailconfirmTxt.html("<span id='emconfirmchk'>인증번호 확인 완료</span>");
			$("#emconfirmchk").css({
				"color": "#0D6EFD",
				"font-weight": "bold",
				"font-size": "12px"
			});
			$("#timer2").css({
				"display": "none"
			});
			$("#emconfirm").prop("disabled", true);
			$("#emconfirm").css("background", "#f3f3f3");
			$("#checkEmail").prop("disabled", true);
			$("#checkEmail").css("background", "#f3f3f3");
			emailCheck = true;
		}
	});
}


//유효성 검사
$('.signUpForm').on('submit', () => {

	let pwdval = $('#password').val();
	let pwdokval = $('#cpassword').val();
	let pwdcheck = /^[a-zA-Z0-9]+$/;

	if (!pwdcheck.test(pwdval) || pwdval.length < 8) {
		alert('비밀번호는 영대소문자, 숫자로 구성된 8글자 이상이어야 합니다.');
		$('#password').focus();
		return false;
	} else {
		if (pwdokval) {
			if (pwdval !== pwdokval) {
				alert('비밀번호가 일치하지 않습니다.');
				$('#cpassword').focus();
				return false;
			}
		} else {
			alert('비밀번호 확인란을 입력하십시오.');
			$('#cpassword').focus();
			return false;
		}
	}

	let dateval = $('#bDate').val();
	const dateRegex = /^\d{4}\d{2}\d{2}$/; // YYYYMMDD 형식의 정규식
	const dateRegex2 = /^\d{4}-\d{2}-\d{2}$/; // YYYY-MM-DD 형식의 정규식
	const dateRegex3 = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/; // YYYYMMDD 각 자리에 유효한 생년월일인지 확인
	const dateRegex4 = /^(19|20)\d{2}-(0[1-9]|1[0-2])-([0-2][1-9]|3[01])$/; // YYYY-MM-DD 각 자리에 유효한 생년월일인지 확인

	if (dateRegex.test(dateval) || dateRegex2.test(dateval)) {
		if (dateRegex3.test(dateval) || dateRegex4.test(dateval)) {
			if (dateRegex.test(dateval)) {
				const year = dateval.substr(0, 4);
				const month = dateval.substr(4, 2);
				const day = dateval.substr(6, 2);
				dateval = year + '-' + month + '-' + day
				$('#bDate').val(dateval);
			}
		}
		else {
			alert('생년월일 숫자를 확인해주세요');
			$('#bDate').focus();
			return false;
		}
	} else {
		alert('생년월일 형식을 확인해주세요 ex)1989-11-12');
		$('#bDate').focus();
		return false
	}

	let telval = $('#tel').val();
	let telvalcheck = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;

	if (!telvalcheck.test(telval)) {
		alert('전화번호 양식이 맞지 않습니다 ex) 01040618333');
		$('#tel').focus();
		return false
	}

	if (!idCheck && idval != pval) {
		alert('아이디 중복검사를 해주세요');
		$('#username').focus();
		return false;
	}

	if (!emailCheck && $email.val() != $pEmail.val()) {
		alert('이메일 인증을 진행해주세요');
		$('#email').focus();
		return false;
	}

	 if(!telCheck) {
		alert('핸드폰 인증을 진행해주세요');
		$('#tel').focus();
		return false;
	} 

});

//회원탈퇴
var $deleteUserBtn = $("#deleteUserBtn");
var $id = $("#userId").val();

$deleteUserBtn.click(function() {
	if (confirm("정말 탈퇴하시겠습니까?") == true) {
		window.location.href = "http://localhost/user/delete/?id=" + $id;
	}
	else {
		return false
	}
});*/