class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :description
      t.string :business_id
      t.string :integer
      t.integer :user_id

      t.timestamps
    end
  end
end
