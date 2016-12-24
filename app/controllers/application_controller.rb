class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_teacher
    current_user.teacher? ? current_user : raise("current_user #{current_user.id} is not a teacher")
  end

end
