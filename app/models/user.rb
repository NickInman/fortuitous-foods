class User < ApplicationRecord
  has_secure_password
  has_many :favorites
  has_many :restaurants, through: :favorites
  scope :facebook_users, -> {self.all.select {|user| !user.uid.nil?}}

end
