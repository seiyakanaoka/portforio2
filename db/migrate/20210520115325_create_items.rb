class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :admin_id
      t.integer :genre_id
      t.string :name, null: false
      t.string :item_image_id
      t.text :introduction, null: false
      t.integer :price, null: false
      t.boolean :is_active, default: true, null: false

      t.timestamps
    end
  end
end
