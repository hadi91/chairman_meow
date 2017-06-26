class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_cart
    if current_user
      if session['cart']
        visitor_cart = ShoppingCart.find(session['cart'])
        line_items = visitor_cart.line_items
        line_items.each do |line_item|
          line_item.update(shopping_cart_id: current_user.shopping_cart.id)
          line_item.save
        end
        visitor_cart.destroy
        session.delete('cart')
      end
      current_user.shopping_cart
    else
      unless session['cart']
        cart = ShoppingCart.new
        cart.save
        session['cart'] = cart.id
      end
      ShoppingCart.find(session['cart'])
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :username, :telephone_number, :address, :provider, :uid])
  end

end
