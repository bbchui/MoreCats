class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:error] = @user.errors.full_messages
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
