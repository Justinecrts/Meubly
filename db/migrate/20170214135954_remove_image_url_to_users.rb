class RemoveImageUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :image_url, :string
  end
end
