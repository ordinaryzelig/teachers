class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    session[:user_id] = params[:user][:id]
    redirect_to dashboard_path
  end

end
