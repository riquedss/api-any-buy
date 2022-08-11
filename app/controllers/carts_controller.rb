# frozen_string_literal: true

class CartsController < ApplicationController
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

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def params_cart
    params.require(:cart).permit(:product_id)
  end
end
