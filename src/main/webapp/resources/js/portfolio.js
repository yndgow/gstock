$(document).ready(function() {
	setSmallCard();
	//setModal();
});

// 로그인한 유저의 portfolio 를 표시해주는 smallCard 를 set. 
async function setSmallCard() {
	let userId = await $.get('portfolio/getUserid', function(data) {
	})
	$.get('portfolio/getMyPortfolioList/' + userId, function(data) {
		$('#addStock').on('click', () => addStockClicked());
		makeSmallCard(data);
	})

}

// smallCard 를 만들어주는 부분.
// 4개까지 포트폴리오를 만들 수 있고, 3개까지 addPortfolio 카드가 나온다.
function makeSmallCard(data) {
	if (data.length == 0) {
		makeAddPortfolioDiv();
	} else {
		let count = 0;
		data.forEach((e, idx) => {
			let pid = e.pid;
			let isvisible = '';
			let privacyP = $('<p style = "display : inline-block" id = "privacy_' + pid + '"></p>');
			if (e.visible) {
				isvisible = 'public';
				privacyP.css('color', 'green');
			} else {
				isvisible = 'private';
				privacyP.css('color', 'red');
			}
			privacyP.html(isvisible);
			count++;
			let smallCardInnerWrapper = $('<div id="' + pid + '" class="col-xl-3 col-sm-6 p-b-15 lbl-card" data-clicked="false">');
			let smallCard = $('<div id = "smallCardC_' + pid + '" class="card card-mini dash-card card-1"style="cursor : pointer;height : 100%">');
			smallCard.on('click', () => smallCardClicked(pid));
			let cardBody = $('<div style="display:flex; justify-content: space-between;" class="card-body" id="smallCard_' + pid + '">');
			let infoWrapper = $('<div id = "infoWrpper">')
			let h2 = $('<h2 class = "editableH2s" id = "h2_' + pid + '" class="mb-1">'); // CardLayout header
			let p = $('<p class = "editablePs" id = "p_' + pid + '">') // CardLayout body
			let span = $('<span data-clicked="false" class = "editSpans" id="span_' + pid + '" style="height : 20%;width : 15%;cursor: pointer;background-color: #8eb7e3; font-size: smaller;line-height: 250%;">수정</span>');
			span.on('click', (event) => {
				event.stopImmediatePropagation();
				editClicked(pid);
			});
			// h2 p span 은 card-body 안에
			$('#smallCardOuterWrapper').append(smallCardInnerWrapper); // smallCardInnerWrapper를 smallCardOuterWrapper에 추가
			smallCardInnerWrapper.append(smallCard);
			smallCard.append(cardBody);
			infoWrapper.append(h2);
			h2.html(e.title);
			infoWrapper.append(p);
			infoWrapper.append(privacyP);
			cardBody.append(infoWrapper);
			p.html(e.discription); // 또는 원하는 데이터를 여기에 설정
			privacyP.on('click', (event) => {
				event.stopImmediatePropagation();
				privacyClicked(pid);
			});
			cardBody.append(span);
		})
		if (count < 4) {
			makeAddPortfolioDiv();
		}
	}
}


// addPortfolio small Card 를 만듦.
function makeAddPortfolioDiv() {
	let smallCardInnerWrapper = $('<div id = "addCard" class="col-xl-3 col-sm-6 p-b-15 lbl-card" data-clicked = "false">');
	let smallCard = $('<div class="card card-mini dash-card card-1"style="cursor : pointer">');
	let cardBody = $('<div class="card-body justify-content-center">');
	let plusIcon = $('<div class = "mdi mdi-shape-square-plus"style="display:flex;justify-content: center;font-size: 2.5rem;">');
	// h2 p span 은 card-body 안에
	$('#smallCardOuterWrapper').append(smallCardInnerWrapper); // smallCardInnerWrapper를 smallCardOuterWrapper에 추가
	smallCardInnerWrapper.append(smallCard);
	smallCard.append(cardBody);
	cardBody.append(plusIcon);
	cardBody.append($('<p style = "text-align:center">포트폴리오 추가</p>'));
	smallCard.on('click', () => smallCardClicked('addCard'));
}


// 확인 버튼을 누르면 edit 실행.
function saveButtonClicked(title, discription) {
	if (title == '' || discription == '' || title.trim() == '' || discription.trim() == '' || title == null || discription == null) {
		alert('값이 비었습니다.');
		return;
	}
	// 포트폴리오 저장 로직
	$.ajax({
		url: 'portfolio/addPortfolio',
		method: 'post',
		contentType: 'application/json',
		dataType: 'json',
		data: JSON.stringify({ 'title': title, 'discription': discription }),
		success: (data) => {
			location.reload();
		}
	});
}
//---------------- end of small Card---------------------------------------


//---------------- start of display ---------------------------------------
//smallCard 가 click 되면 해당 포트폴리오의 정보가 모두 다시 뿌려져야 한다.
function smallCardClicked(id) {
	var elements = $(".col-xl-3.col-sm-6.p-b-15.lbl-card");
	// class Checker
	let checker = new Checker(id, elements);
	if (!checker.anyOfClickedBool()) {
		if (id == "addCard") {
			addCardClicked();
			$('#' + id).attr('data-clicked', 'true');
			return;
		} else {
			$('#' + id).attr('data-clicked', 'true');
			attatchPortfolioInfo(id);
			return;
		}
	}
	if (checker.checkSelfClicked()) {
		if (id == "addCard") {
			detatchAll();
			$('#' + id).attr('data-clicked', 'false');
		} else {
			detatchAll();
			$('#' + id).attr('data-clicked', 'false');
		}
		return;
	}
	if (
		!checker.checkSelfClicked() &&
		checker.anyOfClickedBool()
	) {
		//$('#portfolioRegWrapper').remove();
		// detatchAll(); attatch(); if(addCard) => addCardClicked() else attatch()  attatch 의 경우 차트와 orderReport, 및 모두를 없애야됨.
		// 만약 addCard 클릭시에는 이 if 문이 실행되었을 경우 다른애들이 detatchALl 을 실행하고 해야됨. addCard 말고 실행될시에도 다른애들 다 없애고 attatch().
		if (id == 'addCard') {
			elements.each((idx, e) => e.setAttribute("data-clicked", "false"));
			$('#' + id).attr('data-clicked', 'true');
			detatchAll();
			addCardClicked();
		} else {
			elements.each((idx, e) => e.setAttribute("data-clicked", "false"));
			detatchAll();
			$('#' + id).attr('data-clicked', 'true');
			attatchPortfolioInfo(id);
		}
		//$('#' + id).attr('data-clicked', 'true');
		return;
	}
}

// portfolioInfo 를 붙인다. 포폴정보, 보유주식, 거래내역, 랭킹등이 표시된다.
function attatchPortfolioInfo(id) {
	$.get('portfolio/getAllDataInfo/' + id, function(data) {
		if (data == null) {
		} else {
			setPortfolioInfo(data);
			setRanking();
			setMyStock(data);
			setTradeLog(data);
			setMonthlyAssetChart(data.pid);
			if (data.stockList.length == 0) {
				$('#donutChartBody').append($('<div style = "font-weight : bold; font-size : large;color:black;">' + '주식을 추가해주세요.' + '</div>'));
				$('#myStockCardTable').append($('<div style = "border:none; font-weight : bold; font-size : large">' + '주식을 추가해주세요.' + '</div>'));
				return;
			}
			setDonutChart(data);
		}
	})
}

// 포폴의 정보.
async function setPortfolioInfo(data) {
	let sellMoney = 0;
	if (data.sellMoney != null) {
		sellMoney = data.sellMoney;
	}
	let stockTotalAmount = 0;
	for (let i = 0; i < data.stockList.length; i++) {
		let nowprice = await $.get('portfolio/getNowPrice/' + data.stockList[i].companyCode, function(data) {
		})
		stockTotalAmount += data.stockList[i].amount * nowprice;
	}
	let rorData = ((stockTotalAmount + sellMoney - data.totalAsset) / data.totalAsset) * 100;
	let portfolioInfoWrapper = $('<div id = "portfolioInfoWrapper" style = "width : 100%; height :90%;margin:auto">');
	$('#portfolioInfo').append(portfolioInfoWrapper);
	let keyArr = ['제목', '설명', '현재자산', '판매금', '총자산', '보유주식량', '수익률'];
	keyArr.forEach((e, idx) => {
		let div = $('<div id="infoRows_' + idx + '" style="margin-bottom : 5%;width : 100%;display: flex; height: 10%;">');
		if (e == "ROR") { div.css('heigth', '20%') }
		div.append($('<div style = "width : 50%;height:100%;">' + e + '</div>'));
		portfolioInfoWrapper.append(div);
	});
	$('#infoRows_0').append($('<div style = "font-weight : bold;width : 50%; height : 100%;">' + data.title + '</div>'));
	$('#infoRows_1').append($('<div style = "font-weight : bold;width : 50%; height : 100%;">' + data.discription + '</div>'));
	$('#infoRows_2').append($('<div style = "font-weight : bold;width : 50%; height : 100%;">' + numberWithCommas(stockTotalAmount + data.sellMoney) + '</div>'));
	$('#infoRows_3').append($('<div style = "font-weight : bold;width : 50%; height : 100%;">' + numberWithCommas(data.sellMoney) + '</div>'));
	$('#infoRows_4').append($('<div style = "font-weight : bold;width : 50%; height : 100%;">' + numberWithCommas(data.sellMoney + data.totalAsset) + '</div>'));
	$('#infoRows_5').append($('<div style = "font-weight : bold;width : 50%; height : 100%;">' + numberWithCommas(stockTotalAmount) + '</div>'));
	$('#infoRows_6').append($('<div style = "font-weight : bold;font-size : larger; color : red;width : 50%; height : 100%;">' + rorData.toFixed(2) + '%</div>'));

	//portfolioInfoWrapper.append(infoWrapper);
}


//CardHeader 에 portfolio 정보를 입력한다.
//addCard 가 아닌 다른 smallCards 가 클릭될 시 실행된다.

async function setDonutChart(data) {
	let stockTotalAmount = 0;
	for (let i = 0; i < data.stockList.length; i++) {
		let nowprice = await $.get('portfolio/getNowPrice/' + data.stockList[i].companyCode, function(data) {
		})
		stockTotalAmount += data.stockList[i].amount * nowprice;
	}
	$('#donutChartBody').append($('<canvas id="doChart"></canvas>'));
	let stockNameList = [];
	let amountList = [];
	data.stockList.forEach(stock => {
		stockNameList.push(stock.companyName);
		amountList.push(stock.amount * stock.price);
	});
	let colorList = ["#88aaf3", "#50d7ab", "#9586cd", "#f3d676", "#ed9090", "#a4d9e5", "#a4d9e5", "#a4d9e5", "#a4d9e5", "#a4d9e5"];
	let doughnut = document.getElementById("doChart");
	if (doughnut !== null) {
		let myDoughnutChart = new Chart(doughnut, {
			type: "doughnut",
			data: {
				labels: stockNameList,
				datasets: [
					{
						label: stockNameList,
						data: amountList,
						backgroundColor: colorList.slice(0, stockNameList.length),
						borderWidth: 1
						// borderColor: ['#88aaf3','#29cc97','#8061ef','#fec402']
						// hoverBorderColor: ['#88aaf3', '#29cc97', '#8061ef', '#fec402']
					}
				]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				legend: {
					display: false
				},
				cutoutPercentage: 75,
				tooltips: {
					callbacks: {
						title: function(tooltipItem, data) {
							return "Order : " + data["labels"][tooltipItem[0]["index"]];
						},
						label: function(tooltipItem, data) {
							return data["datasets"][0]["data"][tooltipItem["index"]];
						}
					},
					titleFontColor: "#888",
					bodyFontColor: "#555",
					titleFontSize: 12,
					bodyFontSize: 14,
					backgroundColor: "rgba(256,256,256,0.95)",
					displayColors: true,
					borderColor: "rgba(220, 220, 220, 0.9)",
					borderWidth: 2
				}
			}
		});
	}
	$('#donutChartBody').append($('<div id="donutCenterText" style="position: absolute; top: 55%; left: 50%; transform: translate(-50%, -50%); font-size: 24px;">' + numberWithCommas(stockTotalAmount + data.sellMoney) + '</div>'));
}

function setRanking() {
	$.get('portfolio/getRanking', function(data) {
		//let width = $('#user-acquisition').css('width');
		let rankingWrapper = $('<div id = "rankingBodyInner" style = "margin : auto;display:grid; grid-template-columns : 1fr 1fr 1fr; grid-gap : 1%;">')
		$('#rankingBody').append(rankingWrapper);
		let thArr = ['랭킹', '제목', '수익률'];
		thArr.forEach(e => {
			rankingWrapper.append($('<div class="ths" style = "text-align:center;">' + e + '</div>'));
		});
		data.forEach((e, idx) => {
			rankingWrapper.append('<div style = "text-align:center;white-space: nowrap; overflow: hidden;text-overflow: ellipsis;">' + (idx + 1) + '</div>');
			let title = $('<div data-bs-toggle="modal" data-bs-target="#modalContact" class="view-detail" style = "text-align:center;white-space: nowrap; overflow: hidden;text-overflow: ellipsis; cursor : pointer">' + e.title + '</div>')
			rankingWrapper.append(title);
			rankingWrapper.append('<div style = "text-align:center;white-space: nowrap; overflow: hidden;text-overflow: ellipsis;">' + e.ror + '%</div>');
			title.on('click', () => titleClicked(e.pid, idx + 1));
		});
	});
}

function titleClicked(pid, rank) {
	$.get('portfolio/getMyPortfolioInfo/' + pid, function(data) {
		$('#user_rank').html(rank);
		$('#modal_pfName').html(data.title);
		$('#modal_pfDisc').html(data.discription);
		$('#modal_ror').html(data.ror);
		$('#modal_pfReg').html(data.regDate.slice(0, 10));

		if ($('#rankingDoChart').length > 0) {
			$('#rankingDoChart').remove();
		}
		$('#modal_canvasWrapper').append($('<canvas id="rankingDoChart">'));
		let stockNameList = [];
		let amountList = [];
		data.stockList.forEach(stock => {
			stockNameList.push(stock.companyName);
			amountList.push(stock.amount * stock.price);
		});
		let colorList = ["#88aaf3", "#50d7ab", "#9586cd", "#f3d676", "#ed9090", "#a4d9e5", "#a4d9e5", "#a4d9e5", "#a4d9e5", "#a4d9e5"];
		let doughnut = document.getElementById("rankingDoChart");
		if (doughnut !== null) {
			let rankingDoChart = new Chart(doughnut, {
				type: "doughnut",
				data: {
					labels: stockNameList,
					datasets: [
						{
							label: stockNameList,
							data: amountList,
							backgroundColor: colorList.slice(0, stockNameList.length),
							borderWidth: 1
							// borderColor: ['#88aaf3','#29cc97','#8061ef','#fec402']
							// hoverBorderColor: ['#88aaf3', '#29cc97', '#8061ef', '#fec402']
						}
					]
				},
				options: {
					responsive: true,
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					cutoutPercentage: 75,
					tooltips: {
						callbacks: {
							title: function(tooltipItem, data) {
								return "Order : " + data["labels"][tooltipItem[0]["index"]];
							},
							label: function(tooltipItem, data) {
								return data["datasets"][0]["data"][tooltipItem["index"]];
							}
						},
						titleFontColor: "#888",
						bodyFontColor: "#555",
						titleFontSize: 12,
						bodyFontSize: 14,
						backgroundColor: "rgba(256,256,256,0.95)",
						displayColors: true,
						borderColor: "rgba(220, 220, 220, 0.9)",
						borderWidth: 2
					}
				}
			});
		}
		$('#rankingDoChart').append($('<div id="donutCenterText" style="position: absolute; top: 55%; left: 50%; transform: translate(-50%, -50%); font-size: 24px;">' + numberWithCommas(data.totalAsset) + '</div>'));
	})
}

function setMonthlyAssetChart(pid) {
	/*======== 16. ANALYTICS - ACTIVITY CHART ========*/
	//<canvas id="monthlyAsset" class="chartjs"></canvas>
	$.get('portfolio/getdailyGrowthData/' + pid, function(data) {
		if(data.length < 2){
			$('#assetBody').append($('<div style = "border:none; font-weight : bold; font-size : large;color:black;">데이터가 충분하지 않습니다.</div>'));
			return;
		}
		let logDateArr = [];
		let rorArr = [];
		for (let i = 0; i < data.length; i++) {
			logDateArr.push(data[i].logDate.slice(5, 10));
		}
		for (let i = 0; i < data.length; i++) {
			rorArr.push(data[i].ror);
		}
		$('#assetBody').append($('<canvas style = "height : 300px" id="dailyGrowth" class="chartjs"></canvas>'))
		var activity = document.getElementById("dailyGrowth");
		if (activity !== null) {
			var config = {
				// The type of chart we want to create
				type: "line",
				// The data for our dataset
				data: {
					labels: logDateArr.slice(-6),
					datasets: [
						{
							label: "일별성장률",
							backgroundColor: "transparent",
							borderColor: "rgba(82, 136, 255, .8)",
							data: rorArr.slice(-6),
							lineTension: 0,
							pointRadius: 5,
							pointBackgroundColor: "rgba(255,255,255,1)",
							pointHoverBackgroundColor: "rgba(255,255,255,1)",
							pointBorderWidth: 2,
							pointHoverRadius: 7,
							pointHoverBorderWidth: 1
						}
					]
				},
				// Configuration options go here
				options: {
					responsive: true,
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					scales: {
						xAxes: [
							{
								gridLines: {
									display: false,
								},
								ticks: {
									fontColor: "#8a909d", // this here
								},
							}
						],
						yAxes: [
							{
								gridLines: {
									fontColor: "#8a909d",
									fontFamily: "Roboto, sans-serif",
									display: true,
									color: "#eee",
									zeroLineColor: "#eee"
								},
								ticks: {
									// callback: function(tick, index, array) {
									//   return (index % 2) ? "" : tick;
									// }
									//stepSize: 50,
									fontColor: "#8a909d",
									fontFamily: "Roboto, sans-serif"
								}
							}
						]
					},
					tooltips: {
						mode: "index",
						intersect: false,
						titleFontColor: "#888",
						bodyFontColor: "#555",
						titleFontSize: 12,
						bodyFontSize: 15,
						backgroundColor: "rgba(256,256,256,0.95)",
						displayColors: true,
						xPadding: 10,
						yPadding: 7,
						borderColor: "rgba(220, 220, 220, 0.9)",
						borderWidth: 2,
						caretSize: 6,
						caretPadding: 5
					}
				}
			};

			var ctx = document.getElementById("dailyGrowth").getContext("2d");
			var myLine = new Chart(ctx, config);

		}
	})
}


async function setMyStock(data) {
	let headArr = ['주식명', '가격'];
	let thead = $('<thead>');
	headArr.forEach(e => {
		let th = $('<th>' + e + '</th>');
		thead.append(th);
	})
	let amount = $('<th>보유량</th>');
	let nowPriceTh = $('<th>현재가</th>')
	let nowRor = $('<th>수익률</th>');
	let totalAmountTh = $('<th>총합</th>')
	thead.append(amount);
	thead.append(nowPriceTh);
	thead.append(nowRor);
	thead.append(totalAmountTh);
	$('#myStockCardTable').append(thead);

	let nowPriceArr = [];
	const promises = data.stockList.map(async e => {
		return new Promise((resolve, reject) => {
			$.get('portfolio/getNowPriceWithCompanyCode/' + e.companyCode, function(data) {
				// 요청이 완료되면 데이터를 arr 배열에 추가
				nowPriceArr.push(data);
				resolve();
			});
		});
	});
	await Promise.all(promises);

	//table body
	let tbody = $('<tbody>');


	data.stockList.forEach((e, idx) => {
		let tr = $('<tr style = "border : inherit solid 0">');
		if (idx % 2 == 0) {
			tr.css('background-color', 'rgb(249, 249, 249)');
		}
		let td = $('<td>' + e.companyName + '</td>');
		let td2 = $('<td>' + numberWithCommas(e.price) + '</td>');
		let td3 = $('<td>' + numberWithCommas(e.amount) + '</td>');

		let td4 = $('<td>' + numberWithCommas(nowPriceSetter(nowPriceArr, e)) + '</td>');
		let td5 = $('<td>' + ifPlus(calculatePercentageChange(e.price, nowPriceSetter(nowPriceArr, e), tr).toFixed(2)) + '</td>');
		let td6 = $('<td>' + numberWithCommas((e.amount * nowPriceSetter(nowPriceArr, e)).toFixed(0)) + '</td>');

		let buyTd = $('<td style="cursor:pointer"id = addBtn>buy</td>');
		let sellTd = $('<td style="cursor:pointer" id = sellBtn>sell</td>');

		tr.append(td, td2, td3, td4, td5, td6, buyTd, sellTd);
		buyTd.on('click', () => buyClicked(e.pid, e.companyCode, e.companyName));
		sellTd.on('click', () => sellClicked(e.pid, e.companyCode, e.companyName));
		tbody.append(tr);
	});
	$('#myStockCardTable').append(tbody);
}

function nowPriceSetter(nowPriceArr, stock) {
	// stock.companyCode 가 nowPriceArr 의 /[0] 과 같을 경우 [1] 을 반환.
	let nowPrice;
	nowPriceArr.forEach(e => {
		let arr = e.split("/");
		if (arr[0] == stock.companyCode) {
			nowPrice = arr[1];
		}
	});
	return nowPrice;
}

async function setTradeLog(data) {
	let tradeData = await $.get('portfolio/getTradeLog/' + data.pid, function(data) {
	})
	if(tradeData.length == 0){
		$('#myTradeLogTable').append($('<div style = "border:none; font-weight : bold; font-size : large">' + '거래내역이 존재하지 않습니다.' + '</div>'));
	}

	let headArr = ['주식명', '주식코드', '거래타입', '갯수', '가격', '총합', '거래일'];
	let thead = $('<thead >');
	headArr.forEach(e => {
		let th = $('<th>' + e + '</th>');
		thead.append(th);
	})

	$('#myTradeLogTable').append(thead);

	//table body
	let tbody = $('<tbody>');

	tradeData.forEach(async (e, idx) => {
		let tr = $('<tr>');
		if (idx % 2 == 0) {
			tr.css('background-color', 'rgb(249, 249, 249)');
		}
		let td = $('<td>' + e.stockName + '</td>');
		let td2 = $('<td>' + e.stockCode + '</td>');
		let td3 = $('<td>' + e.tradeType + '</td>');
		let td4 = $('<td>' + numberWithCommas(e.amount) + '</td>');
		let td5 = $('<td>' + numberWithCommas(e.price) + '</td>');
		let td6 = $('<td>' + numberWithCommas(e.quantity) + '</td>');
		let td7 = $('<td>' + e.regDate + '</td>');

		tr.append(td, td2, td3, td4, td5, td6, td7);
		tbody.append(tr);
	});
	$('#myTradeLogTable').append(tbody);
}

//---------------- end of display ---------------------------------------

// 동작------------------------------------------------------------------
// portfolio 를 add 하는 작업.
function addCardClicked() {
	let portfolioRegDiv = $('<div id = "portfolioRegWrapper" style = "width : 100%; height :100%;">');
	let titleDiv = $('<div style = "height : 20%;">');
	let dsDiv = $('<div style = "margin-top : 5%;height : 20%;">');

	let nameSpan = $('<span class="ec-register-wrap ec-register-half" >');
	let titlelabel = $('<label style = "height : 5%;width : 100%">Title</label>');
	let titleinput = $('<input id = "titleInput" type="text" placeholder="포트폴리오 제목." style = "width: 90% ;height : 50%;margin-top : 2%;padding-left : 1%;"required="">');

	let dsSpan = $('<span style = "margin-top:10%" class="ec-register-wrap ec-register-half">');
	let dslabel = $('<label style = "height : 5%;width : 100%">discription</label>');
	let dsinput = $('<input id = "discriptionInput" type="text" placeholder="포트폴리오 설명." style = "width: 90% ;height : 50%;margin-top : 2%;padding-left : 1%;"required="">');

	$('#portfolioInfo').append(portfolioRegDiv);
	portfolioRegDiv.append(titleDiv);
	titleDiv.append(nameSpan);
	nameSpan.append(titlelabel);
	nameSpan.append(titleinput);

	$('#portfolioInfo').append(portfolioRegDiv);
	portfolioRegDiv.append(dsDiv);
	dsDiv.append(dsSpan);
	dsSpan.append(dslabel);
	dsSpan.append(dsinput);

	let buttonWrapper = $('<div class = "buttonsWrapper" style = "display : flex;width : 40%; height : 20%;margin-top : 10%; float : right; justify-content: right;">');
	$('#portfolioRegWrapper').append(buttonWrapper);
	buttonWrapper.append($('<button type = "button" id = "saveButton" class = "btn btn-primary" style ="height : 100%;margin-top 10%;margin-right :25% ">저장</button>'));
	$('#saveButton').on('click', () => saveButtonClicked($('#titleInput').val(), $('#discriptionInput').val()));
}

function privacyClicked(pid) {
	$.get('portfolio/updateVisible/' + pid, function(data) {
		location.reload();
	});
}


function editClicked(id) {
	let eles = $('.editSpans');
	let checker = new Checker('span_' + id, eles);
	let delButton = $('<div class = "delButtons"style=  "position : absolute; z-index : 1; bottom : 90%; left : 95%; background : url(\'/resources/img/icons/x.png\');background-size: cover;background-repeat : no-repeat; height : 20%;width : 13%;">');
	delButton.on('click', (e) => {
		e.stopPropagation();
		delButtonClicked(id);
	});
	// checker class 를 통해 클릭된 요소가 겹치지 않게.
	if (!checker.anyOfClickedBool()) { // nothing checked
		$('#span_' + id).attr('data-clicked', 'true');
		$('#' + id).children().append(delButton);
		$('.editSpans').each((idx, e) => $(e).html('수정'));
		$('#span_' + id).html('확인');
		pfedit(id);
		return;
	}
	if (checker.checkSelfClicked()) { // 내가 체크되있음
		$('#span_' + id).attr('data-clicked', 'false');
		$('#span_' + id).html('수정');
		$('#h2_' + id).attr('contenteditable', 'false');
		$('#p_' + id).attr('contenteditable', 'false');
		$('.delButtons').each((idx, e) => $(e).remove());
		return;
	}
	if (!checker.checkSelfClicked() && checker.anyOfClickedBool()) { // 나 아니고 딴애들
		$('.delButtons').each((idx, e) => e.remove());
		$('#span_' + id).children().append(delButton);
		$('#span_' + id).attr('data-clicked', 'true');
		$('#' + id).children().append(delButton);
		$('.editSpans').each((idx, e) => $(e).html('수정'));
		$('#span_' + id).html('확인');
		pfedit(id);
	}
}

// 포트폴리오의 이름과 설명을 변경할 수 있다.
function pfedit(id) {
	$('.editableH2s').each((idx, e) => $(e).attr("contenteditable", "false"));
	$('.editablePs').each((idx, e) => $(e).attr("contenteditable", "false"));

	let h2 = $('#h2_' + id);
	let p = $('#p_' + id);
	$('#span_' + id).attr('data-clicked', 'true');
	h2.attr("contenteditable", "true");
	p.attr("contenteditable", "true");
	let originalH2 = $("#h2_" + id).text();
	let originalP = $("#p_" + id).text();
	let editedH2;
	let editedP;
	h2.focus();
	h2.on("blur keypress", (e) => {
		if (e.type == "blur" || e.type == "keypress && e.which ==13") {
			editedH2 = h2.text();
			if (editedH2.length > 5) {
				alert('5글자까지 가능합니다.');
				h2.text(originalH2);
				editClicked(id);
				return;
			}
			$("#" + e.target.id).attr("contenteditable", "false");
			if (originalH2 != editedH2) {
				$.ajax({
					url: "portfolio/testCode123/title",
					method: "post",
					contentType: "application/json",
					dataType: "json",
					data: JSON.stringify({ 'pid': id, 'title': editedH2 }),
					success: (data) => {
						$('#span_' + id).attr('data-clicked', 'false');
					}
				});
			} else {
				return;
			}
		}
	});
	p.on("blur keypress", (e) => {
		if (e.type == "blur" || e.type == "keypress && e.which ==13") {
			editedP = p.text();
			$("#" + e.target.id).attr("contenteditable", "false");
			if (originalP != editedP) {
				if (editedP.length > 10) {
					alert('설명은 10글자까지 가능합니다.');
					p.text(originalP);
					editClicked(id);
					return;
				}
				$.ajax({
					url: "portfolio/testCode123/dis",
					method: "post",
					contentType: "application/json",
					dataType: "json",
					data: JSON.stringify({ 'pid': id, 'discription': editedP }),
					success: (data) => {
						$('#span_' + id).attr('data-clicked', 'false');
					}
				});
			} else {
				return;
			}
		}
	});
}


// edit 버튼을 누르면 del 버튼이 나오고, delButton 으로 삭제할 수 있다.
function delButtonClicked(id) {
	if (confirm('삭제하시겠습니까?')) {
		$.get('portfolio/deletePortfolio/' + id, function(data) {
			location.reload();
		})
	}
}
// info 관련 모든 정보를 detatch
// small 카드를 눌렀을 시 실행된 함수로 append 된 tag 들이 모두 사라진다.
function detatchAll() {
	$('#portfolioInfoWrapper').remove();
	$('#donutChartBody').children().each((idx, e) => {
		$(e).remove();
	});
	$('#assetBody').children().each((idx, e) => {
		$(e).remove();
	});
	$('#cardFooterWrapper').remove();
	$('#portfolioRegWrapper').remove();
	$('#myStockCardTable').children().each((idx, e) => {
		$(e).remove();
	})
	$('#rankingBodyInner').remove();
	$('#myTradeLogTable').children().each((idx, e) => {
		$(e).remove();
	})
}

// 새 창을띄우고, placeholder 에 살 주식의 이름을 띄워준다.
// 띄워준 이름에 숫자를 입력하면 해당 갯수만큼의 해당 주식을 구입/ 판매 한다.
function newWindow(pId, stockId, type, stockname) {
	var newWindow = window.open(
		"portfolio/popUpPage",
		"_blank",
		"width=200,height=100"
	);

	newWindow.onload = function() {
		var contentDiv = newWindow.document.createElement("div");
		contentDiv.innerHTML =
			'<div id="dataForm" method="post"><input style = "height : 20px" type="text" id="inputField" placeholder = "' + stockname + '"><button style = "height : 25px;margin-left : 3%"type="button" id="submitButton">' + type + '</button></div>';
		newWindow.document.body.appendChild(contentDiv);
		contentDiv
			.querySelector("#submitButton")
			.addEventListener("click", function() {
				var inputData = contentDiv.querySelector("#inputField").value;
				if (!Number.isInteger(parseInt(inputData)) || parseInt(inputData) < 1) {
					newWindow.close();
					alert('양수인 정수만 가능합니다.');
					return;
				}


				$.ajax({
					url: "portfolio/buySell/" + type,
					method: "post",
					contentType: "application/json",
					data: JSON.stringify({ 'portfolioId': pId, 'stockId': stockId, 'amount': inputData, 'companyName': stockname }),
					success: (data) => {
					},
				});
				newWindow.close();
				setTimeout(function() {
					$('#smallCardC_' + pId).click();
					$('#smallCardC_' + pId).click();
				}, 1000); // 1000ms (1초) 후에 클릭 이벤트 발생
			});
	};
}


// util 관련--------------------------------------------------------------
// 숫자를 3자리 단위로 쉼표로 쪼갠다.
function numberWithCommas(number) {
	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 추가 buy 시  new window 를 띄움.
function buyClicked(pId, stockId, stockname) {
	newWindow(pId, stockId, 'buy', stockname);
}


// 추가 sell 시 클릭시 new window 를 띄움.
function sellClicked(pId, stockId, stockname) {
	newWindow(pId, stockId, 'sell', stockname)
}

// stock 을 가지고 있지 않을 시 addStock 을 통해 추가해주어야된다.
// addstock 으로 추가할 시 추가 할 포트폴리오가 설정되어있어야한다.
async function addStockClicked() {
	if ($('div[data-clicked="true"]').length == 0 || $('#portfolioRegWrapper').length > 0) {
		alert('포트폴리오를 선택해주세요.');
		return;
	} else {
		if ($('#cardFooterWrapper').length > 0) {
			$('#cardFooterWrapper').remove();
			return;
		}
		let stockNameInput = $('<input style = "padding-left :1%;height : 70%;width : 30%"id = "stockName" type = "text" placeholder="주식명">');
		let stockAmountInput = $('<input style = "padding-left :1%; height : 70%; width : 30%"id = "stockName" type = "text" placeholder="수량">');
		let confirmDiv = $('<button style = " width : 20%;margin-left : 3%; height : 100%; display : inline-block;background-color : black;color : white"id = "addStockDiv">확인</button>');
		$('#stockCardFooter').append($('<div class = "d-block h-100" id = "cardFooterWrapper">'));
		$('#cardFooterWrapper').css('display', 'flex');
		$('#cardFooterWrapper').css('justify-content', 'space-around');
		//$('#stockCardFooter').css('height','10%');
		$('#cardFooterWrapper').css('width', '40%');
		$('#cardFooterWrapper').append(stockNameInput, stockAmountInput, confirmDiv);


		//autoComplete
		let autoCompleteData = await getAutoCompleteData();
		stockNameInput.autocomplete({
			source: autoCompleteData, // 자동완성 데이터 소스
			minLength: 1, // 입력한 문자 수가 이 값 이상일 때 자동완성이 시작됩니다.
			select: function(event, ui) {
			},
			minLength: 1,// 최소 글자수
			autoFocus: false,
			delay: 100,	//autocomplete 딜레이 시간(ms)
			focus: function(event, ui) {
				// 아래와 위 방향키로 항목을 선택할 때 selectedValue 업데이트
				//selectedValue = ui.item.value;
				return true;
			},
			//disabled: true, //자동완성 기능 끄기
		});
		confirmDiv.on('click', () => confrimBtnClicked(stockNameInput.val(), stockAmountInput.val()));
	}
}

// stockname 과 stockAmount 를 통해 주식을 구매한다.
async function confrimBtnClicked(stockName, stockAmount) {
	let pfid = $('div[data-clicked="true"]').attr('id');
	let stock = await getStockByStockName(stockName);
	let data = {
		'portfolioId': pfid,
		'companyName': stockName,
		'stockId': stock.companyCode,
		'amount': stockAmount,
		'price': stock.price
	};
	if (stock.companyCode == undefined || stock.companyCode == "" || stockAmount == undefined || stockAmount == "" || stock.price == undefined || stock.price == "") {
		//alert('값을 제대로 입력해주세요.');
	}
	$.ajax({
		url: "portfolio/buySell/" + 'buy',
		method: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		success: (data) => {
			detatchAll();
			$('#smallCardC_' + pfid).click();
			$('#smallCardC_' + pfid).click();
		},
	});
}

// tr 의 색을 +% 일경우 빨강, -% 일경우 파랑으로 바꾼다.
function calculatePercentageChange(oldValue, newValue, tr) {
	if (oldValue === 0) {
		if (newValue === 0) {
			return 0; // 두 값이 모두 0이면 변화가 없음
		} else {
			return Infinity; // 이전 값이 0이고 새 값이 0이 아니면 무한대 (무한한 증가)
		}
	}

	const change = ((newValue - oldValue) / Math.abs(oldValue)) * 100;
	if (change < 0) {
		tr.css('color', 'blue');
	} else if (change == 0) {
		tr.css('color', 'black');
	} else {
		tr.css('color', 'red');
	}
	return change;
}

// 양수일경우 음수일경우 기본적으로 - 를 붙이기 때문에 양수일 경우 + 를 표시해준다.
function ifPlus(ele) {
	if (ele > 0) {
		return '+' + ele + '%';
	} else {
		return ele + '%';
	}
}

// 주식 검사시 자동완성기능.
async function getAutoCompleteData() {
	let fetchData = await fetch("/portfolio/getAutoCompleteData").then((les) => les.json());
	return fetchData;
}

// stock 의 이름으로 stock 의 정보를 가져온다.
async function getStockByStockName(stockName) {
	let fetchData = await fetch("/portfolio/getStockByStockName/" + stockName).then((les) => les.json());
	return fetchData;
}

// checker class. 
class Checker {
	constructor(tagName, tagList) {
		this.tagName = tagName;
		this.tagList = tagList;
	}
	// data-clicked 가 true 인 요소가 tag와 일치하면 true 반환
	// 재클릭 여부를 알려준다고 보면 됨.
	checkSelfClicked() {
		let a;
		this.tagList.each((idx, e) => {
			if (e.getAttribute("data-clicked") == "true") {
				a = e;
			}
		});
		return a.id == this.tagName;
	}

	// navEles 들 중 체크된 요소가 있는 지 확인.
	anyOfClickedBool() {
		for (let i = 0; i < this.tagList.length; i++) {
			if (this.tagList[i].getAttribute("data-clicked") == "true") {
				return true;
			}
		}
		return false;
	}

	// 클릭시 태그의 data-clicked 가 true 면 return true
	clickBool() {
		this.tagName.attr("data-clicked") == "true";
	}
}


// Chart

