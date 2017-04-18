class Admin::TagsController < ApplicationController
	before_action :signed_in_user
	before_action :check_role
	
	def index
		@tags = Tag.get_all_tags
		@tag = Tag.new
	end

	def edit
		tag_id = params['id']
		@tag = Tag.get_tag(tag_id)
		if @tag.created_by.nil?
			@username = 'System'
		else
			@username = User.get_user(@tag.created_by).username
		end
	end

	def update
		tag_id = params['id']

		data_update = {}
		data_update['slug'] = params['slug']
		data_update['tag_name'] = params['tag_name']

		if data_update['slug'].empty?
			data_update['slug'] = to_slug(data_update['tag_name'])
		else
			data_update['slug'] = to_slug(data_update['slug'])
		end
		
		@tag = Tag.update_tag(tag_id,data_update)
		if !@tag.errors.any?
			flash['notice'] = "Tag successfully updated"
			redirect_to edit_admin_tag_path
		else
			render 'edit'
		end
	end

	def create
		data_create = {}
		data_create['slug'] = params['slug']
		data_create['tag_name'] = params['tag_name']
		data_create['created_by'] = @current_user.id

		if data_create['slug'].empty?
			data_create['slug'] = to_slug(data_create['tag_name'])
		else
			data_create['slug'] = to_slug(data_create['slug'])
		end
		
		@tag = Tag.create_tag(data_create)

		if !@tag.errors.any?
			flash['notice'] = "Tag created successfully"
			redirect_to admin_tags_path
		else
			@tags = Tag.get_all_tags
			render 'index'
		end
	end

	def destroy
		tag_id = params['id']
	  	Tag.destroy_tag(tag_id)
	 
	  	redirect_to admin_tags_path
	end

end
