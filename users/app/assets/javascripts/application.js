// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require ./libraries/underscore
//= require ./libraries/backbone

//= require ./d3.v3.min.js
//= require ./parallax/main_parallax.js

//= require ./profile/RadarChart.js
//= require ./profile/hero_selection.js
//= require ./profile/script.js
//= require ./profile/slick.js

//= require ./backbone/models/model.js
//= require ./backbone/views/view.js
//= require ./backbone/collections/collection.js
//= require ./backbone/views/collectionview.js
//= require ./backbone/routers/router.js

//= require_self
//= require ./profile/match_card_slick.js

$(document).ready(function(){
	console.log("swap");
	swap = new User({id:2});
	swap.fetch();
	swapview = new UserView({model:swap});

})




