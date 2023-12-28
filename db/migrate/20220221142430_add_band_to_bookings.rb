class AddBandToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :band, :string
  end
end
