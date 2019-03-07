class YelpAdapter < ApplicationRecord

  def self.search(term="food", location="seattle", limit="5")
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: limit
    }
    response = HTTP.auth("Bearer #{ENV["YELP_API_KEY"]}").get(url, params: params)
    parse_results(response.parse["businesses"])
  end

  def self.parse_results(search_results)
    restaurant_array = []
    search_results.each do |rest|
      restaurant = Restaurant.new
      restaurant.name = rest['name']
      restaurant.cuisine = rest['categories'].first['alias']
      restaurant.review_count = rest['review_count']
      restaurant.rating = rest['rating']
      restaurant.price = rest['price']
      restaurant.city = rest['location']['city']
      restaurant.url = rest['url']
      restaurant.image_url = rest['image_url']
      restaurant.zip = rest['location']['zip_code']
      restaurant.rest_id = rest['id']
      restaurant_array << restaurant
    end
    restaurant_array
  end
end
