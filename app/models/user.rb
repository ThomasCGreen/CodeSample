class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true
  validates :state, length: { maximum: 2 }

  has_many :reviews
end
