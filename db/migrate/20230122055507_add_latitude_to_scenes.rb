class AddLatitudeToScenes < ActiveRecord::Migration[6.1]
  def change
    add_column :scenes, :latitude, :float
  end
end
