	console.log("yo yo yo");

	$(document).ready(function(){

		var vid = document.getElementById("selection_background_movie");
	   	vid.addEventListener("timeupdate",myHandler,false);

	    function myHandler(e) {
	        var nt = vid.currentTime * (100/vid.duration);
	        console.log(vid.currentTime);
	        console.log(nt);
	    }
	
	});