require 'rails_helper'

RSpec.describe Meow::OrdersController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do

    let(:orders) { create_list(:order, 3, user: user) }

    before { get :index, params: { id: user } }

    #it { expect(Order.count).to eq(3) }

  end

  describe 'GET #show' do

    let(:order) { create(:order) }

    before { get :show, params: { id: order } }

    it { expect(assigns(:order)).to eq(order)}

  end

end
