class Admin::ProductsController < ApplicationController
  # before_action :require_admin
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:breed, :dob, :description, :price, :gender, :quantity)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  # def require_admin
  #   unless current_user.is_admin?
  #     redirect_to root_path
  #   end
  # end
end
