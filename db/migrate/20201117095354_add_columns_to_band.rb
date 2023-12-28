class AddColumnsToBand < ActiveRecord::Migration[6.0]
  def change
    add_column :bands, :yt_video_one, :string
    add_column :bands, :yt_video_two, :string
    add_column :bands, :yt_video_three, :string
    add_column :bands, :yt_video_destak, :string
    add_column :bands, :destak_discr, :string
  end
end
