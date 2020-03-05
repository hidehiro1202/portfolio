class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      
      t.integer :id
      t.string :spot_name
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
