# frozen_string_literal: true

class UsersController < ApplicationController
  before_action { verify_authenticated('adm') }
  before_action :set_user, only: %i[show update update_adm destroy]

  def index
    @users = User.all
    render(json: @users)
  end

  def show
    if @user
      render(json: @user)
    else
      render(json: @user.errors, status: :not_found)
    end
  end

  def create
    @user = User.new(params_user)
    if @user.save
      render(json: @user, status: :ok)
    else
      render(json: @user.errors, status: :unprocessable_entity)
    end
  end

  def update
    if @user.update(params_user)
      render(json: @user, status: :ok)
    else
      render(json: @user.errors, status: :not_found)
    end
  end

  def update_adm
    if @user.update({ kind: 1 })
      render(json: @user)
    else
      render(json: @user.errors)
    end
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def params_user
    params.require(:user).permit(:kind, :name, :last_name, :phone, :email, :password,
                                 :password_confirmation)
  end
end
