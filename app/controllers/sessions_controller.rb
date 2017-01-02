class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id

    if @user.registration_complete?
      redirect_to dashboard_path
    else
      if @user.category.present?
        redirect_to [:edit, @user]
      else
        redirect_to [:edit, @user, :category]
      end
    end
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end

end
