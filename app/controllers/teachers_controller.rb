class TeachersController < ApplicationController

  before_action :set_teacher, :only => [:show]

  def show
  end

private

  def set_teacher
    @teacher = User.find(params[:id])
  end

end
