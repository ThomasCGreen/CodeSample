class Business < ActiveRecord::Base
  validates :phone, presence: true
  validates :state, length: { maximum: 2 }

  belongs_to :category
  has_many :reviews
end
