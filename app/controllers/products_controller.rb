# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action only: %i[create update destroy] do verify_authenticated('adm') end
  before_action only: %i[index show] do verify_authenticated end
  before_action :set_products, only: %i[show update destroy]

  def index
    @products = list_products(params[:type])
    render(json: @products)
  end

  def show
    render(json: @product)
  end

  def create
    @product = Product.new(params_product)
    if @product.save
      render(json: @product)
    else
      render(json: @product.errors, status: :unprocessable_entity)
    end
  end

  def update
    if @product.update(params_product)
      render(json: @product)
    else
      render(json: @product.errors, status: :unprocessable_entity)
    end
  end

  def destroy
    @product.destroy
  end

  private

  def set_products
    @product = Product.find(params[:id])
  end

  def params_product
    params.require(:product).permit(:description, :kind, :url_image, :price)
  end

  def list_products(type)
    case type
    when 'konsol_game'
      Product.konsol_game
    when 'laptop'
      Product.laptop
    when 'smartphone'
      Product.smartphone
    else
      Product.all
    end
  end
end
