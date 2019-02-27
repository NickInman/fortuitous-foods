class Restaurant < ApplicationRecord
  has_many :favorites
  has_many :restaurants, through: :favorites
end
