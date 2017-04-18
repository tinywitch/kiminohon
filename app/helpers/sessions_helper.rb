module SessionsHelper

	def sign_in(user)
		session[:user_id] = user.id
	end

	 # Remembers a user in a persistent session.
	def remember(user)
	    user.remember
	    cookies.permanent.signed[:user_id] = user.id
	    cookies.permanent[:remember_token] = user.remember_token
	end

	def current_user
		if (user_id = session[:user_id])
		    @current_user ||= User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id])
		    user = User.find_by(id: user_id)
		    if user && user.authenticated?(cookies[:remember_token])
		      sign_in user
		      @current_user = user
		    end
		end
	end

	def current_user?(user)
		user == current_user
	end

	def signed_in?
		!current_user.nil?
	end

	# Forgets a persistent session.
	def forget(user)
	    user.forget
	    cookies.delete(:user_id)
	    cookies.delete(:remember_token)
	end

	# Logs out the current user.
	def sign_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end
	
	# Confirms a logged-in user.
    def signed_in_user
      unless signed_in?
      	store_location
        flash[:danger] = "Please log in."
        redirect_to sign_in_url
      end
    end

    # Redirects to stored location (or to the default)
    def redirect_back_or(default)
    	redirect_to( session[:forwarding_url] || default )
    	session.delete(:forwarding_url)
    end

    def store_location
    	session[:forwarding_url] = request.original_url if request.get?
    end

end
