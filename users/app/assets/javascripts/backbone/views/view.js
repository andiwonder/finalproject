console.log("this is a view");

var UserView = Backbone.View.extend({

	model: User,
	tagName: "li",

	

	initialize: function(){
		this.listenTo(this.model,"change",this.render);

	},
  
  	render: function(){
	var template =  _.template($("#main-template").text());
    var renderedHTML = template(this.model.attributes);
    this.$el.html(renderedHTML);
    debugger
		$("#user-info").append(this.$el);
	}
});