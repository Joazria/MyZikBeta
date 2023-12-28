class AddInfosToAgencies < ActiveRecord::Migration[6.0]
  def change

  # create_table :agencies do |t|
  #   t.references :user, null: false, foreign_key: true
  #   t.timestamps
  # end
    add_column :agencies, :agency_release, :text
    add_column :agencies, :agency_email, :string
    add_column :agencies, :agency_tel, :string
    add_column :agencies, :agency_country, :string
    add_column :agencies, :agency_state, :string

  end
end