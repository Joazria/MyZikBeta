class AddCountryToBand < ActiveRecord::Migration[6.0]
  def change
    add_column :bands, :country, :string
  end
end
