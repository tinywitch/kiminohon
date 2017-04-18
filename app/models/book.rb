class Book < ActiveRecord::Base
	belongs_to :user, foreign_key: 'created_by'

	has_many :categories, :through => :categories_books
	has_many :categories_books, dependent: :destroy
	has_many :tags, :through => :tags_books
	has_many :tags_books, dependent: :destroy
	has_many :reviews

	mount_uploader :img_path, ImageUploader
	searchkick autocomplete: ['title','author']
	
	ratyrate_rateable "quality"
	def self.get_all_books()
		Book.all.order(created_at: :desc)
	end

	def self.get_books(book_number)
		Book.all.order(created_at: :desc).take(book_number)
	end

	def self.get_book(book_id)
		book = self.find_by(id: book_id)
	end

	def self.get_book_by_slug(book_slug)
		book = self.find_by(slug: book_slug)
	end

	def self.create_book(data_create)
		book = self.new(data_create)
		book.save ? book : false
	end

	def self.update_book(book_id, data_update)
		book = self.find_by(id: book_id)
		if !book.nil?
			book.update(data_update) ? book : false
		else
			return false
		end
	end

	def self.delete_book(book_id)
		book = self.find_by(id: book_id)
		if !book.nil?
			book.destroy ? true : false
		else
			return false
		end
	end
end
