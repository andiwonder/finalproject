
$(document).ready(function(){


console.log("y1123123o!");
$("#show_friends_list").click(function(){
	console.log("button clicked");
	$("#list").toggle();

});


});


var drawuserminimap;
drawuserminimap = function (){

 Object.prototype.getKeyByValue = function( value ) {
    for( var prop in this ) {
        if( this.hasOwnProperty( prop ) ) {
             if( this[ prop ] === value )
                 return prop;
        }
    }
  }


  var myheroes = {
    "antimage"  : 1 ,
    "axe"  : 2 ,
    "bane"  : 3 ,
    "bloodseeker"  : 4 ,
    "crystal_maiden"  : 5 ,
    "drow_ranger"  : 6 ,
    "earthshaker"  : 7 ,
    "juggernaut"  : 8 ,
    "mirana"  : 9 ,
    "nevermore"  : 11 ,
    "morphling"  : 10 ,
    "phantom_lancer"  : 12 ,
    "puck"  : 13 ,
    "pudge"  : 14 ,
    "razor"  : 15 ,
    "sand_king"  : 16 ,
    "storm_spirit"  : 17 ,
    "sven"  : 18 ,
    "tiny"  : 19 ,
    "vengefulspirit"  : 20 ,
    "windrunner"  : 21 ,
    "zuus"  : 22 ,
    "kunkka"  : 23 ,
    "lina"  : 25 ,
    "lich"  : 31 ,
    "lion"  : 26 ,
    "shadow_shaman"  : 27 ,
    "slardar"  : 28 ,
    "tidehunter"  : 29 ,
    "witch_doctor"  : 30 ,
    "riki"  : 32 ,
    "enigma"  : 33 ,
    "tinker"  : 34 ,
    "sniper"  : 35 ,
    "necrolyte"  : 36 ,
    "warlock"  : 37 ,
    "beastmaster"  : 38 ,
    "queenofpain"  : 39 ,
    "venomancer"  : 40 ,
    "faceless_void"  : 41 ,
    "skeleton_king"  : 42 ,
    "death_prophet"  : 43 ,
    "phantom_assassin"  : 44 ,
    "pugna"  : 45 ,
    "templar_assassin"  : 46 ,
    "viper"  : 47 ,
    "luna"  : 48 ,
    "dragon_knight"  : 49 ,
    "dazzle"  : 50 ,
    "rattletrap"  : 51 ,
    "leshrac"  : 52 ,
    "furion"  : 53 ,
    "life_stealer"  : 54 ,
    "dark_seer"  : 55 ,
    "clinkz"  : 56 ,
    "omniknight"  : 57 ,
    "enchantress"  : 58 ,
    "huskar"  : 59 ,
    "night_stalker"  : 60 ,
    "broodmother"  : 61 ,
    "bounty_hunter"  : 62 ,
    "weaver"  : 63 ,
    "jakiro"  : 64 ,
    "batrider"  : 65 ,
    "chen"  : 66 ,
    "spectre"  : 67 ,
    "doom_bringer"  : 69 ,
    "ancient_apparition"  : 68 ,
    "ursa"  : 70 ,
    "spirit_breaker"  : 71 ,
    "gyrocopter"  : 72 ,
    "alchemist"  : 73 ,
    "invoker"  : 74 ,
    "silencer"  : 75 ,
    "obsidian_destroyer"  : 76 ,
    "lycan"  : 77 ,
    "brewmaster"  : 78 ,
    "shadow_demon"  : 79 ,
    "lone_druid"  : 80 ,
    "chaos_knight"  : 81 ,
    "meepo"  : 82 ,
    "treant"  : 83 ,
    "ogre_magi"  : 84 ,
    "undying"  : 85 ,
    "rubick"  : 86 ,
    "disruptor"  : 87 ,
    "nyx_assassin"  : 88 ,
    "naga_siren"  : 89 ,
    "keeper_of_the_light"  : 90 ,
    "wisp"  : 91 ,
    "visage"  : 92 ,
    "slark"  : 93 ,
    "medusa"  : 94 ,
    "troll_warlord"  : 95 ,
    "centaur"  : 96 ,
    "magnataur"  : 97 ,
    "shredder"  : 98 ,
    "bristleback"  : 99 ,
    "tusk"  : 100 ,
    "skywrath_mage"  : 101 ,
    "abaddon"  : 102 ,
    "elder_titan"  : 103 ,
    "legion_commander"  : 104 ,
    "ember_spirit"  : 106 ,
    "earth_spirit"  : 107 ,
    "terrorblade"  : 109 ,
    "phoenix"  : 110 ,
    "oracle" : 111 ,
    "techies" : 105 ,
    "winter_wyvern" : 112 ,
    }
    
  var unfiltered_data = $('.temp_information').data('temp');
  var data2 = _.uniq(unfiltered_data, function(item, key, unformat_time) { 
    return item.unformat_time;
  });

  var first_date_unparsed = d3.min(data2, function(d) {
    return d.time
  });
  var last_date_unparsed = d3.max(data2, function(d) {
    return d.time
  });
  var first_date = new Date(first_date_unparsed);
  var last_date = new Date(last_date_unparsed);
  first_date.setHours(0,0,0,0);
  // var first_date = new Date(data2[0].unformat_time * 1000);

  // var last_date = new Date(data2[data2.length - 1].time.split(" ")[0]);
  // var timeDiff = Math.abs(last_date.getTime() - first_date.getTime());
  // var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)); 
  // var d3Object = {};

  // var date1 = new Date(data2[0].unformat_time * 1000);
  // var date2 = new Date(data2[data2.length - 1].unformat_time * 1000);
  // var timeDiff2 = Math.abs(date2.getTime() - date1.getTime());
  // var diffDays2 = Math.ceil(timeDiff2 / (1000 * 3600 * 24)); 
  // alert(diffDays2);



  var monthNames = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"];

  var map_result = _.map(data2, function (item) {
      var d = new Date(item.time);
      console.log(d);
      // console.log(d.getMonth() + "/" + d.getDay());
      var timeDiff = Math.abs(first_date.getTime() - d.getTime());
      var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)); 
      // console.log(d.getTime());
      console.log(diffDays);
      // var month = d.getMonth() + ", " + d.getDate(); 
      var month = monthNames[d.getMonth()] + ", " + d.getDate(); 
      var hour =  d.getHours();
      var minute = Number((d.getMinutes()<10?'0':'') + d.getMinutes());
      return {
          "hour": hour,
          "minute": minute,
          "Month": month,
          "hero_id": item.hero,
          "day": diffDays,
          "User_Count": 1
      };
  });

  var result_temp = _.reduce(map_result, function (memo, item) {
      if (memo[item.Month] === undefined) {
          memo[item.Month] = [item.hero_id+ " " + item.hour + " " +item.minute];
      }else{
          memo[item.Month].push(item.hero_id+ " " + item.hour + " " +item.minute);
      }
      return memo;
  },{});

  var final_result = _.map(map_result, function (item) {
      x = result_temp[item.Month]
      item.game_of_day = x.indexOf(item.hero_id+ " " + item.hour + " " +item.minute) + 1;
  });

  
  // var newobj = {}; 
  // var result_temp2 = _.reduce(map_result, function (memo, item) {
  //     if (memo[item.Month] === undefined) {
  //         console.log("new day found")
  //         newobj[item.Month] = [];
  //         newobj[item.Month].push(item.hero_id)
  //     }else{
  //         newobj[item.Month].push(item.hero_id);
  //     }
  //     return memo;
  // },{});

  // debugger

  //then wrap the result to the format you expected.
  var result = _.map(result_temp, function(value, key){
      return {
          "Month": key,
          "User_Count": value
      };
  });

  console.log(result);
  

  // _.each(data2 , function(date){
  //   var temp_date = new Date(date.time.split(" ")[0]);
  //   var timeDiff = Math.abs(last_date.getTime() - temp_date);
  //   var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
  //   // console.log(diffDays);
      
  // })


  data = [{"hero":"Axe","pos":1},{"hero":"Bane","pos":2},{"hero":"Dazzle","pos":5}];

  // add margins to svg

  var margin = {top: 30, right: 20, bottom: 30, left: 10},
      width = 1700 - margin.left - margin.right,
      height = 320 ;

  // Parse the date / time
  var parseDate = d3.time.format("%d-%b-%y").parse;

  // Set the ranges
  // var x = d3.time.scale().domain([data2[0].time, data2[data2.length - 1].time]).range([0, width]);
  var x = d3.time.scale()
    .domain([first_date, last_date])
    .rangeRound([0, width - margin.left - margin.right]);

  // var x = d3.scale.linear().domain([0,17]).range([0, width]);
  var y = d3.scale.linear().range([height, 0]);

  // Define the axes
  var xAxis = d3.svg.axis()
      .scale(x)
      // .tickFormat(function(d) { return dataset[d].Month; })
      .orient("bottom");

  function make_x_axis() {        
    return d3.svg.axis()
        .scale(x)
         .orient("bottom")
         .ticks(16)
  }1

  function make_y_axis() {        
    return d3.svg.axis()
        .scale(y)
        .orient("left")
        .ticks(24)
  }


  // var xAxis = d3.svg.axis()
  //     .scale(x)
  //     .orient("bottom");
  // // xAxis
  // svg.append("g") // Add the X Axis
  //     .attr("class", "x axis")
  //     .attr("transform", "translate(0," + (height) + ")")
  //     .call(xAxis);
  // //xAxis Label
  // svg.append("text") 
  //     .attr("transform", "translate(" + (width / 2) + " ," + (height + margin.bottom - 5) +")")
  //     .style("text-anchor", "middle")
  //     .text("Month");    



  var yAxis = d3.svg.axis().scale(y)
      .orient("left").ticks(5);

  // Define the line
  var valueline = d3.svg.line()
      .x(function(d) { return x(d.date); })
      .y(function(d) { return y(d.close); });

  var svg = d3.select("#d3_minimap_chart")
    .append("svg")
      .attr("fill","red")
      .attr("id","my_svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .style("border", "1px solid black")
    .append("g")
        .attr("transform", 
              "translate(" + margin.left + "," + margin.top + ")");




// $('.d3_bg').css("opacity",".8")

  // svg.append("rect")
  //   .attr("width", "100%")
  //   .attr("height", "100%")
  //   .attr("fill", "rgba(27,28,29, 0.6)");

  svg.append("text")      // text label for the x axis
    .attr("x", 265 )
    .attr("y", 480 )
    .style("text-anchor", "middle")
    .text("Date");

    // x.domain(map_result.map(function(d) { return d.Month; }));
    // y.domain([0, d3.max(data, function(d) { return d.frequency; })]);

        // Add the X Axis
    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis)
      // .selectAll("text")
      //   .style("text-anchor", "end")
      //   .attr("dx", "-.8em")
      //   .attr("dy", "-.55em")
      //   .attr("transform", "rotate(-90)" );

    // Add the Y Axis
    // svg.append("g")
    //     .attr("class", "y axis")
    //     .call(yAxis);

    // svg.append("g")         
    // .attr("class", "grid")
    // .attr("transform", "translate(0," + height + ")")
    // .call(make_x_axis()
    //     .tickSize(-height, 0, 0)
    //     .tickFormat("")
    // )

    // svg.append("g")         
    // .attr("class", "grid")
    // .call(make_y_axis()
    //     .tickSize(-width, 0, 0)
    //     .tickFormat("")
    // )

var rectangle = svg.selectAll("rect").
                data(map_result);
  
    rectangle.enter()
    .append("svg:rect")              
              .attr("x", function(d,i){
                return (d.day * 60) - 20;
              })
              .attr("y", function(d,i){
                return (d.game_of_day * -30) + 330;
              })
              .attr("fill","rgba(181, 204, 24, 0.6)")
              .attr("width", 28)
              .attr("height", 28);



  var imgs = svg.selectAll("img").
    data(map_result);
    imgs.enter()
    .append("svg:image")
    .attr("xlink:href", function (d,i) {
          return "/assets/icons/minimap_hero_icon/" + myheroes.getKeyByValue(d.hero_id) + "_icon.png"
      })
    .attr("x", function (d,i) {
        return (d.day * 60) - 20;
      })
    .attr("y", function (d,i) {
        return (d.game_of_day * -30) + 330;
      })
    .attr("stroke","orange")
    .attr("width", "28")
    .attr("height", "28");




    // var svg = d3.select("body")
    //     .append("svg")
    //     .attr("width", 200)
    //     .attr("height", 100)
    //     .style("border", "1px solid black");


    // var imgs = svg.selectAll("image")
    //     .data(data);
    //     imgs.enter()
    //     .append("svg:image")
    //     .attr("xlink:href", "/assets/icons/minimap_hero_icon/" + data[1] + "_icon.png")
    //     .attr("x", "60")
    //     .attr("y", "60")
    //     .attr("width", "20")
    //     .attr("height", "20");

};

$(document).on('page:load', drawuserminimap());

$(document).ready(function(){
  drawuserminimap();
});