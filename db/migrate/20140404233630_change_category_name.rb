class ChangeCategoryName < ActiveRecord::Migration
  def change
    rename_column :categories, :categories_id, :category_id
  end
end
