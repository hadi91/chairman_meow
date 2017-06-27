class Admin::ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @product_image = @product.product_images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      params[:product_images]['image'].each do |a|
        @product_image = @product.product_images.create!(:image => a, :product_id => @product.id)
      end
      redirect_to admin_product_path(@product)
    else
      render 'new'
    end
  end

  def show
    @product_images = @product.product_images.all
  end

  def edit
  end

  def update
    if @product.update(product_params)
      params[:product_images]['image'].each do |a|
        @product_image = @product.product_images.create!(:image => a, :product_id => @product.id)
      end
      redirect_to admin_product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:breed, :dob, :description, :price, :gender, :quantity, product_images_attributes: [:id, :product_id, :images])
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
