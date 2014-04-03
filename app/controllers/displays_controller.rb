class DisplaysController < ApplicationController
  def main
    if Category.count == 0
      # There are no categories; create the top level category 'Resources'
      category = Category.new
      category.title = "Resources"
      category.save
    end
    @category = Category.where(category_id: nil).first
  end
end
