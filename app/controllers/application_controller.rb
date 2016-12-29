class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_teacher
    current_user.teacher? ? current_user : raise("current_user #{current_user.id} is not a teacher")
  end
  helper_method :current_teacher

  def current_teaching_position
    @current_teaching_position ||= current_teacher.teaching_positions.latest or raise "#{current_teacher.name.inspect} has no TeachingPositions"
  end
  helper_method :current_teaching_position

end
