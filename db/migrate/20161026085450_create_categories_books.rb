class CreateCategoriesBooks < ActiveRecord::Migration
  def change
    create_table :categories_books do |t|
    	t.integer :book_id
    	t.integer :category_id
    end
  end
end
