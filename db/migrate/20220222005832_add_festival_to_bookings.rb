class AddFestivalToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :festival, foreign_key: true
  end
end
