class CreateIdentities < ActiveRecord::Migration[6.0]
  def change
    create_table :identities do |t|
      t.string :username
      t.string :country
      t.string :state
      t.string :city
      t.string :language
      t.text :release
      t.string :member
      t.string :whatsapp

      t.timestamps
    end
  end
end
