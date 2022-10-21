class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update destroy]
  before_action :set_brands, only: %i[new create edit update]

  def index
    @products = Product.alphabetical
    @total_product_price = Product.total_price
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url, notice: 'Product was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_url, notice: 'Product was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    @total_product_price = Product.total_price

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.turbo_stream
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :brand_id, :description, :price)
  end

  def set_brands
    @brands = Brand.alphabetical
  end
end
