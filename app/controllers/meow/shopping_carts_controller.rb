class Meow::ShoppingCartsController < ApplicationController

  def show
    @shopping_cart = current_cart
    @line_items = @shopping_cart.line_items
    @line_items.each do |line_item|
      if line_item.quantity == 0
        line_item.destroy
      end
    end
  end

end
