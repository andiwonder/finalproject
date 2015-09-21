console.log("this is collection view!");



var DebtCollectionView = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.collection, "add", this.addDebt);
  },

  addDebt: function(modelFromCollection){
    // console.log("the collection that I am observing added a post!")
    // console.log(modelFromCollection.attributes);
    new DebtView({model: modelFromCollection}).render()
    // newView.render();
    //we want to create views and render them!
  }
});