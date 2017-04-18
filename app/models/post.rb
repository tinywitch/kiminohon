class Post < ActiveRecord::Base

	has_many :categories, :through => :categories_posts
	has_many :categories_posts, dependent: :destroy
	has_many :tags, :through => :tags_posts
	has_many :tags_posts, dependent: :destroy

	belongs_to :user
	validates :title, presence: { :message => " is required" }
	validates :img_preview, presence: { :message => " is required" }
	validates :embed_link, presence: { :message => " is required" }
	
end
