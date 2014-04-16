class FixColumnCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :catagory_id, :category_id
  end
end
