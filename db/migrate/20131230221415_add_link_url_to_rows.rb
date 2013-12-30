class AddLinkUrlToRows < ActiveRecord::Migration
  def change
    add_column :rows, :link_url, :string
  end
end
