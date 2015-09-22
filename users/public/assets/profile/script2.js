console.log("yooo!");

$(document).ready(function(){

$('#main_btn').click(function(){
	console.log("button clicked");
	$("#list").toggle();

});

$('#online_btn').click(function(){
	console.log("button clicked");
	$("#online").toggle();

});

$('#offline_btn').click(function(){
	console.log("button clicked");
	$("#offline").toggle();

});

$('#away_btn').click(function(){
	console.log("button clicked");
	$("#away").toggle();

});

});