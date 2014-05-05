module SessionsHelper

	# signs in user and creates session cookie
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  # authorization: signed_in_user is called in a before_filter callback in account and transaction controllers for view/create/update/delete permissions

  def signed_in_user
    unless signed_in?
      # if not signed in, save current location in session object to be able to redirect after successful sign in.
      session[:return_to] = request.url
      # prompt sign in page
      redirect_to signin_path, notice: "please sign in."
    end
  end

  # signs out user by deleting @current_user and session cookie
  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
  end

  # getter and setter for @current_user
  def current_user=(user)
    @current_user = user
  end

  # check session cookie for user record
  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

end
