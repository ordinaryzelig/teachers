class CategoriesController < ApplicationController

  include RegistrationHelper

  before_action :set_user
  after_action  :mark_registration_action, :only => [:teacher, :donor]

  def edit

  end

  def teacher
    update_category('teacher')
    redirect_to new_teaching_position_path
  end

  def donor
    update_category('donor')
    redirect_to [:edit, @user]
  end

private

  def set_user
    @user = User.find(params[:user_id])
  end

  def update_category(cat)
    @user.update!(:category => cat)
  end

end
