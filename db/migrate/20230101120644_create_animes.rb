class CreateAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :animes do |t|
      
      t.string :title
      t.string :spot
      
      t.timestamps
    end
  end
end
