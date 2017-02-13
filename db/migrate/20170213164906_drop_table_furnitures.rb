class DropTableFurnitures < ActiveRecord::Migration[5.0]
  def change
    rename_table :furnitures, :offers
  end
end
