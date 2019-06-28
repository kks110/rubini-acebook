class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :require_user, :already_liked?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    redirect_to login_path unless logged_in?
  end

  def already_liked?(post)
    post.likes.each do |like|
      return like if current_user.id == like.user_id
    end
    false
  end
end
