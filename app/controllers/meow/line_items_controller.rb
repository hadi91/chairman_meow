class Meow::LineItemsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @shopping_cart = current_cart
    @line_item = LineItem.find_by(product: @product, shopping_cart: @shopping_cart)

    if @line_item
      @line_item.quantity += line_item_params[:quantity].to_i
      @line_item.save
      @product.quantity -= line_item_params[:quantity].to_i
      @product.save
      redirect_to meow_shopping_cart_path
    else
      @line_item = LineItem.new(product: @product, quantity: line_item_params[:quantity], shopping_cart: @shopping_cart)

      if @line_item.save
        @product.quantity -= @line_item.quantity
        @product.save
        redirect_to meow_shopping_cart_path
      else
        redirect_to meow_product_path(product_id: @product)
        flash[:notice] = 'This cat is no longer available. Sorry!'
      end
    end
  end

  def update
    @line_item = LineItem.find(params[:line_item_id])
    difference = @line_item.quantity - line_item_params[:quantity].to_i
    @line_item.quantity -= difference
    @line_item.save
    @product = @line_item.product
    @product.quantity += difference
    @product.save
    redirect_to meow_shopping_cart_path
  end

  def destroy
    @line_item = LineItem.find(params[:line_item_id])
    @product = @line_item.product
    @product.quantity += @line_item.quantity
    @product.save
    @line_item.destroy
    redirect_to meow_shopping_cart_path
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity)
  end

end
