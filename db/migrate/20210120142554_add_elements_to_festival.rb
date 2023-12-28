class AddElementsToFestival < ActiveRecord::Migration[6.0]
  def change
    add_column :festivals, :email, :string
    add_column :festivals, :tel, :string
    add_column :festivals, :festival_name, :string
    add_column :festivals, :address, :string
    add_reference :festivals, :user, foreign_key: true
  end
end
