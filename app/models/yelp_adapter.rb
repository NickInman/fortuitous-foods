class YelpAdapter

  def self.search(term, location="new york")
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT
    }
    response = HTTP.auth("Bearer #{ENV["YELP_API_KEY"]}").get(url, params: params)
    response.parse["businesses"]
  end
  #
  # def self.business_reviews(business_id)
  #   url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}/reviews"
  #   response = HTTP.auth("Bearer #{ENV["YELP_API_KEY"]}").get(url)
  #   response.parse["reviews"]
  #   binding.pry
  # end
  #
  # def business(business_id)
  #   url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}"
  #   response = HTTP.auth("Bearer #{ENV["YELP_API_KEY"]}").get(url)
  #   response.parse
  # end
end
