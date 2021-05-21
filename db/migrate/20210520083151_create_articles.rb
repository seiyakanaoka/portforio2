class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|

      t.integer :admin_id
      t.string :article_image_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
