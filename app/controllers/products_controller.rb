class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy, :show]
  before_action only: [:edit, :update, :destroy] do
    confirm_ownership(@product, "Only the creator of a product can modify it.")
  end

  skip_before_action :authenticate_user!, only: [:index]

  def index
    @writer = User.writer.working.find(params[:writer_id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.writer = current_user

    if @product.save
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "New product created." }
        format.html { redirect_to @product, notice: "New product created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Product updated." }
        format.html { redirect_to @product, notice: "Product updated" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = "Product Deleted" }
      format.html { redirect_to dashboard_path, notice: "Product successfully removed." }
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
