class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :update_adm, :destroy]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    if @user
      render json: @user, status: :ok
    else
      render json: { message: "Product not foud!" }, status: :not_found
    end
  end

  def create
    @user = User.new(params_user)
    if @user.save
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(params_user)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :not_found
    end
  end

  def update_adm
    if @user.update_for_adm()
      render json: @user, status: :ok
    else
      render json: { message: "User is adm!" }, status: :ok
    end
  end

  def destroy
    if @user.destroy()
      render json: { message: "User deleted!" }, status: :ok
    else
      render json: @user.errors, status: :not_found
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def params_user
    params.require(:user).permit(:kind, :name, :last_name, :phone, :email, :password, :password_confirmation)
  end
end
