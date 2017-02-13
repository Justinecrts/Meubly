class CreateFurnitures < ActiveRecord::Migration[5.0]
  def change
    create_table :furnitures do |t|
      t.string :name
      t.string :image_url
      t.string :description
      t.integer :price
      t.string :address
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
