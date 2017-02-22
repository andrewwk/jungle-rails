class UsersController < ApplicationController

  def new
    user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      byebug
      flash[:errors] = @user.errors.full_messages
      redirect_to '/signup'
    end
  end

private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password
    )
  end
end
