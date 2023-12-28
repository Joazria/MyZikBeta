class AddGeneroToBands < ActiveRecord::Migration[6.0]
  def change
    add_column :bands, :genero1, :string
    add_column :bands, :genero2, :string
    add_column :bands, :genero3, :string
    add_column :bands, :genero4, :string
  end
end
