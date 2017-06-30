class Meow::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.where(user_id: current_user.id).order("created_at DESC")
  end

  def show
    @order = Order.find(params[:id])
    @line_items = @order.line_items
  end

end
