class AddCategoryRefToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :catagory, index: true
  end
end
