class Admin::PostsController < ApplicationController
	before_action :signed_in_user
	before_action :check_role
	
	include PostsHelper

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
		@categories = Category.all
		@tags = Tag.all
	end

	def edit
		@post = Post.find(params[:id])

		@categories = Category.all
		@tags = Tag.all
	end

	def create
		@post = Post.new(post_params)
		@post.embed_link = 'demo'
		@post.img_preview = 'demo'

		if Post.last.nil?
			@post.slug =  '1-' + params['post']['title'].slugify_trim
		else
			post_new_id = (Post.last.id + 1).to_s
			@post.slug = post_new_id + '-' + params['post']['title'].slugify_trim
		end

		@post.user_id = current_user.id
		@post.save
		
		if !params[:categories].nil?
			params[:categories].each do |category|
				CategoriesPost.create(post_id: @post.id, category_id: category)
			end
		end

		if !params[:tags].nil?
			params[:tags].each do |tag|
				TagsPost.create(post_id: @post.id, tag_id: tag)
			end
		end
		redirect_to edit_admin_post_path(@post)
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_update_params)
		if params['post']['slug'].empty?
			@post.slug = @post.id.to_s + '-' + params['post']['title'].slugify_trim
		else
			@post.slug = params['post']['slug'].slugify_trim
		end

		@post.save
		if @post.save
			flash[:notice] = "Post successfully updated"

			@category_relations = CategoriesPost.where(post_id: @post.id).all
			if !@category_relations.nil?
				@category_relations.each do |relation|
					relation.destroy
				end
			end

			if !params[:categories].nil?
				params[:categories].each do |category|
					CategoriesPost.create(post_id: @post.id, category_id: category)
				end
			end

			@tag_relations = TagsPost.where(post_id: @post.id).all
			if !@tag_relations.nil?
				@tag_relations.each do |relation|
					relation.destroy
				end
			end

			if !params[:tags].nil?
				params[:tags].each do |tag|
					TagsPost.create(post_id: @post.id, tag_id: tag)
				end
			end

			redirect_to edit_admin_post_path
		else
			@categories = Category.all
			@tags = Tag.all
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to admin_posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title,:description)
		end

		def post_update_params
			params.require(:post).permit(:title,:description,:embed_link,:img_preview)
		end

end