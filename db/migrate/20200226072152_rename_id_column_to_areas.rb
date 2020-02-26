class RenameIdColumnToAreas < ActiveRecord::Migration[5.2]
  def change
    rename_column :areas, :area_id, :id
    rename_column :areas, :user_id, :area_name
  end
end
