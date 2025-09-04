class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user, :user_signed_in?

  private

  def authenticate_user!
    redirect_to root_path unless session[:user_id]
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(uid: session[:user_id])
  end

  def user_signed_in?
    !!session[:user_id]
  end


  def require_login
    return if current_user

    redirect_to root_url
  end
end
