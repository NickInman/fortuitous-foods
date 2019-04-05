$(function(){
  $("a.favorites").on("click", function(e){
    e.preventDefault();
    $(".display_favorites").empty();
    $.get(this.href).then(function(json){
      json.forEach(function(favorite){
        $(".display_favorites").append("<h4><b>" + favorite.name + "</b></h4>" +
        "<p>" + favorite.cuisine +" cuisine</p>" +
        "<p>" + favorite.review_count + " reviews, "+ favorite.rating + "/5 stars</p>" +
        "<p>Price: " + favorite.price + "</p>" +
        "<p>" + favorite.city + ", " + favorite.zip + "</p>" +
        "<p>" + (favorite.name.link(favorite.url)) + "</p>")
      })
    })
  })
})
