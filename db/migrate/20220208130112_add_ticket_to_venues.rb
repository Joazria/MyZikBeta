class AddTicketToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :ticket, :string
    add_column :venues, :capacity, :string
  end
end
