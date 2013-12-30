class AddDescriptionToRows < ActiveRecord::Migration
  def change
    add_column :rows, :description, :text
  end
end
