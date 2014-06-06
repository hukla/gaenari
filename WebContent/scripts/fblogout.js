/**
 * 
 */
$(window).load(function() {
	// init the FB JS SDK
	FB.init({
		appId : '846213518728713', // App ID from the App Dashboard
		// check the login status upon init?
		cookie : true, // set sessions cookies to allow your server to access
						// the session?
		xfbml : false, // parse XFBML tags on this page?
		version : 'v2.0'
	});

	FB.getLoginStatus(function(response) {
		$("#fbLogoutBtn").show();
	});

	$("#fbLogoutBtn").click(function() {
		FB.logout(function(response) {
		});
	});
});