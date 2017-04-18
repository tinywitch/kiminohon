class CreateTagsPosts < ActiveRecord::Migration
  def change
    create_table :tags_posts do |t|
      t.integer :post_id
      t.integer :tag_id
    end
  end
end
