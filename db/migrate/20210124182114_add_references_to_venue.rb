class AddReferencesToVenue < ActiveRecord::Migration[6.0]
  def change
  add_reference :venues, :user, foreign_key: true

  end
end
