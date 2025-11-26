class AddTmdbFieldsToViewings < ActiveRecord::Migration[7.1]
  def change
    add_column :viewings, :poster_path, :string
    add_column :viewings, :release_date, :string
    add_column :viewings, :overview, :text
    add_column :viewings, :tmdb_id, :integer
  end
end
