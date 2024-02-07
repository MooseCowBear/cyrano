class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy, :show]
  before_action only: [:edit, :update, :destroy] do
    confirm_ownership(@product, "Only the creator of a product can modify it.")
  end

  def index
    @products = current_user.products
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to @product, notice: "New product created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @product.destroy

    redirect_to dashboard_path, notice: "Product successfully removed."
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
