class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include SessionsHelper
  include ApplicationHelper
  private
  def check_role
  	if signed_in?
  		unless current_user.is_admin?
  			# flash[:danger]="Ban khong co quyen o day"
  			redirect_to root_path
  		end
  	end
  end
  def generate_categories
    @categories = Category.get_all_categories
  end
end
