class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.text :release
      t.string :website
      t.string :facebook
      t.string :instagram
      t.string :youtube
      t.string :soundcloud
      t.string :spotify
      t.string :email
      t.string :local
      t.integer :team

      t.timestamps
    end
  end
end
