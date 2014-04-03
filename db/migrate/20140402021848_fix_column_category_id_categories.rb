class FixColumnCategoryIdCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :category_id, :categories_id
  end
end
