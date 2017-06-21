class ProductsController < ApplicationController
  def index
    byebug
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
end
