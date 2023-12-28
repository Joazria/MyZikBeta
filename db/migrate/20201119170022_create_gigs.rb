class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.references :band, null: false, foreign_key: true
      t.date :date
      t.string :gate_opening
      t.string :showtime
      t.string :duration
      t.string :local
      t.string :address
      t.string :state
      t.string :country
      t.string :website
      t.text :release

      t.timestamps
    end
  end
end
