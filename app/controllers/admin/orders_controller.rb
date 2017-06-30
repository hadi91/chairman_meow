class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_order, only: [:show, :edit, :update]

  def index
    @orders = Order.all.order("created_at ASC")
  end

  def edit
  end

  def update
    if @order.update(order_params)
      OrderMailer.update_order_status(@order).deliver_now
      redirect_to admin_order_path(@order)
    end
  end

  def show
    @lineitems = LineItem.where(order: @order)
  end

  def neworders
    @orders = Order.neworders
  end

  def pendingpayment
    @orders = Order.pendingpayment
  end

  def paymentapproved
    @orders = Order.paymentapproved
  end

  def awaitingpickup
    @orders = Order.awaitingpickup
  end

  def shipped
    @orders = Order.shipped
  end

  def delivered
    @orders = Order.delivered
  end

  def disputed
    @orders = Order.disputed
  end

  def refunded
    @orders = Order.refunded
  end

  def cancelled
    @orders = Order.cancelled
  end

  private

  def order_params
    params.require(:order).permit(:orderstatus, :user_id)
  end

  def find_order
    @order = Order.find(params[:id])
  end

end
