class AddPhotoToOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :photo, :string
  end
end
