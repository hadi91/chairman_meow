class Meow::ShoppingCartsController < ApplicationController

  def show
    @shopping_cart = current_user.shopping_cart
    @line_items = @shopping_cart.line_items
  end

end
