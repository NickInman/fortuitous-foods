class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  scope :fav_dishes, -> {self.all.select {|dish| !dish.fav_dish.nil?}}
end
