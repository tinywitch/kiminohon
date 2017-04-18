class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category
      t.string :slug
      t.index :slug, unique: true
      t.integer :created_by

      t.timestamps null: false
    end
  end
end
