
/**
 * 유효성 체크 : 숫자
 * ex) onkeyup="isNumber(this)"
 */
function isNumber(obj) {
	var Pattern2 = /([^0-9])/;
	if (obj.value.match(Pattern2)!=null) {
		alert('숫자만 입력하세요.');
		obj.value = "";
		obj.focus();
		return false;
	} else {
		return true;
	}
}


// 이메일 도메인 selectbox 선택
function changeEmailDomain(obj, val) {
	if (val == "self") {
		$(obj).attr("readonly", false);
		obj.value = "";
		obj.focus();
	} else {
		$(obj).attr("readonly", true);
		obj.value = val;
	}
}


// url 필수
// w : width, 필수
// h : height, 필수
// winl : 숫자로 하면 좌표 아니면 가로 center, default : 가로가운데
// wint : 숫자로 화면 좌표 아니면 세로 middle, default : 세로가운데
// scroll : 스크롤바, 'yes' or 'no', default : no
// name : popup name, defalut : 임의지정
function openNewWindow(url, w, h, winl, wint, scroll, name) {
	if(winl == null || winl == '' || isNaN(winl))
		var winl = (screen.width-w)/2;

    if(wint == null || wint == '' || isNaN(wint))
    	var wint = (screen.height-h)/2;

    if(scroll == null || scroll != 'yes')
    	scroll = 'no';

   	if(name == null || name == "")
   		name = 'pop' + (new Date()).getTime();

	var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=' + scroll + ',resizable=yes,height='+h+','+'width='+w+','+'left='+winl+','+'top='+wint;

	var winObj = window.open(url, name, settings);
	winObj.focus();
}

// 우편번호 팝업 창 띄우기
function openZipCodeSearch(url) {
	if (url == "") {
		url = "/popup/find_zipcode_new/pop_find_zipcode.asp";
	}
	var w = 438;
	var h = 620;
	var scroll = "no";
	var name = "popup_post";

	openNewWindow(url, w, h, "center", "middle", scroll, name);
}

// 팝업리사이징
// bodyscroll : 스크롤바, 'yes' or 'no', default : no
function windowPopReset(bodyscroll) {
	if(bodyscroll == null) bodyscroll = "no";
	window.resizeTo(1, 1); //최초 사이즈 초기화
	document.body.scroll = bodyscroll;
	var userBrowser = navigator.userAgent; //고객 브라우져 정보
	 
	var winBody = document.body;
	var marginWidth = parseInt(winBody.leftMargin)+parseInt(winBody.rightMargin); 
	var marginHeight = parseInt(winBody.topMargin)+parseInt(winBody.bottomMargin);
	 
	//if(winl == null || winl == '' || isNaN(winl))	var winl = (screen.width-w)/2;
	//if(wint == null || wint == '' || isNaN(wint))	var wint = (screen.height-h)/2;		 

	var wid, hei;
	// 최초 초기값은 익스 8
	wid = document.documentElement.scrollWidth - document.documentElement.clientWidth + marginWidth + 240; 
	hei = document.documentElement.scrollHeight -  document.documentElement.offsetHeight + marginHeight + 74;
	 
	if(userBrowser.indexOf("MSIE 9") > -1)
	{
	wid = document.documentElement.scrollWidth - document.documentElement.clientWidth + marginWidth + 240; 
	hei = document.documentElement.scrollHeight -  document.documentElement.offsetHeight + marginHeight + 70;
	}
	else if(userBrowser.indexOf("Chrome") > -1)
	{
	wid = document.body.scrollWidth + 27;
	hei = document.body.scrollHeight + 58;
	}
	//window.moveTo( (window.screen.width - wid) / 2 , 0);
	window.resizeTo(wid, hei);
}


