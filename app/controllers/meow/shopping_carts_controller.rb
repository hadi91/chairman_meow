class Meow::ShoppingCartsController < ApplicationController

  def show
    @shopping_cart = current_cart
    @line_items = @shopping_cart.line_items
    @line_items.each do |line_item|
      line_item.destroy if line_item.quantity == 0
    end
  end

end
