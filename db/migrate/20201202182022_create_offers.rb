class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :event_name
      t.string :local
      t.text :release
      t.integer :fee
      t.date :date
      t.time :show_time
      t.string :line_up
      t.references :user, null: false, foreign_key: true
      t.references :band, null: false, foreign_key: true

      t.timestamps
    end
  end
end
