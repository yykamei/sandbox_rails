class AddUserIdToBooks < ActiveRecord::Migration[7.2]
  def change
    add_reference :books, :user, null: false
  end
end
