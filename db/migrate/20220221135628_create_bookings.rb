class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :progress
      t.string :stage
      t.datetime :showtime
      t.string :fee
      t.string :backline
      t.string :transporte
      t.string :hotel
      t.string :food
      t.text :feedback
      t.string :next
      t.datetime :when
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
