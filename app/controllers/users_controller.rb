class UsersController < ApplicationController

  include RegistrationHelper

  before_action :set_user, only: [:show, :edit, :update]
  before_action :mark_registration_action, :only => [:edit]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html do
          flash[:notice] = 'User was successfully updated.'
          if amid_registration?
            redirect_to dashboard_path
          else
            redirect_to @user
          end
        end
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params
      .require(:user)
      .permit(
        :title,
        :first_name,
        :last_name,
        :category,
      )
  end

end
