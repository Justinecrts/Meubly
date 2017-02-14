class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :bookings, :furniture_id, :offer_id
  end
end
