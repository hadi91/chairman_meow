require 'rails_helper'

RSpec.describe Admin::OrdersController, type: :controller do

  # TODO: Sign in admin
  # TODO: Check non-admin authentication
  let(:admin) { create(:admin) }

  before { sign_in admin }

  describe 'GET #index' do

    let!(:orders) { create_list(:order, 3) }

    before { get :index }

    it { expect(Order.count).to eq(3) }

  end

  describe 'GET #show' do

    let(:order) { create(:order) }

    before { get :show, params: { id: order } }

    it { expect(assigns(:order)).to eq(order) }

  end

  describe 'GET #edit' do

    let(:order) { create(:order) }

    before { get :edit, params: { id: order } }

    it { expect(assigns(:order)).to eq(order) }

  end

  describe 'PUT #update' do

    let(:order) { create(:order) }

    context 'when update is valid' do

      before { put :update, params: { id: order, order: { orderstatus: 'Shipped' } } }

      it { expect(Order.find(order.id).orderstatus).to eq('Shipped') }
      it { expect(response).to redirect_to admin_order_path(order) }

    end

    context 'when update is invalid' do

      before { put :update, params: { id: order, order: { orderstatus: nil } } }

      it { expect(Order.find(order.id).orderstatus).to eq('Pending Payment') }

    end

  end

end
