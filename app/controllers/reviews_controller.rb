class ReviewsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]

	def create
		@book = Book.find(params[:book_id])
		@review = current_user.reviews.build(review_params)
		@review.book_id = @book.id
	    if @review.save
	      	respond_to do |format|
		        format.html { redirect_to book_path(@book.slug) }
		        format.js
		    end
	    else
	      redirect_to book_path(@book.slug)
	    end
	end

	def destroy
		@review= Review.find(params[:id])
		@destroy_id = @review.id
	    @book = @review.book
	    @review.destroy
	    respond_to do |format|
	      format.html { redirect_to post_path(@book.slug) }
	      format.js
	    end
	end

	private
    def review_params
      params.require(:review).permit(:content, :book_id)
    end
end
