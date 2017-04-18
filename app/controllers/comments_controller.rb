class CommentsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]

	def create
		@review = Review.find(params[:review_id])
		@comment = current_user.comments.build(comment_params)
		@comment.review_id = @review.id
	    if @comment.save
	      respond_to do |format|
		      format.html { redirect_to book_path(@review.book.slug) }
		      format.js
		    end
	    else
	      redirect_to book_path(@post.slug)
	  	end
	end

	def destroy
		@comment= Comment.find(params[:id])
		@destroy_id = @comment.id
	    @review = @comment.review
	    @comment.destroy
	    respond_to do |format|
	      format.html { redirect_to book_path(@review.book.slug) }
	      format.js
	    end
	end

	private
    def comment_params
      params.require(:comment).permit(:content, :review_id)
    end
end
