# frozen_string_literal: true

class AuthController < ApplicationController
  def login
    @user = User.find_by(email: set_user[:email])
    if @user&.authenticate(set_user[:password])
      token = JsonWebToken::Base.encode(user_id: @user.id)
      render(json: { token: token }, status: :ok)
    else
      render(json: { message: 'Password or E-mail Incorrect' }, status: :unauthorized)
    end
  end

  def signup
    @user = User.new(params_user)
    @cart = @user.build_cart
    if @user.save && @cart.save
      render(json: @user, status: :ok)
    else
      @user.destroy
      render(json: { user: @user.errors, cart: @cart.errors }, status: :unprocessable_entity)
    end
  end

  private

  def params_user
    params.require(:user).permit(:name, :last_name, :phone, :email, :password,
                                 :password_confirmation)
  end

  def set_user
    params.require(:user).permit(:email, :password)
  end
end
