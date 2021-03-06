class Meow::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @line_item = LineItem.new
  end

  def newest
    @products = Product.last(3)
  end

  def premium
    @products = Product.premium
  end

  def search
    @products = Product.search(params[:search])
    byebug
    redirect_to root_path
  end

end
