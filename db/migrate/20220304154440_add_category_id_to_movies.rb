class AddCategoryIdToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :category_id, :integer
  end
end
