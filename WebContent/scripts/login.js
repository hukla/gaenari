/**
 * facebook login
 * 작성자 : 장재희
 * 작성일 : 2014-06-06
 */
window.fbAsyncInit = function() {
	FB.init({
		appId : '846213518728713',
		cookie : true, // enable cookies to allow the server to access
		// the session
		xfbml : true, // parse social plugins on this page
		version : 'v2.0' // use version 2.0
	});
	FB.getLoginStatus(function(response) {
		if (response.status === 'connected') {
			FB.api('/me', function(user) {
				if (user) {

					var image = 'http://graph.facebook.com/' + user.id
							+ '/picture?type=large';
					var name = user.name;
					var email = user.email;

					location.href = "fbLogCheck.do?email=" + email + "&username=" + name + "&image=" + image;
					// 이메일이랑 이름 넘기기
				}
			});
		} else if (response.status === 'not_authorized') {
			
		} else {
			
		}
	});
	FB.Event.subscribe('auth.login', function(response) {
		/*document.location.reload();*/
	});
};
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id))
		return;
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));