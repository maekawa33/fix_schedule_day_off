class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to schedules_path, success: t('.success', name: @user.name)
    else
      flash.now[:error] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end
end
