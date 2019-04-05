class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :restaurant_id, :fav_dish
  belongs_to :user
end
