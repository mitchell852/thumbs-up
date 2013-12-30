class AddTitleToRows < ActiveRecord::Migration
  def change
    add_column :rows, :title, :string
  end
end
