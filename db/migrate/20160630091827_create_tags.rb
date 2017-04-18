class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.string :slug
      t.index :slug, unique: true
      t.integer :created_by

      t.timestamps null: false
    end
  end
end
