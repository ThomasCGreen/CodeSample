class Business < ActiveRecord::Base
  validates :phone, presence: true

  belongs_to :category
  has_many :reviews
end
