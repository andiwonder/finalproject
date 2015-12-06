$(document).ready(function(){
	console.log("hi");

	$("#my_button").click(function(){
		console.log("clicked");
		var x = Math.floor(Math.random() * (100- 1) + 1);
		swap.set({id:x});
		swap.fetch();
	});

	$('.hero_potrait').click(function(event ){
		console.log("hero_potrait clicked" + event.target);
		var match_id = $(this).attr('value').replace('match_','');
		swap.set({id:match_id});
		swap.fetch();
	});
});
