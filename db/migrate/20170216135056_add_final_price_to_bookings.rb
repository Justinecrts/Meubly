class AddFinalPriceToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :final_price, :integer
  end
end
