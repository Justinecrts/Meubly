class RemoveImageUrlToOffers < ActiveRecord::Migration[5.0]
  def change
    remove_column :offers, :image_url, :string
  end
end
