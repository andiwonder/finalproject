console.log("this is a view");

	var MatchView = Backbone.View.extend({

		model: Match,
		tagName: "table",
		template: _.template( $('#chin-template').html() ),

		initialize: function(){
			this.listenTo(this.model,"change",this.render);

		},

	  	render: function(){
	   	 	var renderedHTML = this.template(this.model.attributes);
	    	this.$el.html(renderedHTML);
	    	$("#radiant_side").append(this.$el);
		}
	});


$(document).ready(function(){

console.log("hi");

});

