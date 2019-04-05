$(function(){
  $("a.restaurants").on("click", function(e){
    e.preventDefault();
    $(".display_restaurants").empty();
    $.get(this.href).then(function(json){
      json.forEach(function(restaurant){
        $(".display_restaurants").append("<h3>" + restaurant.name + "</h3>")
      })
    })
  })
})
