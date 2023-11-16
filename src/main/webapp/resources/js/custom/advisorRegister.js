const advisorRegister = {
    vesion: 1,
    isNickname: false,
    init: function () {
        const nickname = document.getElementById('advisorNickname');
        nickname.addEventListener('keyup', this.duplicateNickname.bind(this));

        const advisorRegisterForm = document.getElementById('advisorRegisterForm');
        advisorRegisterForm.addEventListener('submit', this.submitFormValidate.bind(this));

        const inputFile = document.getElementById('profilePhoto');
        inputFile.addEventListener('change', this.readURL.bind(this));
    },

    duplicateNickname: function (event) {
        let nicknameValue = event.target.value;

        if (nicknameValue.length > 4) {
            fetch('/advisor/register/duplicate?advisorNickname=' + nicknameValue)
                .then(response => response.json())
                .then(data => {
                    if (data.result > 0) {
                        alert('이미 사용중인 닉네임입니다.')
                        event.target.focus();

                    } else {
                        this.isNickname = true;
                        event.target.style.border = '1px solid green';
                    }
                })
                .catch(error => console.log(error));
        }

    },

    submitFormValidate: function (event) {
        event.preventDefault();
        let isCareer = true;
        let isFullName = true;
        let isPhoto = true;
        let isIntro = true;

        const formData = new FormData(event.currentTarget);
        let data = {};
        formData.forEach((value, key) => {
            data[key] = value;
        });

        if (!data.career.trim()) {
            alert('이력을 입력해주세요');
            return;
        }
        if (!data.fullName.trim()) {
            alert('이름을 입력해주세요');
            return;
        }
        if (!data.profilePhoto) {
            alert('사진을 등록해주세요');
            return;
        }
        if (!data.introduction.trim()) {
            alert('자기소개를 입력해주세요')
            return;
        }

        if (!this.isNickname) {
            alert('닉네임을 확인해주세요');
        } else {
            event.currentTarget.submit();
        }

    },

    readURL: function (event) { // input type="file" 가져오기'

        if (event.target.files) { // 파일이 선택된다면
            const reader = new FileReader(); // 파일리더 생성
            // 이벤트의 핸들러. 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.
            reader.onload = function (e) {
                event.target.previousElementSibling.src = e.target.result;
            }
            // 지정된 내용을 읽기 시작합니다  완료되면 속성 에 파일 데이터를 나타내는 
            // URL이 `result`포함됩니다
            reader.readAsDataURL(event.target.files[0]);
        } else {
            event.target.previousElementSibling.src = "";
        }
    }
};
advisorRegister.init();