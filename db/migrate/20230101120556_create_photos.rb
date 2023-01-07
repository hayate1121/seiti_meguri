class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      
      t.integer :user_id
      t.integer :anime_id
      t.integer :scene_id
      t.string :address
      t.text :comment
      
      t.timestamps
    end
  end
end
