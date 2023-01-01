class CreateScenes < ActiveRecord::Migration[6.1]
  def change
    create_table :scenes do |t|
      
      t.integer :anime_id
      t.string :scene_name
      
      t.timestamps
    end
  end
end
