class AddCommentToFestivals < ActiveRecord::Migration[6.0]
  def change
    add_column :festivals, :comment, :string
  end
end
