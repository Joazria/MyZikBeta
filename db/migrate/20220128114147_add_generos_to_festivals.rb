class AddGenerosToFestivals < ActiveRecord::Migration[6.0]
  def change
    add_column :festivals, :genero1, :string
    add_column :festivals, :genero2, :string
    add_column :festivals, :genero3, :string
    add_column :festivals, :genero4, :string
    add_column :festivals, :genero5, :string
    add_column :festivals, :genero6, :string
    add_column :festivals, :youtube, :string
    add_column :festivals, :confirmation, :string
  end
end
