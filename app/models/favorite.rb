class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  scope :fav_dish_selected, -> {where(fav_dish != nil)}

end
