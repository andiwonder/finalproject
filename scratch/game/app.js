$(document).ready(function(){


    var count = 1;




    $(".box").on("click", function() {
    if (count !== 3){
        console.log("box clicked")
        var $this = $(this);
        var $clone = $this.clone();
        count ++;

        if ($this.hasClass("choice")) {
            $("#option_boxes .option:last-child").remove();
            $clone.removeClass("choice").addClass("option").prependTo("#option_boxes");
            $this.addClass("selected");
        } 

    } else if (count === 3){
        var $this = $(this);
        var $clone = $this.clone();
        $("#option_boxes .option:last-child").remove();
        $clone.removeClass("choice").addClass("option").prependTo("#option_boxes");
        $this.addClass("selected");
        
        $.each( $("#option_boxes .option"), function( key, value ) {
            var img = $(value).find('img').attr("src");
           
            
            console.log(img);
        }); 
        console.log("answer calculating");
    }

    });


});

// $clone.removeClass("choice").addClass("option box").prependTo("#option_boxes");