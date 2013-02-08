class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def user_is_logged_in
    redirect_to(root_path) unless current_user
    true
  end

end
