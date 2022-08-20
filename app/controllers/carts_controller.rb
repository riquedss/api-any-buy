# frozen_string_literal: true

class CartsController < ApplicationController
  before_action only: %i[update] do @user = verify_authenticated('adm') end
  before_action except: %i[update] do @user = verify_authenticated end
  before_action :set_cart, only: %i[show update]

  def index
    @carts = Cart.all
    render(json: @carts)
  end

  def show
    render(json: @cart)
  end

  def update
    if @cart.update(params_cart)
      render(json: @cart)
    else
      render(json: @cart.errors, status: :unprocessable_entity)
    end
  end

  def add_product_in_cart
    @product = Product.find(params[:id])
    render(json: @product.errors) unless @product

    @cart_user = @user.cart

    @storage = Storage.new({ product_id: params[:id], cart_id: @cart_user.id })
    render(json: @cart_user.storages, status: :created) if @storage.save
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def params_cart
    params.require(:cart).permit(:product_id)
  end
end
