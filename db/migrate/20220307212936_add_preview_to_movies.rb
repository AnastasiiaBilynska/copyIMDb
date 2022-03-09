class AddPreviewToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :preview, :string
  end
end
