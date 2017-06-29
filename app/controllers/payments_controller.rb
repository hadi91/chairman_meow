class PaymentsController < ApplicationController
  TRANSACTION_SUCCESS_STATUSES = [
    Braintree::Transaction::Status::Authorizing,
    Braintree::Transaction::Status::Authorized,
    Braintree::Transaction::Status::Settled,
    Braintree::Transaction::Status::SettlementConfirmed,
    Braintree::Transaction::Status::SettlementPending,
    Braintree::Transaction::Status::Settling,
    Braintree::Transaction::Status::SubmittedForSettlement,
  ]

  def new
    @client_token = Braintree::ClientToken.generate
    @shopping_cart = current_user.shopping_cart
  end

  def show
    @transaction = Braintree::Transaction.find(params[:id])
    @result = _create_result_hash(@transaction)
  end

  def create
    @order = Order.create(user: current_user)
    OrderMailer.order_confirmation(@order).deliver_now
    @shopping_cart = current_user.shopping_cart
    @line_items = @shopping_cart.line_items

    @line_items.each do |lineitem|
      lineitem.order_id = @order.id
      lineitem.save
      lineitem.shopping_cart_id = nil
      lineitem.save
    end

    amount = params["amount"] # In production you should not take amounts directly from clients
    nonce = params["payment_method_nonce"]

    result = Braintree::Transaction.sale(
      amount: amount,
      payment_method_nonce: nonce,
      :options => {
        :submit_for_settlement => true
      }
    )

    if result.success? && result.transaction
      @order.orderstatus = 2
      @order.save
      redirect_to payment_path(result.transaction.id)
      OrderMailer.order_confirmation(@order).deliver_now
    else
      @order.orderstatus = 1
      @order.save
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to new_payment_path
    end
  end

  private

  def _create_result_hash(transaction)
    status = transaction.status

    if TRANSACTION_SUCCESS_STATUSES.include? status
      result_hash = {
        :header => "Payment Success!",
        :icon => "success",
        :message => "Your test transaction has been successfully processed. Your order will be processed and you will be updated via email shortly."
      }
    else
      result_hash = {
        :header => "Payment Declined",
        :icon => "fail",
        :message => "Your card has been rejected. Please pay your bills and stop spending money you dont have!"
      }
    end
  end
end
