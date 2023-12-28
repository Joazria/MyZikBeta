class AddContact2ToFestivals < ActiveRecord::Migration[6.0]
  def change
    add_column :festivals, :name2, :string
    add_column :festivals, :email2, :string
    add_column :festivals, :tel2, :string
  end
end
