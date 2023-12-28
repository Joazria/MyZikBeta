class AddHeadlineToBand < ActiveRecord::Migration[6.0]
  def change
        add_column :bands, :headline, :string

  end
end
