class AddUserIdToBusiness < ActiveRecord::Migration
  def change
    add_reference :businesses, :user, index: true
  end
end
