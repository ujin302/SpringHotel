$(function(){
	const viewName = $('.container').data('view');
    console.log('viewName: ' + viewName);
    if(viewName == 'index') {
    	$('#header-1').addClass('active');
    }else if(viewName == 'roomView') {
    	$('#header-2').addClass('active');
    }else if(viewName == 'reservation1') {
    	$('#header-3').addClass('active');
    }else if(viewName == 'login') {
    	$('#header-loginMenu').addClass('active');
    }else if(viewName == 'join') {
    	$('#header-joinMenu').addClass('active');
    }else if(viewName == 'admin') {
    	$('#header-adminMenu').addClass('active');
    }else if(viewName == 'checkUser') {
    	$('#header-6').addClass('active');
    }
});