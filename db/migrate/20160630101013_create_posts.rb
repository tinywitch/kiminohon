class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.index :slug, unique: true
      t.text :description
      t.string :img_preview
      t.string :embed_link
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
