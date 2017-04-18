
class Category < ActiveRecord::Base

	has_many :posts, :through => :categories_posts
	has_many :categories_posts, dependent: :destroy

	has_many :books, :through => :categories_books
	has_many :categories_books, dependent: :destroy

	validates :slug, uniqueness: { :message => " already exists" }
	validates :category, presence: { :message => " is required" }

	def self.get_all_categories
		self.all
	end

	def self.get_category(category_id)
		self.find(category_id)
	end

	def self.get_category_by_slug(category_slug)
		self.find_by(slug: category_slug)
	end

	def self.update_category(category_id,data_update)

		if data_update['slug'].empty?
			data_update['slug'] = ApplicationController.helpers.to_slug(data_update['category'])
		else
			data_update['slug'] = ApplicationController.helpers.to_slug(data_update['slug'])
		end

		category = self.find(category_id)
		category.category = data_update['category']
		category.slug = data_update['slug']
		category.save

		return category
	end

	def self.create_category(data_create)

		if data_create.kind_of?(Array)
			data_create.each do |data|
				self.create_category_func(data)
			end
		else
			self.create_category_func(data_create)
		end
	end

	def self.create_category_func(data)
		if data['slug'].empty?
			data['slug'] = ApplicationController.helpers.to_slug(data['category'])
		else
			data['slug'] = ApplicationController.helpers.to_slug(data['slug'])
		end

		category = self.new
		category.category = data['category']
		category.slug = data['slug']
		category.created_by = data['created_by']
		category.save

		return category
	end

	def self.destroy_category(category_id)
		category = self.find(category_id)
		category.destroy

		return category
	end
end
