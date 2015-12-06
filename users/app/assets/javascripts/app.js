//= require jquery
//= require jquery_ujs
//= require ./libraries/underscore
//= require ./libraries/backbone

//= require app


//= require_tree ./backbone/models
//= require_tree ./backbone/collections
//= require_tree ./backbone/views
//= require_tree ./backbone/routers




var ready;
ready = function() {

	console.log("this is app.js");
	swap = new Match({id:1});
	swap.fetch();
	swapview = new MatchView({model:swap});
	swapview.render();



};


$(document).on('page:load', ready());


