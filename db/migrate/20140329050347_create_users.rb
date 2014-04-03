class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.datetime :member_since
      t.datetime :expires
      t.string :street
      t.string :city
      t.string :state, limit: 2
      t.string :zip, limit: 5
      t.string :cell_phone

      t.timestamps
    end
    add_index :users, :email
  end
end
