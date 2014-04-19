class Business < ActiveRecord::Base
  validates :phone, presence: true

  belongs_to :category
end
