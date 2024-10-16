$(function(){
    console.log('viewName: ' + $('#viewName').text());
    if($('#viewName').text() == 'login') {
    	$('#header-loginMenu').addClass('active');
    }else if($('#viewName').text() == 'join') {
    	$('#header-joinMenu').addClass('active');
    }
});