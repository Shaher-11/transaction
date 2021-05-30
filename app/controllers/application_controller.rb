class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:author_id]) if session[:author_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    redirect_to login_path unless logged_in?
  end
end
