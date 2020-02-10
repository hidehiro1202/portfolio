class CreateProfils < ActiveRecord::Migration[5.2]
  def change
    create_table :profils do |t|
      
    t.string :image
    t.string :description
    t.integer :user_id

      t.timestamps
    end
  end
end
