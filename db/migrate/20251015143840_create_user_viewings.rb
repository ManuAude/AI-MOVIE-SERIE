class CreateUserViewings < ActiveRecord::Migration[7.1]
  def change
    create_table :user_viewings do |t|
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :viewing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
