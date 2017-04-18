class UserController < ApplicationController
  
  	def show_user
    	@user = current_user
    	render 'front_end/show_user'
  	end

  	def update_user
  		if current_user.update_attributes(user_update_params)
  			flash[:alert] = "profile updated"
  			redirect_to :back
  		else
  			flash[:alert] = "profile not updated"
  		end
  	end

  	private
		def user_update_params
			params.require(:user).permit(:fullname,:address)
		end
end
