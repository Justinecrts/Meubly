class AddDaysToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :days, :integer
  end
end
