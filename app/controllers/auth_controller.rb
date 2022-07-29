class AuthController < ApplicationController
  def login
  end

  def signup
    @user = User.new(params_user)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  def params_user
    params.require(:user).permit(:name, :last_name, :phone, :email, :password, :password_confirmation)
  end
end
