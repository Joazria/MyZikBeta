class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :fb
      t.string :insta
      t.string :site
      t.string :venue
      t.string :email
      t.string :tel
      t.string :address
      t.string :venue_name
      t.string :name
      t.string :release
      t.string :line_up

      t.timestamps
    end
  end
end
