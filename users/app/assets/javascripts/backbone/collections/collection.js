console.log("this is a collection");

var UserCollection = Backbone.Collection.extend({
	model: User,
	url: "/users"
});