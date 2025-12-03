

class AddUniqueIndexToUserViewings < ActiveRecord::Migration[7.1]
  def change
    add_index :user_viewings, [:user_id, :viewing_id], unique: true
  end
end
