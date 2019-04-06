$(function(){
  $("a.restaurants").on("click", function(e){
    e.preventDefault();
    $(".display_restaurants").empty();
    $.get(this.href).then(function(json){
      json.forEach(function(restaurant){
        $(".display_restaurants").append("<div class='rest_card'><h4><b>" + restaurant.name + "</b></h4>" +
        "<img src=" + restaurant.image_url+ " width='350' height='350'>" +
        "<p>" + restaurant.cuisine +" cuisine</p>" +
        "<p>" + restaurant.review_count + " reviews, "+ restaurant.rating + "/5 stars</p>" +
        "<p>Price: " + restaurant.price + "</p>" +
        "<p>" + restaurant.city + ", " + restaurant.zip + "</p>" +
        "<p>" + restaurant.name.link(restaurant.url) + "</p>")
      })
    })
  })

  $(".js-next").on("click", function(event) {
    event.preventDefault()
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/restaurants/" + nextId + ".json", function(data) {
      var restaurant = data;
      $(".restaurantName").text(restaurant["name"]);
      $(".restaurantImageUrl").text(restaurant["image_url"]);
      $(".restaurantCuisine").text(restaurant["cuisine"]);
      $(".restaurantReviewCount").text(restaurant["review_count"]);
      $(".restaurantRating").text(restaurant["rating"]);
      $(".restaurantPrice").text(restaurant["price"]);
      $(".restaurantCity").text(restaurant["city"]);
      $(".restaurantZip").text(restaurant["zip"]);
      $(".restaurantUrl").text(restaurant["url"]);

      // re-set the id to current on the link
      $(".js-next").attr("data-id", restaurant["id"]);
    });
  });
});
