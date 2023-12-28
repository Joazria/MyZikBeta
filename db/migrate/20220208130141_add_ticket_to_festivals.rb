class AddTicketToFestivals < ActiveRecord::Migration[6.0]
  def change
    add_column :festivals, :ticket, :string
    add_column :festivals, :capacity, :string
  end
end
