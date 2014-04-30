class DisplaysController < ApplicationController
  def main
    @category = Category.where(category_id: nil).first_or_create do |category|
      category.title = 'Resources'
    end
  end
end
