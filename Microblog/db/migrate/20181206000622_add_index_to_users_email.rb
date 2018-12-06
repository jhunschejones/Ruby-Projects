class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  # makes the user email an index for more efficient searching
  def change
    add_index :users, :email, unique: true
  end
end
