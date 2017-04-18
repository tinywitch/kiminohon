class Admin::BooksController < ApplicationController
	before_action :signed_in_user
	before_action :check_role

	def index
		@books = Book.get_all_books
	end

	def new
		@book = Book.new
		@categories = Category.get_all_categories
		@tags = Tag.get_all_tags
	end

	def edit
		@book = Book.get_book(params[:id])
		@categories = Category.get_all_categories
		@tags = Tag.get_all_tags
	end

	def update
		@book = Book.update_book(params[:id], book_params)
		if @book
			@category_relations = CategoriesBook.where(book_id: @book.id).all
			if !@category_relations.nil?
				@category_relations.each do |relation|
					relation.destroy
				end
			end
			if !params[:categories].nil?
				params[:categories].each do |category|
					CategoriesBook.create(book_id: @book.id, category_id: category)
				end
			end

			@tag_relations = TagsBook.where(book_id: @book.id).all
			if !@tag_relations.nil?
				@tag_relations.each do |relation|
					relation.destroy
				end
			end
			if !params[:tags].nil?
				params[:tags].each do |tag|
					TagsBook.create(book_id: @book.id, tag_id: tag)
				end
			end

			flash[:success] = 'Update successful'
			redirect_to edit_admin_book_path(@book)
		else
			flash[:error] = 'Update failed'
			redirect_to :back
		end
	end

	def create
		# Create slug for book
		book_last = Book.last
		if book_last.nil?
			book_slug = to_slug(book_params[:title])
		else
			book_slug = book_last.id.to_s + '-' + to_slug(book_params[:title])
		end
		data_create = book_params.merge(
			:created_by => session[:user_id],
			:slug =>book_slug
		)

		book = Book.create_book(data_create)

		if book
			if !params[:categories].nil?
				params[:categories].each do |category|
					CategoriesBook.create(book_id: book.id, category_id: category)
				end
			end

			if !params[:tags].nil?
				params[:tags].each do |tag|
					TagsBook.create(book_id: book.id, tag_id: tag)
				end
			end

			flash[:success] = 'Create successful'
			redirect_to edit_admin_book_path(book)
		else
			flash[:error] = 'Create failed'
			redirect_to :back
		end
	end

	def destroy
		delete_result = Book.delete_book(params[:id])
		if delete_result
			flash[:success] = 'Delete successful'
			redirect_to admin_books_path
		else
			flash[:error] = 'Delete failed'
			redirect_to :back
		end
	end

	private
		def book_params
			params.require(:book).permit(:img_path,:title,:author,:description)
		end

end
