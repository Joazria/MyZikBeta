class AddContact2ToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :name2, :string
    add_column :venues, :email2, :string
    add_column :venues, :tel2, :string
  end
end


