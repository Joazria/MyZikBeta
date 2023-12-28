class AddVenueToBookings < ActiveRecord::Migration[6.0]
  def change
     # remove_reference :bookings, :user, index:true, foreign_key: true
     remove_reference :bookings, :festival, index:true, foreign_key: true
    # remove_column :bookings, :band, :string
    add_reference :bookings, :bookable, polymorphic: true
  end
end
