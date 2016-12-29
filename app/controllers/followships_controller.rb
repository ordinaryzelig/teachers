class FollowshipsController < ApplicationController

  def create
    teacher = User.find(params[:teacher_id])
    current_user.support(teacher) unless current_user.supports?(teacher)
    redirect_to teacher
  end

end
