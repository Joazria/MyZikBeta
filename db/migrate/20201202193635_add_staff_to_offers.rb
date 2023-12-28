class AddStaffToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :format, :string
    add_column :offers, :patrocino, :string
    add_column :offers, :link_do_event, :string
    add_column :offers, :address, :string
    add_column :offers, :transport, :string
    add_column :offers, :accommodation, :string
    add_column :offers, :perdiem, :string
    add_column :offers, :backline, :string
    add_column :offers, :ticket, :string
    add_column :offers, :capacity, :string
    add_column :offers, :streaming, :string
  end
end
