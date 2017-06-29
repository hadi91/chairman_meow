require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do

  # TODO: check non-admin authentication for all actions

  let(:admin) { create(:admin) }

  before { sign_in admin }

  describe 'GET #index' do

    let!(:products) { create_list(:product, 3) }

    before { get :index }

    it { expect(assigns(:products)).to eq(products) }
    it { expect(Product.count).to eq(3) }

  end

  describe 'GET #new' do

    before { get :new }

    it { expect(assigns(:product)).to be_a_new_record }

  end

  describe 'POST #create' do

    before { post :create, params: { product: params } }

    context 'when product#save passes' do

      let(:params) { attributes_for(:product) }

      it { expect(Product.count).to eq(1) }
      it { expect(response).to redirect_to admin_product_path(assigns(:product)) }

    end

    context 'when product#save fails' do

      let(:params) { attributes_for(:product, :invalid) }

      it { expect(Product.count).to eq(0) }
      it { expect(response).to render_template(:new) }

    end

  end

  describe 'GET #show' do

    let(:product) { create(:product) }

    before { get :show, params: { id: product } }

    it { expect(assigns(:product)).to eq(product) }

  end

  describe 'GET #edit' do

    let(:product) { create(:product) }

    before { get :edit, params: { id: product } }

    it { expect(assigns(:product)).to eq(product) }

  end

  describe 'PUT #update' do

    let(:product) { create(:product) }

    context 'when update is valid' do

      before { put :update, params: { id: product, product: { breed: product.breed + 'Edited' } } }

      it { expect(Product.find(product.id).breed.last(6)).to eq('Edited') }
      it { expect(response).to redirect_to admin_product_path(product) }

    end

    context 'when update is invalid' do

      before { put :update, params: { id: product, product: { breed: nil } } }

      it { expect(response).to render_template(:edit) }

    end

  end

  describe 'DELETE #destroy' do

    let(:product) { create(:product) }

    before { delete :destroy, params: { id: product } }

    it { expect(Product.count).to eq(0) }
    it { expect(response).to redirect_to admin_products_path }

  end

end
