$(function(){
  $("a.restaurants").on("click", function(e){
    e.preventDefault();
    $(".display_restaurants").empty();
    $.get(this.href).then(function(json){
      json.forEach(function(restaurant){
        $(".display_restaurants").append("<div class='rest_card'><h4><b>" + restaurant.name + "</b></h4>" +
        "<img src=" + restaurant.image_url + " width='350' height='350'>" +
        "<p>" + restaurant.cuisine +" cuisine</p>" +
        "<p>" + restaurant.review_count + " reviews, "+ restaurant.rating + "/5 stars</p>" +
        "<p>Price: " + restaurant.price + "</p>" +
        "<p>" + restaurant.city + ", " + restaurant.zip + "</p>" +
        "<p>" + (restaurant.name.link(restaurant.url)) + "</p>" +
        "<a href='#' class='js-next' data-id="+ restaurant.id + ">Next...</a>")
      })
    })
  })
})
