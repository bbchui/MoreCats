class SessionsController < ApplicationController


  def new
    render :new
  end

  before_action :check_logged_in, only: [:create]

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user.valid?
      login_user!(user)
      redirect_to cats_url
    else
      flash[:error] = user.errors.full_messages
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private

  def check_logged_in
    if !current_user.nil? && current_user.user_name == params[:user][:user_name]
      flash.now[:error] = "You've already logged in!"
      redirect_to new_session_url
    end
  end
end
