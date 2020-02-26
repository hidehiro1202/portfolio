class AddColumnToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots,:spot_name,:string
    add_column :spots,:description,:string
  end
end
