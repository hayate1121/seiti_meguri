class AddLongitudeToScenes < ActiveRecord::Migration[6.1]
  def change
    add_column :scenes, :longitude, :float
  end
end
