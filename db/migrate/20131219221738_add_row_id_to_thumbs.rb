class AddRowIdToThumbs < ActiveRecord::Migration
  def change
    add_column :thumbs, :row_id, :integer
  end
end
