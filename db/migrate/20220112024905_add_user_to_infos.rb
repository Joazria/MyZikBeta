class AddUserToInfos < ActiveRecord::Migration[6.0]
  def change
    add_reference :infos, :user, null: false, foreign_key: true
  end
end
