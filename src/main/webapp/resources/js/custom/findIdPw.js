let $IdEmail = $("#IdEmail");
let $findIdBtn = $("#findIdBtn");
let $email = $("#pwEmail");
let $checkEmail = $("#checkEmail");
let $password = $("#password");
let $cpassword = $("#cpassword");
let $username = $("#pwUserName");
let $emailconfirm = $("#emconfirm");
let $emailconfirmTxt = $("#emailconfirmTxt");
let interval;

let findIdPw = {
    version: 1,

    init: function () {
        $('#findIdBtn').on('click', () => {
            this.findId();
        });
        $('#checkEmail').on('click', () => {
            this.checkEmail();
        });
/*        $('#emconfirm').on('keyup', () => {
            this.chkEmailConfirm();
        });*/
        $('.signUpForm').on('submit', () => {
            this.submitForm();
        });
    },

    findId: function () {
        const emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zAZ])*.[a-zA-Z]{2,3}$/i;

        if (!emailRegex.test($IdEmail.val())) {
            alert('이메일 형식을 확인해주세요 ex) Gstock@naver.com');
            $('#IdEmail').focus();
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/user/find-id",
            data: {
                "email": $IdEmail.val()
            },
            success: function (data) {
                if (data != null && data.trim() !== "") {
                    console.log("발송됨");
                    alert("해당 이메일로 아이디 발송이 완료되었습니다. \n확인부탁드립니다.");
                } else {
                    alert("이메일이 확인되지 않습니다. \n확인부탁드립니다.");
                }
            }
        });
    },

    checkEmail: function () {
        let idval = $username.val();
        let idvalcheck = /^[a-z0-9]+$/;
        if (!idvalcheck.test(idval) || idval.length < 4) {
            alert('아이디는 영소문자, 숫자로 된 4자 이상이어야 합니다.');
            $username.focus();
            return false;
        }

        const emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zAZ])*.[a-zA-Z]{2,3}$/i;

        if (!emailRegex.test($email.val())) {
            alert('이메일 형식을 확인해주세요 ex) Gstock@naver.com');
            $email.focus();
            return false;
        }

        $email.prop("disabled", true);
        $email.css("background", "#f3f3f3");
        $checkEmail.prop("disabled", true);
        $checkEmail.css("background", "#f3f3f3");
        $username.prop("disabled", true);
        $username.css("background", "#f3f3f3");

        $.ajax({
            type: "POST",
            url: "/user/find-pw",
            data: {
                "email": $email.val(),
                "username": $username.val()
            },
            success: function (data) {
                if (data != null && data.trim() !== "") {
                    $emailconfirm.css('display', '');
                    $emailconfirmTxt.css('display', '');
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
                    console.log(interval);
                } else {
                    alert("일치하는 정보의 유저가 없습니다. \n확인부탁드립니다.");
                }
            }
        });
    },

    submitForm: function () {
        $username.prop("disabled", false);

        let pwdval = $password.val();
        let pwdokval = $cpassword.val();
        let pwdcheck = /^[a-zA-Z0-9]+$/;

        if (!pwdcheck.test(pwdval) || pwdval.length < 8) {
            alert('비밀번호는 영대소문자, 숫자로 구성된 8글자 이상이어야 합니다.');
            $password.focus();
            return false;
        } else {
            if (pwdokval) {
                if (pwdval !== pwdokval) {
                    alert('비밀번호가 일치하지 않습니다.');
                    $cpassword.focus();
                    return false;
                }
            } else {
                alert('비밀번호 확인란을 입력하십시오.');
                $cpassword.focus();
                return false;
            }
        }

        if (!emailCheck) {
            alert('이메일 인증을 진행해주세요');
            $email.focus();
            return false;
        }
    },
}

findIdPw.init();


function updateTimer() {

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
			$("#pwEmail").prop("disabled", false);
			$("#pwEmial").css("background", "#f3f3f3");
			$("#checkEmail").prop("disabled", false);
			$("#checkEmail").css("background", "#f3f3f3");
			$("#pwUserName").prop("disabled", false);
			$("#pwUserName").css("background", "#f3f3f3");
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
			$password.css('display', '');
			$cpassword.css('display', '');
			emailCheck = true;
		}
	});
}

/*//아이디 찾기
$(document).ready(function() {
	$findIdBtn.click(function() {
		//이메일 유효성 검사
		const emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zAZ])*.[a-zA-Z]{2,3}$/i;

		if (!emailRegex.test($IdEmail.val())) {
			alert('이메일 형식을 확인해주세요 ex) Gstock@naver.com');
			$('#IdEmail').focus();
			return false;
		}

		//인증메일 보내기
		$.ajax({
			type: "POST",
			url: "/user/find-id",
			data: {
				"email": $IdEmail.val()
			},
			success: function(data) {
				if (data != null && data.trim() !== "") {
					console.log("발송됨");
					alert("해당 이메일로 아이디 발송이 완료되었습니다. \n확인부탁드립니다.");
				}
				else {
					alert("이메일이 확인되지 않습니다. \n확인부탁드립니다.");
				}
			}
		});
	});
});

//비밀번호 변경
$checkEmail.click(function() {

	//유저이름 유효성
	let idval = $('#pwUserName').val();
	let idvalcheck = /^[a-z0-9]+$/;
	if (!idvalcheck.test(idval) || idval.length < 4) {
		alert('아이디는 영소문자,숫자로 된 4자 이상이어야 합니다.');
		$('#userName').focus();
		return false
	}

	//이메일 유효성 검사
	const emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	if (!emailRegex.test($email.val())) {
		alert('이메일 형식을 확인해주세요 ex) Gstock@naver.com');
		$('#email').focus();
		return false;
	}

	$("#pwEmail").prop("disabled", true);
	$("#pwEmial").css("background", "#f3f3f3");
	$("#checkEmail").prop("disabled", true);
	$("#checkEmail").css("background", "#f3f3f3");
	$("#pwUserName").prop("disabled", true);
	$("#pwUserName").css("background", "#f3f3f3");

	//인증메일 보내기
	$.ajax({
		type: "POST",
		url: "/user/find-pw",
		data: {
			"email": $email.val(),
			"username": $username.val()
		},
		success: function(data) {

			if (data != null && data.trim() !== "") {
				$emailconfirm.css('display', '');
				$emailconfirmTxt.css('display', '');
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

				startTime2 = new Date().getTime() + 5 * 60 * 1000;
				interval = setInterval(updateTimer2, 1000);

				chkEmailConfirm(data, $emailconfirm, $emailconfirmTxt);
			} else {
				alert("일치하는 정보의 유저가 없습니다. \n확인부탁드립니다.");
			}
		}
	});
});

function updateTimer2() {

	const currentTime = new Date().getTime();
	const timeDifference = startTime2 - currentTime;

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
			$("#pwEmail").prop("disabled", false);
			$("#pwEmial").css("background", "#f3f3f3");
			$("#checkEmail").prop("disabled", false);
			$("#checkEmail").css("background", "#f3f3f3");
			$("#pwUserName").prop("disabled", false);
			$("#pwUserName").css("background", "#f3f3f3");
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
			$password.css('display', '');
			$cpassword.css('display', '');
			emailCheck = true;
		}
	});
}

$('.signUpForm').on('submit', () => {

	$("#pwUserName").prop("disabled", false);

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

	if (!emailCheck) {
		alert('이메일 인증을 진행해주세요');
		$('#email').focus();
		return false;
	}
});*/