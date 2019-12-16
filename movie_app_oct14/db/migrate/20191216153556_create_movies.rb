class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :image_url
      t.string :description
      t.date :release_date
      t.integer :runtime_in_minutes
      t.string :director

      t.timestamps
    end
  end
end
