$.get('/getNews', function(data) {
	for (let i = 0; i < 10; i++) {
		$('#news_left_list').append(makeNewsListLi(data[i], i));
	}

	for (let i = 10; i < 20; i++) {
		$('#news_right_list').append(makeNewsListLi(data[i], i));
	}

	thumbAndSummary(data);
	var xOffset = 10;
	var yOffset = 30;
	$('.newsAs').on("mouseover", function(e) { //마우스 오버시
		// 미리보기 이미지 설정
		var div = $("<div>", { id: "preview" });
		var img = $("<img>", { src: e.target.getAttribute('data-thumb') });
		img.css('height','100%');
		img.css('max-width','100%');
		div.append(img);
		$("body").append(div);
		// 마우스 오버에 따른 위치 설정
		$("#preview")
			.css("top", (e.pageY - xOffset) + "px")
			.css("left", (e.pageX + yOffset) + "px")
			.fadeIn("fast");
	});
	// 마우스 이동시 위치 변경
	$('.newsAs').on("mousemove", function(e) {
		$("#preview")
			.css("top", (e.pageY - xOffset) + "px")
			.css("left", (e.pageX + yOffset) + "px");
	});
	// 마우스 아웃시 이미지 제거
	$('.newsAs').on("mouseout", function() { //마우스 아웃시
		$("#preview").remove();
	});
})



function makeNewsListLi(data, idx) {
	let li = $('<li style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100%;">');
	let a = $('<a class="newsAs" data-thumb = "' + data.thumb + '" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display:block;" href="' + data.ahref + '">' + data.summary + '</a>');
	li.append(a);
	return li;
}



// imgDiv 에 들어갈 썸네일 + summary div 를 만든다.
function thumbAndSummary(data) {
	//data[9]
	//data[10]
	$('#left_img_img').attr('src', data[0].thumb);
	$('#right_img_img').attr('src', data[10].thumb);
	$('#left_img_a').attr('href', data[0].ahref);
	$('#right_img_a').attr('href', data[10].ahref);
	$('#left_summary_a').html(data[0].summary);
	$('#right_summary_a').html(data[10].summary);
	$('#left_summary_a').attr('href', data[0].ahref);
	$('#right_summary_a').attr('href', data[10].ahref);
}