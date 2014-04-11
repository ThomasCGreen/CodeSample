class Category < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :category
  has_many :categories
  has_many :businesses
end
