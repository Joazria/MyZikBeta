class CreateFestivals < ActiveRecord::Migration[6.0]
  def change
    create_table :festivals do |t|
      t.string :fb
      t.string :insta
      t.string :site
      t.string :name
      t.date :periode_start
      t.date :periode_end
      t.string :release
      t.string :line_up

      t.timestamps
    end
  end
end
