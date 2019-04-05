class User < ApplicationRecord
  has_secure_password
  has_many :favorites
  has_many :restaurants, through: :favorites
  validates_presence_of :username, :zip

  scope :facebook_users, -> {where.not(uid: nil)}

end
