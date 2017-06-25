class Admin::OrdersController < ApplicationController
  # before_action :require_admin
  before_action :find_order, except: [:index]

  def index
    @orders = Order.all.order("created_at ASC")
  end

  def show
    @lineitems = LineItem.where(order: @order)
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to admin_order_path(@order)
    else
      render :edit
    end
  end

  private

  def order_params
    params.require(:order).permit(:orderstatus, :user_id)
  end

  def find_order
    @order = Order.find(params[:id])
  end

  # def require_admin
  #   unless current_user.is_admin?
  #     redirect_to root_path
  #   end
  # end
end
