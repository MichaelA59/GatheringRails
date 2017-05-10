class AddLatitudeAndLongitudeToModel < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :lat, :float
    add_column :games, :lng, :float
  end
end
