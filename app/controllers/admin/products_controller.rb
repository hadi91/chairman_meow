class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_product, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product_form = ProductForm.new(@product)
  end

  def create
    byebug
    @product_form = ProductForm.new(@product, product_params)
    if @product_form.save
      redirect_to admin_product_path(@product_form.product)
    else
      render 'new'
    end
  end

  def show
    @product_images = @product.product_images.all
  end

  def edit
    @product_form = ProductForm.new(@product)
  end

  def update
    byebug
    @product_form = ProductForm.new(@product, product_params)
    if @product_form.save
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
    params.require(:product_form).permit(product_attributes: [:breed, :dob, :description, :price, :gender, :quantity, product_images_attributes: [:id, :image, :_destroy]])
  end

  def find_product
    if params[:id]
      @product = Product.find(params[:id])
    else
      @product = Product.new
    end
  end
end
