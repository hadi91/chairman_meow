require 'rails_helper'

RSpec.describe Meow::LineItemsController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  # describe 'POST #create' do
  #
  #   let(:product) { create(:product) }
  #
  #   context 'line_item already exists' do
  #
  #     let(:line_item) { create(:line_item, :is_cart_item, product: product, shopping_cart: user.shopping_cart) }
  #     let(:params) { attributes_for(:line_item, quantity: 5) }
  #
  #     before { post :create, params: { product_id: product, line_item: params } }
  #
  #     it { expect(assigns(:line_item)).to eq(line_item) }
  #
  #   end
  #
  # end

  # describe 'PATCH #update' do
  #
  #   let(:product) { create(:product) }
  #   let(:line_item) { create(:line_item, product: product, quantity: 1) }
  #
  #   before { patch :update, params: { line_item_id: line_item, params: { line_item: { quantity: 2 } } } }
  #
  #   it { expect(assigns(:line_item)).to eq(line_item) }
  #
  # end

  describe 'DELETE #destroy' do

    let(:product) { create(:product) }
    let(:line_item) { create(:line_item, product: product) }

    before { delete :destroy, params: { line_item_id: line_item } }

    it { expect(assigns(:line_item)).to eq(line_item) }
    it { expect(assigns(:product)).to eq(product) }
    it { expect(assigns(:product).quantity).to eq(product.quantity + line_item.quantity) }
    it { expect(LineItem.count).to eq(0) }

  end

end
