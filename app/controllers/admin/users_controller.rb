class Admin::UsersController < ApplicationController
	before_action :signed_in_user, only: [:index,:show,:update]
	before_action :check_role

	def index
		@users = User.get_all_users
	end

	def new
		@user = User.new
	end

	def show
		user_id = params['id']
		@user = User.get_user(user_id)
	end

	def create
		@user = User.create_user(user_create_params)
		if !@user.errors.any?
			flash[:danger] = "Please sign in"
			redirect_to sign_in_path
		else
			render 'new'
		end
	end

	def update
		user_id = params['id']
		@user = User.update_user(user_id,user_update_params)
		if !@user.errors.any?
			flash[:success] = "Profile successfully updated"
			redirect_to :back
		else
			render 'show'
		end
	end

	private
		def user_create_params
			params.require(:user).permit(:username,:email,:password,:password_confirmation)
		end

		def user_update_params
			params.require(:user).permit(:fullname,:email,:password,:role,:address)
		end

end
