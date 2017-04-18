class CreateTagsBooks < ActiveRecord::Migration
  def change
    create_table :tags_books do |t|
    	t.integer :book_id
    	t.integer :tag_id
    end
  end
end
