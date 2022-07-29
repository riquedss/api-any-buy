class ProductsController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @products = Product.all
    render json: @products, status: :ok
  end

  def show
    if @product
      render json: @product, status: :ok
    else
      render json: { message: "Product not foud!" }, status: :not_found
    end
  end

  def create
    @product = Product.new(params_user)
    if @product.save
      render json: @product, status: :ok
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(params_user)
      render json: @product, status: :ok
    else
      render json: @product.errors, status: :not_found
    end
  end

  def destroy
    if @product.destroy()
      render json: { message: "Product deleted!" }, status: :ok
    else
      render json: @product.errors, status: :not_found
    end
  end

  private
  def set_user
    @product = Product.find(params[:id])
  end

  def params_user
    params.require(:product).permit(:description, :kind, :url_image, :price)
  end
end
