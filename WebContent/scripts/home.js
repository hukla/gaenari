/**
 * 
 */
function miniHome() {
	var newwindow;
	var url = "/gaenari/miniHome.do";
	newwindow = window.open(url, '미니홈페이지',
			'height=570,width=1000,scrollbars=yes');
	if (window.focus) {
		newwindow.focus;
	}
}