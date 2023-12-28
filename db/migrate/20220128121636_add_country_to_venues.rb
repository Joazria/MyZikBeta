class AddCountryToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :latitude, :float
    add_column :venues, :longitude, :float
    add_column :venues, :genero1, :string
    add_column :venues, :genero2, :string
    add_column :venues, :genero3, :string
    add_column :venues, :genero4, :string
    add_column :venues, :genero5, :string
    add_column :venues, :genero6, :string
    add_column :venues, :confirmation, :string
  end
end



