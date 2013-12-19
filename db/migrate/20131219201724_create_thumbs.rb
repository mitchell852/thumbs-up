class CreateThumbs < ActiveRecord::Migration
  def change
    create_table :thumbs do |t|
      t.boolean :active, default: false
      t.string :image_path
      t.string :label

      t.timestamps
    end
  end
end
