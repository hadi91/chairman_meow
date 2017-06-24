class Browse::ShoppingCartsController < ApplicationController

  def show
    @shopping_cart = current_cart
    @line_items = @shopping_cart.line_items
  end

end
