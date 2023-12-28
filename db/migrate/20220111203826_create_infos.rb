class CreateInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :infos do |t|
      t.string :region
      t.string :state
      t.string :award
      t.string :proponente
      t.text :description
      t.string :link
      t.date :deadline

      t.timestamps
    end
  end
end
