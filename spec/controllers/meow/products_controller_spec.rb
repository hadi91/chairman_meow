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

end
