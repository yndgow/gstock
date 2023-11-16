/**
 * 주식 상세정보 웹소켓 js
 */
let stockWebSocketInit = {
  version: 1,
  receivedData: {},
  socket: null,
  init: function () {
    const btnGetDatas = document.getElementsByClassName('btnGetWebSocketData');
    Array.from(btnGetDatas).forEach(button => { // 클래스버튼 이벤트 달기
      button.addEventListener('click', (event) => {
        const mode = event.target.parentElement.parentElement;
        const onOffType = event.target.classList.contains('ec-fullscreen-off');
        let webSocketInterval;

        if (!this.isMarketOpen()) {
          //alert('장마감시간입니다.');
          //return;
        }

        mode.classList.toggle('active'); // 토글형식으로 on off

        if (onOffType) {
          // 오프 버튼을 누른 경우 (실행하기)
          this.setupWebSocket();
          webSocketInterval = setInterval(() => {
            if (this.receivedData != null) {
              this.updateElements(this.receivedData);
            }
          }, 1000); // 1초마다 설정 업데이트
        } else {
          // 온 버튼을 누른 경우 (실행 멈추기)
          this.socket.close();
          clearInterval(webSocketInterval);
        }
      });
    });
  },

  isMarketOpen: function () {
    const date = new Date();
    const nowDay = date.getDay();
    const nowHour = date.getHours();
    const nowMin = date.getMinutes();

    if (nowDay === 0 || nowDay === 6) {
      return false; // 주말
    }

    if (nowHour < 9 || (nowHour > 15) || (nowHour === 15 && nowMin > 20)) {
      return false; // 9시 이전 또는 15시 20분 이후
    }

    if (nowHour >= 15 && nowMin >= 20) {
      return false; // 15시 20분 이후
    }

    return true; // 정상적인 거래 시간
  },

  // 웹소켓 설정
  setupWebSocket: async function () {
    const companyCode = document.getElementById('companyCode').textContent.trim(); // 종목코드
    const originElements = document.getElementsByClassName('changeElementArray'); // 실시간으로 변화시킬 element

    // 웹 소켓키 받기
    await fetch('/stock/approvalKey')
      .then((response) => response.json())
      .then(({ webSocketKey }) => {
        this.socket = new WebSocket('ws://ops.koreainvestment.com:21000/'); // WebSocket 연결 생성
        // 연결 성공
        this.socket.addEventListener('open', () => {
          this.socket.send(this.createInitialData(companyCode, webSocketKey));
        });
        // 메시지 수신
        this.socket.addEventListener('message', (event) => {
          this.handleWebSocketMessage(event, originElements);
        });
        this.socket.addEventListener('close', () => {
          console.log('WebSocket connection closed');
        });
      });
  },

  // 초기 데이터 생성
  createInitialData: function (companyCode, webSocketKey) {
    return JSON.stringify({
      header: {
        approval_key: webSocketKey,
        custtype: 'P',
        tr_type: '1',
        'content-type': 'utf-8',
      },
      body: {
        input: {
          tr_id: 'H0STCNT0',
          tr_key: companyCode,
        },
      },
    });
  },

  // 웹소켓 메시지 파싱
  handleWebSocketMessage: function (event, originElements) {
    const data = event.data;
    if (data[0] === '0' || data[0] === '1') {
      const strArray = data.split('|'); // | 로 나누기
      const trid = strArray[1]; // 2번째 값 trid
      let bodydata = strArray[3]; // 4번째 부터 body
      const strResult = bodydata.split('^'); // ^ 로 나누기
      let prdy_vrss_sign = strResult[3]; // 전일 대비 부호

      // 현재가 고가 거래량 전일대비 등락률 시가 저가 거래대금(백만)
      const changeElementArray = [strResult[2], strResult[8], strResult[13], strResult[4], strResult[5], strResult[7], strResult[9], strResult[14]];

      this.receivedData.originElements = originElements;
      this.receivedData.changeElementArray = changeElementArray;
      this.receivedData.vrssNum = Number(prdy_vrss_sign);
    }
  },

  // 엘리먼트 변경
  updateElements: function ({ originElements, changeElementArray, vrssNum }) {
    const colorClasses = ['primaryColorRed', 'primaryColorBlue', 'primaryColorNone'];
    for (let i = 0; i < originElements.length; i++) {
      const element = originElements[i];
      element.classList.remove(...colorClasses);
      if (i === 0 || i === 3 || i === 4) {
        let colorClass = '';
        if (vrssNum < 3) {
          colorClass = colorClasses[0];
        } else if (vrssNum === 3) {
          colorClass = colorClasses[2];
        } else {
          colorClass = colorClasses[1];
        }

        if (i === 3 && vrssNum < 3) {
          const beforeElement = document.createElement('before');
          beforeElement.style.content = '▲'; // 가상 요소 내용 설정
          element.appendChild(beforeElement);
        }

        element.classList.add(colorClass);
      }

      if (i == 7) {
        const acmlTrPbmn = Number(changeElementArray[i]);
        if (acmlTrPbmn > 1000000) {
          element.textContent = Math.ceil(acmlTrPbmn / 1000000).toLocaleString();
        } else {
          element.textContent = Number(acmlTrPbmn).toLocaleString();
        }
      } else {
        element.textContent = Number(changeElementArray[i]).toLocaleString();
      }
    }
  },
};
stockWebSocketInit.init();
