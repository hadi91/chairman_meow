require 'rails_helper'

RSpec.describe Meow::ProductsController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do

    let!(:products) { create_list(:product, 3) }

    before { get :index }

    it { expect(assigns(:products)).to eq(products) }

  end

  describe 'GET #show' do

    let(:product) { create(:product) }

    before { get :show, params: { id: product } }

    it { expect(assigns(:product)).to eq(product) }
    it { expect(assigns(:line_item)).to be_a_new_record }

  end

  describe 'GET #newest' do

    let!(:products) { create_list(:product, 4) }

    before { get :newest }

    it { expect(assigns(:products)).to eq(Product.last(3)) }

  end

  describe 'GET #premium' do

    let!(:products) { create_list(:product, 3) }
    let!(:product) { create(:product, price: 4000) }

    before { get :premium }

    it { expect(assigns(:products)).to match_array(Product.last) }

  end

end
