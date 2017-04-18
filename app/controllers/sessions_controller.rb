class SessionsController < ApplicationController
  def view_sign_in
    if signed_in?
      redirect_to admin_path
    else
      render '/sign_in'
    end
  end

  def create
  	user = User.find_by(username: params[:session][:username].downcase)
  	if user
	  	if user.authenticate(params[:session][:password])
	  		sign_in user
	  		params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        if user.is_admin?
          redirect_back_or admin_books_path
        else
          redirect_back_or books_path
        end
	  	else
	  		flash[:danger] = 'Password is not correct!'
	  		redirect_to :back
		end
	else
  		flash[:danger] = "Don't exist this user"
  		redirect_to :back
  	end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_url
  end

end
