class UsersController < ApplicationController

  def new
    if user.new(user_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.rquire(:user).permit(:name, :email)
  end
end
