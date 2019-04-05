class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :cuisine, :review_count, :rating, :price, :city, :url, :image_url, :zip, :rest_id
end
